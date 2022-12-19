# ---------------------------------------------------------------
# bench.py
# pre/post processing and processor interface for monadic grammar
# -Cem Bozsahin, 2022, Ankara, Datça, Şile
# ---------------------------------------------------------------

from prompt_toolkit import prompt       
from prompt_toolkit import PromptSession
from prompt_toolkit.history import FileHistory
from os.path import expanduser
import re
import os
import sys
import platform
import shutil
import pprint
from   contextlib import redirect_stdout
from   datetime import datetime
from   random import randint
from   sly import Lexer, Parser  # pre/post processor is in Python
import cl4py                     # processor is in Lisp

# global variables, all beginning with one underscore
# actually python passes big values ok since ref is shared, but do we really want so many args?

_lisp = cl4py.Lisp()              # get access to Lisp for processing
_cl   = _lisp.find_package('CL')  # get access to CL utilities
_ws     = ' '
try:
    _lisptype = _lisp.function('lisp-implementation-type')() + _ws + _lisp.function('lisp-implementation-version')()
except Exception:
    _lisptype = 'unknown'

_overscore = chr(8254)        # this is also the invisible 'declaration terminator'
_underscore= '_'
_prompt = '/'+_overscore+'\ ' # the pagoda
_online = False               # parser output control
_version = '0.3'
_vdate = 'October 15, 2022'
# 3 built-in extensions recognized by MG
_binext = '.bin'              # binary (lisp code) extension
_supext = '.sup'              # native format extension for supervision files
_logext = '.log'
_punc   = ';:,.|~!@#$%^&*?'   # list of punctuation as data -- individually tokenized and wrapped in double quote
                              # assuming max size of grammar is 1 million entries. This is a lazy list in p3.
_keys = {}                    # current keys
_grammar = {}                 # currently loaded grammar parsed into internal representation
_latestgr = ''                # latest loaded grammar --used to mark SC rules per grammar, which can be g or m loaded
_supervision = {}
_info = {}
_indexed = False              # whether an entry is already indexed; need this unique indexing
_targetprefix = '!'           # _target.. for generating symbol maps for the Lisp processor
_targetmod = {'.': 'ALL', '+': 'CROSS', '*': 'STAR', '^': 'HARMONIC'}
_targetdir = {'/': 'FS', '\\': 'BS', '//': 'FS', '\\\\': 'BS'}
_targetslashlex = {'/': False, '\\': False, '//': True, '\\\\': True}

# Apart from Lexer and Parser, there is NO class definition, to make everything natively printable.
#   And, these two classes are required by the sly module. 
# There are two lexers and two parsers, one each for grammar and supervision files

#########  
# Internal Representation
#
# Internal grammar's AST
#
# AST operators. It is easier to fix them globally than remembering their value types


_el    = _overscore+'el'    # prefixed with non-date to avoid name collision with data
_form  = _overscore+'form'    
_cat   = _overscore+'cat'
_scom  = _overscore+'scom'
_lcom  = _overscore+'lcom'
_dom   = _overscore+'dom'
_range = _overscore+'range'
_dir   = _overscore+'dir'
_basic = _overscore+'basic'
_lam   = _overscore+'lam'
_app   = _overscore+'app'
_arule = _overscore+'arule'
_srule = _overscore+'srule'
_apair = _overscore+'apair'
_spair = _overscore+'spair'  
_index = _overscore+'index'
_op    = 0
_l     = 1
_r     = 2

# 
# All grammar STRUCTURES are ternary and binary native python dictionaries
#  in the form {_op: operator, _l : left element, _r : right element}

# valuation is, for op/l/r order
#
# {_el,    _form, _cat}      
# {_form,  string of items, one value}  one value is False in _spair     
# {_cat,   _scom, _lcom}
# {_scom,  _range, _dom}
# {_scom,  _basic}
# {_lcom,  _lam}
# {_lcom,  _app}
# {_lcom,  val}
# {_dom,   _dir, _basic}
# {_dom,   _dir, _range}
# {_range, _scom}
# {_dir,   slash, modality}
# {_dir,   slash, modality}
# {_basic, val, list of feature followed by value}
# {_lam,   varname, _app}
# {_lam,   varname, val}
# {_lam,   varname, _lam}
# {_app,   _app, val}
# {_app,   val, val}
# {_app,   val, _app}
# {_arule, rulenameval, _apair}
# {_srule, rulename, _choice}
# {_apair, _cat, _cat}
# {_spair, _form, _cat}              not in IR -> code list (for IR construction only)
# {_index, an index, a parameter}    not in IR -> code list

# 
# make functions.
#               
def mk_entry_sup (form, meaning):
    global _supervision
    _supervision[form] = ir_to_lisp(meaning)
    return True

def mk_entry (element, index):  
    global _grammar, _online, _op, _l, _r
    if _online:
        pp = pprint.PrettyPrinter(indent=2, width=80, stream=sys.stdout)
        pp.pprint(element)
    elif element[_op] == _el:
        _grammar['elements'][(index[_l], index[_r], element[_l][_l])] =  element  
    elif element[_op] == _arule:    # keep them in grammar but separately dict'd
        _grammar['arules'][(index[_l], index[_r], element[_l], element[_l])] =  element   # a 4-tuple 
    elif element[_op] == _srule:    # compile them into two native entries of type _el; make another key
        _grammar['elements'][(index[_l], index[_r], element[_l][_l][_l])] = mk_bin(_el, mk_bin(_form, element[_l][_l][_l], element[_l][_op]), element[_l][_l][_r])
        _grammar['elements'][(make_up_an_index(), index[_r], element[_l][_r][_l])] = mk_bin(_el, mk_bin(_form, element[_l][_r][_l], element[_l][_op]), element[_l][_r][_r])
    else:
        print('** UKNOWN ENTRY TYPE: ', element[_op])
    return True

def mk_bin (op, left, right):
    global _op, _l, _r
    return {_op: op, _l: left, _r: right}


def mk_un (op, left):
    global _op, _l
    return {_op: op, _l: left}

# get functions, to go with make functions

# End of AST
#
############

def init_sup():
    global _supervision
    _supervision.clear()

def init_grammar():
    global _grammar, _info
    _grammar.clear()
    _info.clear()
    _keys.clear()
    _info = { 'name': 'unknown', 'el':0, 'srule':0, 'arule':0, 'basic': {}, 'quoted': {}, 'special': {}, 'features' : {}, 'values': {}, 'pos': {} }  # basic cat inventory is synthetic, this ain't GG
    _grammar['arules'] = {}     # keep arules separate, srules are compiled into elements
    _grammar['elements'] = {}   # all other entries under this label  
    
def make_up_an_index():              # return the first non-colliding random index
    #return(choice([i for i in _keyrange if i not in _keys]))   # this takes too long, and not lazy
    global _keys
    i = 1
    haveit = True
    ix = randint(1,999999)      
    while i <= 999999:                  # i avoid for loop and range here, since i'm not sure of laziness of range() for generating one million values
        try:                            #   since we are most likely to not need MANY of them
            if _keys[ix]:           
                ix = randint(1,999999) 
            pass
        except KeyError:
            haveit = False
            break
        i += 1
    if not haveit:
        return ix
    else:
        return randint(-999999,-1)   # this has much less chance of collision, assuming it is done very occasionally-still a six digit number max.

###########
# Parsing/tokenization
#
# All data parsing and tokenization goes here, one for grammar, one for supervision, one for input to analysis
#

class SUPLexer(Lexer): # Token types for supervision pairs
    tokens = {ID, BANGID, ITEM, CORR, CATEND, DOT, LP, RP, BS, END, ANY}

    ignore = ' \t'            # whitespace
    ignore_comment = r'\%.*'  # ignore everything starting with %
    ignore_newline = r'\n+'   # ignore empty lines
     
    ITEM   = r'\|.*\|'                                     
    BANGID = r'\![0-9a-zA-Z_\-]*[a-zA-Z][0-9a-zA-Z_\-\+]*'  
    ID     = r'[0-9a-zA-Z_\-]*[a-zA-Z][0-9a-zA-Z_\-\+]*'        # (at least one alphabetical symbol for cat symbols)
    CORR   = r'\:'
    CATEND = r'\;'
    DOT    = r'\.'          # modalities also use this
    LP     = r'\('
    RP     = r'\)'
    BS     = r'\\'            # lambda also uses this
    END    = _overscore                               # not visible to user.
    ANY    = r'.'             # in case nothing matches (last chance before error)

    def error(self, tok):                     # best to avoid adding this to token types
        print("Unknown supervision character '%s'" % tok.value[0])
        self.index += 1

class MGLexer(Lexer):  # Token types of monadic grammar specifications
    tokens = { ID, BANGID, RNAME, SPECID, ITEM, M, SRULE, ARULE, END, CATEND, LSQ, RSQ, COM, CORR, DOT, SQCAT, DQCAT,
               LP, RP, LB, RB, EQ, BS, FS, BDS, FDS, MODHAR, MODAPP,
               MODX, VARVAL, INUM, RNUM, ANY}

    ignore = ' \t'            # whitespace
    ignore_comment = r'\%.*'  # ignore everything starting with %
    ignore_newline = r'\n+'   # ignore empty lines
     
    ITEM   = r'\|.*\|'                                     
    SRULE  = r'\<\-\-\>'
    ARULE  = r'\-\-\>'                                            # to avoid -- becoming ID 
    SPECID = r'@[0-9a-zA-Z_\-\+]*[a-zA-Z][0-9a-zA-Z_\-\+]*'       # special IDs, app only
    RNAME  = r'\#[0-9a-zA-Z_\-\+]*[a-zA-Z][0-9a-zA-Z_\-\+]*'      # rule names start with #
    BANGID = r'\![0-9a-zA-Z_\-]*[a-zA-Z][0-9a-zA-Z_\-\+]*'  
    ID     = r'[0-9a-zA-Z_\-]*[a-zA-Z][0-9a-zA-Z_\-\+]*'      # (at least one alphabetical symbol for cat symbols not beginning with +, which is a modality, not part of basic cat name)
    RNUM   = r'\d+\.\d+'
    INUM   = r'\d+'
    END    = _overscore                               # RHS defined globally, not visible to user.
                                                      # Suffixed to every line in tokenization
                                                      # to avoid end-of-line EOF confusion of the tokenizer
    M      = r'\:\:'
    CORR   = r'\:'
    CATEND = r'\;'
    LSQ    = r'\<'
    RSQ    = r'\>'
    COM    = r'\,'
    DOT    = r'\.'          # modalities also use this
    SQCAT  = r'\'.*\''      # quoted categories can be any size and content
    DQCAT  = r'".*"'        # (quote can be single or double)
    LP     = r'\('
    RP     = r'\)'
    LB     = r'\['
    RB     = r'\]'
    EQ     = r'\='
    BDS    = r'\\\\'
    FDS    = r'\/\/'
    BS     = r'\\'            # lambda also uses this
    FS     = r'\/'
    MODHAR = r'\^'
    MODAPP = r'\*'
    MODX   = r'\+'
    VARVAL = r'\?[0-9a-zA-Z_\-\+]*[a-zA-Z][0-9a-zA-Z_\-\+]*'  # variable name for term unification
    ANY    = r'.'             # in case nothing matches (last chance before error)

    def error(self, tok):                     # best to avoid adding this to token types
        print("Unknown character '%s'" % tok.value[0])
        self.index += 1

class SUPParser(Parser):      # the syntax of |string| : meaning; pairs
    #debugfile = 'lalr-sup'+ _logext
    tokens = SUPLexer.tokens

    @_('ITEM CORR lcom CATEND t')
    def s(self, p):
        return mk_entry_sup(p[0][1:-1], p.lcom)

    @_('lterm')
    def lcom(self, p):
        return p.lterm

    @_('bodys')
    def lcom(self, p):
        return p.bodys

    @_('bodys body') 
    def bodys(self, p):
        global _app
        return mk_bin(_app, p.bodys, p.body)

    @_('body')
    def bodys(self, p):
        return p.body

    @_('BS ID [ DOT ] lbody')
    def lterm(self, p):
        global _lam
        return mk_bin(_lam, p[1], p.lbody)

    @_('lterm')
    def lbody(self, p):
        return p.lterm

    @_('ID')
    def body(self, p):
        return p[0]

    @_('BANGID')
    def body(self, p):
        return p[0]

    @_('ANY')
    def body(self, p):
        return p[0]

    @_('LP lcom RP')
    def body(self, p):
        return p.lcom

    @_('bodys')
    def lbody(self, p):
        return p.bodys

    @_('END')
    def t(self, p):
        return True        

    def error(self, p):     
        #if EOFError:
        #    print('end of supervision entry has been reached unexpectedly')
        pass

class MGParser(Parser):       # the syntax of MG entries 
    #debugfile = 'lalr'+ _logext
    tokens = MGLexer.tokens
    global _keys, _indexed, _grammar, _info

    @_('l catend t')
    def s(self, p):
        return mk_entry(p.l, p.catend)

    @_('ITEM pos M c')        # first item is form (get rid of |), second one is POS
    def l(self, p):
        global _info, _online, _el, _form
        if not _online:
            _info['el'] += 1
        return mk_bin(_el, mk_bin(_form, _ws.join(p[0][1:-1].split()), p.pos), p.c)

    @_('ID')
    def pos(self, p):
        global _info, _online
        if not _online:
            _info['pos'][p[0]] = True
        return p[0]

    @_('SQCAT')                  # quotes dont go into data -- already a string
    def pos(self, p):
        global _info, _online
        if not _online:
            _info['pos'][p[0][1:-1]] = True
        return _ws.join(p[0][1:-1].split())

    @_('r')
    def l(self, p):
        return p.r

    @_('END')
    def t(self, p):
        return True        

    @_('LSQ INUM COM RNUM RSQ CATEND')  
    def catend(self, p):
        global _keys, _indexed, _index
        _indexed = True   # it was already indexed
        _keys[p[1]] = True  # do not generate an index which is already specified
        return mk_bin(_index, int(p[1]), float(p[3]))

    @_('CATEND')         # entries are indexed in source grammar, don't let user index them
    def catend(self, p):
        global _keys, _indexed, _index
        ix = make_up_an_index()
        _indexed = False   # we generated the index
        _keys[ix] = True   # next time it won't be generated
        return mk_bin(_index, ix, 1.0) # default parameter value

    @_('RNAME spair SRULE spair')
    def r(self, p):
        global _online, _info, _srule
        if not _online:
            _info['srule'] += 1
        return mk_un(_srule, mk_bin(p[0][1:], p.spair0, p.spair1))  # CL hates sharp in input, take it out of name

    @_('RNAME apair ARULE apair')
    def r(self, p):
        global _online, _info, _apair, _arule
        if not _online:
            _info['arule'] += 1
        return  mk_bin(_arule, p[0][1:], mk_bin(_apair, p.apair0, p.apair1)) # CL hates sharp in input, take it out of name

    @_('LP ids COM c RP')      
    def spair(self, p):
        global _spair
        return mk_bin(_spair, p.ids, p.c)

    @_('LP c RP')
    def apair(self, p):
        return p.c

    @_('ids ID')
    def ids(self, p):
        return p.ids+_ws+p[1]

    @_('ID')
    def ids(self, p):
        return p[0]

    @_('scom CORR lcom')
    def c(self, p):
        global _cat, _lcom, _scom
        return mk_bin(_cat, mk_un(_scom, p.scom), mk_un(_lcom, p.lcom))

    @_('basic')
    def scom(self, p):
        return p.basic

    @_('parentd')
    def scom(self, p):
        return p.parentd

    @_('scom slash last')
    def scom(self, p):
        global _range, _dom
        return mk_bin(_range, p.scom, mk_bin(_dom, p.slash, p.last))

    @_('basic')
    def last(self, p):
        return p.basic

    @_('parentd')
    def last(self, p):
        return p.parentd

    @_('dir mod')
    def slash(self, p):
        global _dir
        return mk_bin(_dir, p.dir, p.mod)

    @_('dir')
    def slash(self, p):
        global _dir
        return mk_bin(_dir, p.dir, '.')

    @_('BS')
    def dir(self, p):
        return p[0]

    @_('FS')
    def dir(self, p):
        return p[0]

    @_('FDS')
    def dir(self, p):
        return p[0]

    @_('BDS')
    def dir(self, p):
        return p[0]

    @_('DOT')             
    def mod(self, p):
        return p[0]

    @_('MODHAR')
    def mod(self, p):
        return p[0]

    @_('MODAPP')
    def mod(self, p):
        return p[0]

    @_('MODX')
    def mod(self, p):
        return p[0]

    @_('ID feats')
    def basic(self, p):
        global _info, _online, _basic
        if not _online:
            _info['basic'][p[0]] = True
        if p.feats:
            return mk_bin(_basic, p[0], p.feats)
        else:
            return mk_bin(_basic, p[0], [])

    @_('SQCAT')
    def basic(self, p):
        global _info, _online, _basic
        if not _online:
            _info['quoted'][p[0]] = True
        return mk_bin(_basic, p[0], 'quoted')

    @_('DQCAT')
    def basic(self, p):
        global _info, _online, _basic
        if not _online:
            _info['quoted'][p[0]] = True
        return mk_bin(_basic, p[0], 'quoted')

    @_('SPECID')
    def basic(self, p):
        global _info, _online, _basic
        if not _online:
            _info['special'][p[0]] = True
        return mk_bin(_basic, p[0], 'special')

    @_('LP scom RP')
    def parentd(self, p):
        return p.scom

    @_('LB eqns RB')
    def feats(self, p):
        return p.eqns

    @_('empty')
    def feats(self, p):
        pass

    @_('')
    def empty(self, p):
        pass

    @_('eqns COM eqn')
    def eqns(self, p):
        return p.eqns+p.eqn

    @_('eqn')
    def eqns(self, p):
        return p.eqn

    @_('ID EQ val')
    def eqn(self, p):
        global _info, _online
        if not _online:
            _info['features'][p[0]] = True
            _info['values'][p[2]] = True
        return [[p[0], p.val]]

    @_('ID')
    def val(self, p):
        return p[0]

    @_('INUM')
    def val(self, p):
        return p[0]

    @_('VARVAL')
    def val(self, p):
        return p[0]

    @_('ANY')
    def val(self, p):
        return p[0]

    @_('bodys')
    def lcom(self, p):
        return p.bodys

    @_('lterm')
    def lcom(self, p):
        return p.lterm

    @_('bodys body') 
    def bodys(self, p):
        global _app
        return mk_bin(_app, p.bodys, p.body)

    @_('body')
    def bodys(self, p):
        return p.body

    @_('ID')
    def body(self, p):
        return p[0]

    @_('BANGID')
    def body(self, p):
        return p[0]

    @_('LP lcom RP')
    def body(self, p):
        return p.lcom

    @_('BS ID [ DOT ] lbody')
    def lterm(self, p):
        global _lam
        return mk_bin(_lam, p[1], p.lbody)

    @_('lterm')
    def lbody(self, p):
        return p.lterm

    @_('bodys')
    def lbody(self, p):
        return p.bodys

    def error(self, p):     
        #if EOFError:
        #    print('end of declaration has been reached unexpectedly')
        pass

#
# End of data parsing/tokenization
############


def lisp_wrap(ch):
    return '"' + ch + '"'

def split_command (cline): # splits a command line into command and list of args
    if cline == '':
        return ('~',[])
    comm = cline[0]        # all commands are one character in front, strings and separate punctuation are double quoated
    commargs = []
    if comm == 'a': # needs special tokenization
        if len(cline) < 2:
            return (comm, commargs)
        t = [re.split(_ws, x) for x in cline[1:]]  # only _ws in data will be list of length 2 after this
        n = len(t)-1
        i = 0
        while i <= n:
            if len(t[i]) > 1:  # skip free blanks
                i += 1
            elif t[i][0] == '"':
                arg = '"'
                j = i+1
                while j <= n and t[j][0] != '"':
                    if len(t[j]) > 1:
                        arg += _ws     
                    else:
                        arg += t[j][0]
                    j += 1
                commargs.append(''.join(arg+'"'))
                i = j + 1
            elif t[i][0] in _punc:
                commargs.append(''.join(lisp_wrap(t[i][0])))
                i += 1
            else:
                arg = ''
                while i <= n and len(t[i]) < 2 and not t[i][0] in _punc:
                    arg += t[i][0]
                    i += 1
                commargs.append(''.join(arg))
        return (comm, commargs)
    else:
        comarg = _ws.join(cline.split()).split(_ws)
        return (comarg[0], comarg[1:])
    
def help ():
        print("         | letter commands are action/processor commands; symbol commands are for display or set up")
        print("         |  items are space-separated (quoted material case/space-sensitive; punctuation quoted)")
        print(' a ...   | analyzes the expression ... in the currently loaded grammar')
        print(' c ...   | case functions generated and added to loaded grammar from elements with POSs ...')
        print(" e .     | evaluates the python expression . at your own risk (beware with deletes)")
        print(f" g .     | grammar text source .  checked, and loaded (its {_binext} file)")
        print(' i .     | intermediate representation of current grammar (a python dict)  saved in file . ')
        print(" l . ... | Lisp function . is called, with args ..., which takes them as strings")
        print(' o .     | OS/shell command . is run at your own risk (. can be complex expression)')
        print(' r ...   | ranks the expression ... using the currently loaded model')
        print(' s .     | supervision data in file . converted to native format .sup for the trainer')
        print(f" z .     | grammar binary . is converted to source, with <index,parameter> added; for model development")
        print(' , ...   | displays analyses with solutions numbered ..., all if none provided; cf. the a command')
        print(' #       | displays ranked analyses; cf. the r command')
        print(' = ...   | displays analyses onto basic cats in ... ; cf. the , command')
        print(' ?       | shows information about the current g-loaded grammar')
        print(' @ ...   | shows the elements with parts of speech ...')
        print(' - .     | shows (without adding) the intermediate representation of element .')
        print(' + .     | processor adds Lisp code in file .')
        print(f" > .     | Logs processor output to filename . after adding {_logext} extension")
        print(' <       | Logging turned off')
        print('         | Use UP and DOWN keys for command recall from use history')

def load_1pass_sup(fname):       
    global _supervision   
    lineno = 0           
    errors = False
    nofile = False
    result = False
    init_sup()
    parserlog = f'file: {fname}\n'
    logfile = fname+ _logext
    with open(logfile, 'w') as f:
        with redirect_stdout(f):
            try:
                for line in open(fname, 'r'):
                    lineno += 1
                    flag = line.lstrip()
                    if flag != '':  #  lexer is unpredictable with all comment or all white lines, dont pass on
                        if flag[0] != '%':
                            result = supparser.parse(suplexer.tokenize(line+_overscore))
                            if not result:
                                errors = True
                                parserlog += f'bad entry in line {lineno}\n'
                if not errors:
                    parserlog += f'The supervision file compiled OK.\n'
            except  FileNotFoundError:
                    nofile = True
                    errors = True
            print(parserlog)
    if not errors:
        print("no errors, proceeding with set up...")
    else:
        if not nofile:
            init_sup()
            print("you've got errors in the supervision data")
            print('fix them and re-try')
    if nofile:
        os.remove(logfile)
        print('supervision file not found; are you sure you specified a full name?')
    if not nofile:
        print(f"please check the {logfile} file for information.")
    return (result and (not errors) and (not nofile))

def load_1pass(fname):        # checks but not updates the grammar with indices
    global _online, _grammar, _info  # here's the difference from load_2pass: grammarians must ignore <index,param>; at end
    lineno = 0                #   modelers cannot. modelers use load_2pass
    init_grammar()
    errors = False
    nofile = False
    result = False
    parserlog = f'file: {fname}\n'
    logfile = fname+ _logext
    with open(logfile, 'w') as f:
        with redirect_stdout(f):
            try:
                for line in open(fname, 'r'):
                    lineno += 1
                    flag = line.lstrip()
                    if flag != '':  #  lexer is unpredictable with all comment or all white lines, dont pass on
                        if flag[0] != '%':
                            _online = False
                            result = mgparser.parse(mglexer.tokenize(line+_overscore))
                            if not result:
                                errors = True
                                parserlog += f'bad entry in line {lineno}\n'
                if not errors:
                    parserlog += f'The grammar file compiled OK.\n'
                    parserlog += f'A note for grammarians:\n'
                    parserlog += f'   Please do  NOT use <index, parameter> at\n'
                    parserlog += f'     the end of elements. It is used for model training.\n'
                    parserlog += f'   Use plain grammar entries instead.\n'
                    parserlog += f'A note for modelers:\n'
                    parserlog += f'   Please DO NOT change that information manually.\n'
                    parserlog += f'   When you add new entries to an already-indexed grammar,\n'
                    parserlog += f'     put ALL OF THEM at the END of the grammar file.\n'
                    parserlog += f'   In model updates, make new entries WITHOUT extra information.\n\n'
            except  FileNotFoundError:
                    nofile = True
                    errors = True
            print(parserlog)
    if not errors:
        _info['name'] = fname
        print("no errors, proceeding with set up...")
    else:
        if not nofile:
            init_grammar()
            print("you've got errors in the grammar")
            print('fix them and re-try')
    if nofile:
        os.remove(logfile)
        print('grammar file not found; are you sure you specified a full name?')
    if not nofile:
        print(f"please check the {logfile} file for information.")
    return (result and (not errors) and (not nofile))

def load_2pass(fname):            # this is for model building, for replacing ';' with <index, param>; pairs
    global _indexed, _grammar, _online
    backupfile = fname+'.backup'
    if load_1pass(fname):                 # pass 1 checks the grammar wff-ness and filename etc. 
        init_grammar()                      # alas we must redo
        gr_lines = []                     # read and update grammar lines
        for line in open(fname, 'r'):     # this time parse is known to be successful
            flag = line.strip()
            if flag == '' or flag[0] == '%':  # empty or comment-only line
                    gr_lines.append(line)  # no element; just copy the line
            else:
                _online = False
                index, _ = mgparser.parse(mglexer.tokenize(line+_overscore))
                if _indexed:
                    gr_lines.append(line) # index was in the line, detected by parser
                else:             # put <index,parameter> just before ;
                    gr_lines.append(line.replace(';','  <'+str(index[1])+' , '+str(index[2])+'>; ',1))  
        shutil.copy2(fname, backupfile)         # fingers crossed in windows
        print(f'A backup copy of {fname} is saved in {backupfile}')
        with open(fname,'w') as f:
            for nl in gr_lines:
                f.write(nl)
    else:
        print("grammar file untouched.")

def mk_1cl(e1):
    return '(' + str(e1) + ')'

def mk_2cl(e1, e2):      # makes a binary Lisp list as '(e1 e2)'
    if str(e1) == '' and str(e2) == '':
        return 'NIL'
    else:
        if str(e1) == '':
            return '(' + str(e2) + ')'
        else:
            return '(' + str(e1) + _ws + str(e2)+ ')'

def mk_3cl(e1, e2, e3):  # makes a ternary Lisp list as '(e1 e2 e3)'
    if str(e1) == '' and str(e2) == '' and str(e3) == '':
        return 'NIL'
    else:
        return '('+ str(e1) + _ws+ str(e2)+ _ws + str(e3) + ')'

def tc_bundle_quote(ql):
    # bundles ql, which is string within string, to Lisp list of tokens
    ws = ql.split("'")  
    if len(ws) > 1:
        return '(' + _ws.join(ws[1].split()) + ')'
    elif len(ws[0]) == 0:
        return '(**ERROR** Your quoted category is empty This is well-formed but not processable)'
    else:
        return '(' + _ws.join(ws[0][1:-1].split()) + ')'   # first and last elements are scare quotes, single or double

def ir_to_lisp(ir):
    # turns an internal representation into Lisp list in strings
    # this is the code generator for the monadic grammar processor in Lisp
    # the preamble of code and wrapper are generated by its non-recursive caller ('g' command)
    l = ''
    if type(ir) == type(()):               # no recursive tuple
        if len(ir) == 4:   # a rule 
            return mk_2cl('KEY', ir[0])+mk_2cl('PARAM', ir[1])+mk_2cl('INDEX', ir[2])
        else:              # an element
            if len(ir[2].split()) > 1 or ir[2] in _punc:   # make all entries uppercase. MWE/ punctuation double quoted for the processor
                return mk_2cl('KEY', ir[0])+mk_2cl('PARAM', ir[1])+mk_2cl('PHON', '"' + ir[2] + '"')
            else:
                return mk_2cl('KEY', ir[0])+mk_2cl('PARAM', ir[1])+mk_2cl('PHON', ir[2].upper())
    elif type(ir) == type([]):             # no recursive list
        if ir == []:
            return mk_2cl('FEATS', 'NIL')
        else:
            for el in ir:
                l += mk_2cl(el[0], el[1])
            return mk_2cl('FEATS', mk_1cl(l))    
    elif type(ir) == type({}):             # dicts can be recursive  
        if   ir[_op] == _el:
            return ir_to_lisp(ir[_l]) + ir_to_lisp(ir[_r])
        elif ir[_op] == _form:
            return mk_2cl('MORPH', ir[_r])
        elif ir[_op] == _cat:
            return ir_to_lisp(ir[_l]) + ir_to_lisp(ir[_r])
        elif ir[_op] == _scom:
            if len(ir) == 3:      # complex
                return mk_2cl('SYN', mk_1cl( \
                        mk_2cl(ir_to_lisp(ir[_l], ir_to_lisp(ir[_r]))))) # this is idiosyncratic. Target code needs one more parenths
            else:
                return mk_2cl('SYN', mk_1cl(ir_to_lisp(ir[_l])))
        elif ir[_op] == _lcom:
            return mk_2cl('SEM', ir_to_lisp(ir[_l]))
        elif ir[_op] == _dom:
            return ir_to_lisp(ir[_l]) + \
                    mk_1cl(ir_to_lisp(ir[_r]))
        elif ir[_op] == _range:
            return mk_1cl(ir_to_lisp(ir[_l])) + \
                    ir_to_lisp(ir[_r])
        elif ir[_op] == _dir:
            if _targetslashlex[ir[_l]]:
                return mk_2cl('DIR', _targetdir[ir[_l]]) + mk_2cl('MODAL', _targetmod[ir[_r]]) \
                    + mk_2cl('LEX', 't')
            else:
                return mk_2cl('DIR', _targetdir[ir[_l]]) + mk_2cl('MODAL', _targetmod[ir[_r]]) 
        elif ir[_op] == _basic:
            if ir[_r] == 'quoted':
                return mk_2cl('BCAT', tc_bundle_quote(ir[_l])) + \
                        mk_2cl('BCONST', 'T') + mk_2cl('FEATS', 'NIL')
            elif ir[_r] == 'special':
                return mk_2cl('BCAT', ir[_l]) + \
                        mk_2cl('FEATS', 'NIL')
            else:
                return mk_2cl('BCAT', ir_to_lisp(ir[_l])) + \
                        ir_to_lisp(ir[_r])
        elif ir[_op] == _lam:
            if ir[_op][_r][_op]:    # this means LF is not a constant
                return mk_3cl('LAM', ir[_l], ir_to_lisp(ir[_r]))   # right associative
            else:
                return mk_3cl('LAM', ir[_l], _targetprefix + ir[_r])  # prefix is ! for Lisp processor
        elif ir[_op] == _app:
            return mk_2cl(ir_to_lisp(ir[_l]), ir_to_lisp(ir[_r]))
        elif ir[_op] == _arule:
            return ir_to_lisp(ir[_r])    # name in the left op already taken care of
        elif ir[_op] == _apair:          # avoid several levels to match flatter target code
            return    mk_2cl('INSYN', mk_1cl(ir_to_lisp(ir[_l][_l][_l]))) \
                    + mk_2cl('OUTSYN', mk_1cl(ir_to_lisp(ir[_r][_l][_l]))) \
                    + mk_2cl('INSEM', ir_to_lisp(ir[_l][_r][_l])) \
                    + mk_2cl('OUTSEM', ir_to_lisp(ir[_r][_r][_l]))
        else:
            for el in ir:
                l += '(' + str(el) + _ws + ir_to_lisp(ir[el]) + ')'
            return l
    else: 
        return str(ir)

def print_info ():
    srule_ent = _info['srule']*2
    print(f" file    :  {_info['name']}\n elements:  {_info['el']}\n s rules :  {_info['srule']} (turned to {srule_ent} elements)\n a rules :  {_info['arule']}")
    print(" basics  : ", _ws.join(_info['basic'].keys()))
    print(" quoted  : ", _ws.join(_info['quoted'].keys()))
    print(" special : ", _ws.join(_info['special'].keys()))
    print(" features: ", _ws.join(_info['features'].keys()))
    print(" values  : ", _ws.join(_info['values'].keys()))
    print(" POSs    : ", _ws.join(_info['pos'].keys()))

def do (commline):
    global _online, _grammar, _info, _latestgr
    comm, args = split_command(commline)
    if comm in ['x', '?', '#', '<', 'h'] and args:
        print('too many arguments')
        return
    if comm in ['a', 'c', 'e', 'g', 'o', '@', 'r', 'z', 's', '-', 'l', 'i', '+', '>'] and not args:
        print('too few arguments')
        return
    if comm == 'h':
        help()
    elif comm == 'i':
        fn = str(args[0])
        ch = False
        if os.path.exists(fn):
            ch = input(f"file {fn} exists, overwrite (y/N)? ")
        if ch == 'y' or not ch:
            with open(str(fn),'w') as f:
                with redirect_stdout(f):
                    pp = pprint.PrettyPrinter(indent=2, width=80, stream=sys.stdout)
                    print(f"# This file can be read as a python dictionary in one fell swoop\n#   using ast.literal_eval(read it here).\n\n# Tree operators are:\n# {_op}: root\n# {_l}: left child\n# {_r}: right child\n#    see the manual/code for values prefixed with {_overscore}\n\n# There are two structures: arules and elements\n# Grammar items are listed in them.\n")
                    pp.pprint(_grammar)
            print(f"grammar is pretty-printed to {fn} in internal representation")
        else:
            print('canceled')
    elif comm == '-':
        _online = True
        args, _, _ = _ws.join([str(item) for item in args]).partition('%')   # just eliminate the comment
        if not mgparser.parse(mglexer.tokenize(args+_overscore)):
            print('ill-formed, no internal structure')
    elif comm == 's':
        if load_1pass_sup(args[0]):
            fn = input(f"Output file (we will add {_supext}) ? ")
            fn = str(fn) + _supext
            ch = False
            if os.path.exists(fn):
                ch = input(f"file {fn} exists, overwrite (y/N)? ")
            if ch == 'y' or not ch:
                with open(str(fn),'w') as f:
                    with redirect_stdout(f):
                        print('(')     # loadable lisp file
                        print(';;;;;;;;;; bench.py-generated supervision data')
                        print(f";;;;;;;;;; from {args[0]} {datetime.now().strftime('%B %d, %Y, %H:%M:%S')}")
                        print(';;')
                        for k,v in _supervision.items():
                            print('(')
                            print(mk_1cl(ir_to_lisp(k)))
                            print(ir_to_lisp(v))
                            print(')')
                        print(';;')
                        print(';;;;;;;;;; end of bench.py-generated supervision data')
                        print(')') 
                print(f"{fn} file generated")
            else:
                print('canceled')
        else:
            print(f"{_supext} file not generated")
    elif comm == 'g':
        if load_1pass(args[0]):      # args[0] is full filename, not necessarily full path name
            _latestgr = str(args[0])
            fn = str(args[0]) + _binext
            ch = False
            if os.path.exists(fn):
                print(f"file {fn} exists, regenerating it.")
                ch = 'y'                 # deliberately avoiding earlier provided option, to always load_bin
            if ch == 'y' or not ch:
                with open(str(fn),'w') as f:
                    with redirect_stdout(f):
                        print("(defparameter *current-grammar* '(")     # loadable lisp file
                        print(';;;;;;;;;; bench.py-generated monadic Lisp grammar')
                        print(f";;;;;;;;;; from {args[0]} {datetime.now().strftime('%B %d, %Y, %H:%M:%S')}")
                        print(';;')
                        print(';; a rules')
                        print(';;')
                        for k,v in _grammar['arules'].items():
                            print('(')
                            print(ir_to_lisp(k))
                            print(ir_to_lisp(v))
                            print(')')
                        print(';;')
                        print(';; elements')
                        print(';;')
                        for k,v in _grammar['elements'].items():
                            print('(')
                            print(ir_to_lisp(k))
                            print(ir_to_lisp(v))
                            print(')')
                        print(';;')
                        print(';;;;;;;;;; end of bench.py-generated monadic Lisp grammar')
                        print('))')  # one for quote, one for defparameter closing
                print(f"{fn} file generated")
                try:
                    _lisp.function('load_bin')(fn)
                    print(f"grammar loaded; ready for analysis")
                except Exception:
                    print(f"Oops. Unable to load {fn}")
            else:
                print('canceled')
        else:
            print(f"{_binext} file not generated")
    elif comm == 'z':
        fn = str(args[0])  # do not assume extension
        _latestgr = fn 
        if os.path.exists(fn):
            try:
                _lisp.function('load_bin')(fn)
                print(f"grammar in {fn} loaded")
            except Exception:
                print(f"Oops. Unable to load {fn}")
        else:
            print(f"{fn} not found")
    elif comm == 'e':
        try:
            eval(_ws.join(str(item) for item in args))
        except Exception:
            print('python says it is ill-formed or unevaluable')
    elif comm == 'o':
        os.system(_ws.join([str(item) for item in args[0:]]))
    elif comm == 'c':
        try:
            _lisp.function('synthetic_case')(tuple(args),_latestgr+".case.log")
            print("Done; check out the = command related to case\n  in addition to , command")
            _lisp.function('sc_rules2mg')(str(_latestgr))   # saves these files in source format
        except Exception:
            print('something went wrong')
    elif comm == 'a':
        try:
            _lisp.function('cky_analyze')(tuple(args))
            print(f"Done. Try , command for results")
        except Exception:
            print('something went wrong')
    elif comm == 'r':
        try:
            _lisp.function('cky_rank')(tuple(args))
            print(f"Done. Try # command for results")
        except Exception:
            print('something went wrong')
    elif comm == ',':
        try:
            if not args:
                _lisp.function('cky_show_analysis')(tuple(args))
                print()
            else:
                for ana in args:
                    _lisp.function('cky_show_analysis_1')(int(ana)) # int() guarded by try
                    print()
        except Exception:
            print('something went wrong')
    elif comm == '=':
        try:
            _lisp.function('cky_show_analysis_onto')(tuple(args))
            print()
        except Exception:
            print('something went wrong')
    elif comm == '#':
        try:
            _lisp.function('cky_show_ranking')()
            print()
        except Exception:
            print('something went wrong')
    elif comm == '@':
        try:
            _lisp.function('show_pos')(tuple(args))
        except Exception:
            print('something went wrong')
    elif comm == '+':
        fn = str(args[0])
        if os.path.exists(fn):
            try:
                _lisp.function('safely_load')(args[0])
                print(f"{args[0]} loaded to the processor")
            except Exception:
                print('something went wrong')
        else:
            print(f"can't find {fn} in the current directory")
    elif comm == 'l':              
        try:
            f = _lisp.function(args[0])
            a = args[1:]
            if len(a) == 0:
                f()
            elif len(a) == 1:    # that horrifying syntax of py: tuple of [a] is (a,), that of [] is () !!
                f(a[0])
            else:
                f(tuple(a))
        except Exception:
            print('something went wrong')
        print()
    elif comm == '?':
        print_info()
        ch = input("write to file? (y/N)? ")
        if ch == 'y':
            fn = input("file name: ")
            ch = False
            if os.path.exists(fn):
                ch = input(f"file {fn} exists, overwrite (y/N)? ")
            if ch == 'y' or not ch:
                with open(fn, 'w') as f:
                    with redirect_stdout(f):
                        print_info()
    elif comm == 'x':       # caller knows what to do next
        pass
    elif comm == 'pass' or comm == '~':    # not in the menu, to report others as bad
        pass
    elif comm == '>':
        fn = args[0] + _logext
        ch = False
        if os.path.exists(fn):
            ch = input(f"file {fn} exists, overwrite (y/N)? ")
            if ch == 'y':
                os.remove(fn)
        if ch == 'y' or not ch:
            try:
                print('Logging processor output to: ', args[0]+ _logext)
                _cl.dribble(args[0]+ _logext)
            except Exception:
                print('something wrong')
        else:
            print('logging canceled')
    elif comm == '<':
        try:
            _cl.dribble()
            print('Logging turned off')
        except Exception:
            print("logging is already off, or something went wrong")
    else:
        print('command unknown')

def welcome ():
    print(75*_overscore)
    print(1*_prompt+'Welcome to The Bench')
    print(2*_prompt+" A workbench for studying Monadic Structures in Natural Language")
    print(3*_prompt+"Bench version:      ", _version, "Dated:", _vdate)
    print(3*_prompt+"Python version:     ", platform.python_version())
    print(3*_prompt+"Common Lisp version:", _lisptype)
    print(3*_prompt+"Pre/post processing by Python (grammar development, interfaces)")
    print(3*_prompt+"Processing by Common Lisp (analysis, training, ranking)")
    print(2*_prompt+datetime.now().strftime("Today: %B %d, %Y, %H:%M:%S"))
    print(1*_prompt+"Type x to exit, h to get some help")
    print(75*_underscore)

mglexer  = MGLexer()
mgparser = MGParser()
suplexer = SUPLexer()
supparser = SUPParser()

# command history recaller is from furas of stackoverflow. Many thanks

myPromptSession = PromptSession(history = FileHistory(expanduser('~/.thebenchhistory')))

if __name__ == '__main__': # MG REPL online
    init_grammar()
    welcome()
    _cl.load(os.environ['BENCH_HOME']+'/bin/bench.lisp')               # load the processor
    command = '~'
    while split_command(command)[0] != 'x':
        do(command)
        command = myPromptSession.prompt(_prompt)
    print('Done.')
