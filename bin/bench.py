# -----------------------------------------------------------------------------
# bench.py
# pre/post processing and processor interface for monadic grammar
# -Cem Bozsahin, 2022, Ankara, Datça, Şile
# -----------------------------------------------------------------------------

import os
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
_cl.load(os.environ['BENCH_HOME']+'/bin/bench.lisp')               # load the processor
_cl.load(os.environ['BENCH_HOME']+'/bin/init-interactive.lisp')

_overscore = chr(8254)        # this is also the invisible 'declaration terminator'
_prompt = '/'+_overscore+'\ ' # the pagoda
_online = False               # parser output control
_version = '0.1'
_vdate = 'April 10, 2022'
                              # assuming max size of grammar is 1 million entries. This is a lazy list in p3.
_keys = {}                    # current keys
_grammar = {}                 # currently loaded grammar parsed into internal representation
                              # structure of the dict, key: (index,_el/_arule/_srule, list of items for the element)
_info = {}
_indexed = False              # whether an entry is already indexed; need this for 2-pass processing

# Apart from MGLexer and MGParser, there is NO class definition, to make everything natively printable.
#   And, these two classes are required by the sly module. 

#########  
#
# Internal grammar's AST
#
# AST operators. It is easier to fix them globally than remembering their value types


_el    = 'el'
_form  = 'form'
_cat   = 'cat'
_scom  = 'scom'
_lcom  = 'lcom'
_dom   = 'dom'
_range = 'range'
_dir   = 'dir'
_eqn   = 'eqn'
_basic = 'basic'
_lam   = 'lam'
_app   = 'app'
_val   = 'val'
_arule = 'arule'
_srule = 'srule'
_apair = 'apair'
_spair = 'spair'
_choice= 'choice'
_index = 'index'
_op    = 0         # rather than using string match
_l     = 1
_r     = 2

# 
# All grammar STRUCTURES are ternary and binary native python dictionaries
#  in the form {0: operator, 1 : left element, 2: right element}
#
# valuation is, for 0/1/2 in order: 
#
# (_el,    _form, _cat)      
# (_form,  string of items, one value)  one value is False in _spair     
# (_cat,   _scom, _lcom)
# (_scom,  _range, _dom)   
# (_scom,  _basic)
# (_lcom,  _lam)
# (_lcom,  _app)
# (_lcom,  _val)
# (_dom,   _dir, _scom)
# (_dir,   slash, modality)
# (_basic, one value, list of features, feature followed by value)
# (_lam,   varname, _app)
# (_lam,   varname, _val)
# (_lam,   varname, _lam)
# (_app,   _app, value)
# (_app,   _val, value)
# (_app,   _val, _app)
# (_arule, rulename, _apair)
# (_srule, rulename, _choice)
# (_apair, _cat, _cat)
# (_spair, _form, _cat)
# (_choice,_spair, _spair)
# (_index, an index, a parameter)

# 
# make functions.
#               

def mk_entry (element, index):  
    global _grammar, _online
    if _online:
        print(element)
    elif element[_op] == _el:
        _grammar[(index[_l], index[_r], element[_l][_l])] =  element  
    elif element[_op] == _arule:    # keep them in grammar but separately dict'd
        _grammar['arules'][(index[_l], index[_r], element[_l][_op])] =  element  
    elif element[_op] == _srule:    # compile them into two native entries of type _el
        _grammar[(index[_l], index[_r], element[_l][_l][_l])] = mk_bin(_el, mk_bin(_form, element[_l][_l][_l], element[_l][_op]), element[_l][_l][_r])
        _grammar[(index[_l], index[_r], element[_l][_r][_l])] = mk_bin(_el, mk_bin(_form, element[_l][_r][_l], element[_l][_op]), element[_l][_r][_r])
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

def init_grammar():
    global _grammar, _info
    _grammar.clear()
    _info.clear()
    _keys.clear()
    _info = { 'name': 'unknown', 'el':0, 'srule':0, 'arule':0, 'basic': {}, 'quoted': {}, 'special': {}, 'features' : {}, 'values': {}, 'pos': {} }  # basic cat inventory is synthetic, this ain't GG
    _grammar = { 'arules': {}}         # keep arules separate, srules are compiled into entries
    
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

class MGLexer(Lexer):  # Token types of monadic grammar specifications
    tokens = { ID, RNAME, SPECID, ITEM, M, SRULE, ARULE, END, CATEND, LSQ, RSQ, COM, CORR, DOT, SQCAT, DQCAT,
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
    ID     = r'[0-9a-zA-Z_\-\+]*[a-zA-Z][0-9a-zA-Z_\-\+]*'        # (at least one alphabetical symbol for cat symbols)
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

class MGParser(Parser):       # the syntax of MG entries 
    #debugfile = 'lalr.log'
    tokens = MGLexer.tokens
    global _keys, _indexed, _grammar, _info

    @_('l catend t')
    def s(self, p):
        return mk_entry(p.l, p.catend)

    @_('ITEM pos M c')        # first item is form (get rid of |), second one is POS
    def l(self, p):
        global _info, _online
        if not _online:
            _info['el'] += 1
        return mk_bin(_el, mk_bin(_form, ' '.join(p[0][1:-1].split()), p.pos), p.c)

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
        return ' '.join(p[0][1:-1].split())

    @_('r')
    def l(self, p):
        return p.r

    @_('END')
    def t(self, p):
        return True        

    @_('LSQ INUM COM RNUM RSQ CATEND')  
    def catend(self, p):
        global _keys, _indexed
        _indexed = True   # it was already indexed
        _keys[p[1]] = True  # do not generate an index which is already specified
        return mk_bin(_index, int(p[1]), float(p[3]))

    @_('CATEND')         # entries are indexed in source grammar, don't let user index them
    def catend(self, p):
        global _keys, _indexed
        ix = make_up_an_index()
        _indexed = False   # we generated the index
        _keys[ix] = True   # next time it won't be generated
        return mk_bin(_index, ix, 1.0) # default parameter value

    @_('RNAME spair SRULE spair')
    def r(self, p):
        global _online, _info
        if not _online:
            _info['srule'] += 1
        return mk_un(_srule, mk_bin(p[0], p.spair0, p.spair1))

    @_('RNAME apair ARULE apair')
    def r(self, p):
        global _online, _info
        if not _online:
            _info['arule'] += 1
        return  mk_un(_arule, mk_bin(p[0], p.apair0, p.apair1))

    @_('LP ids COM c RP')      
    def spair(self, p):
        return mk_bin(_spair, p.ids, p.c)

    @_('LP c RP')
    def apair(self, p):
        return mk_un(_apair, p.c)

    @_('ids ID')
    def ids(self, p):
        return p.ids+' '+p[1]

    @_('ID')
    def ids(self, p):
        return p[0]

    @_('scom CORR lcom')
    def c(self, p):
        return mk_bin(_cat, mk_un(_scom, p.scom), mk_un(_lcom, p.lcom))

    @_('basic')
    def scom(self, p):
        return p.basic

    @_('parentd')
    def scom(self, p):
        return p.parentd

    @_('scom slash last')
    def scom(self, p):
        return mk_bin(_range, p.scom, mk_bin(_dom, p.slash, p.last))

    @_('basic')
    def last(self, p):
        return p.basic

    @_('parentd')
    def last(self, p):
        return p.parentd

    @_('dir mod')
    def slash(self, p):
        return mk_bin(_dir, p.dir, p.mod)

    @_('dir')
    def slash(self, p):
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
        global _info, _online
        if not _online:
            _info['basic'][p[0]] = True
        if p.feats:
            return mk_bin(_basic, p[0], p.feats)
        else:
            return mk_bin(_basic, p[0], [])

    @_('SQCAT')
    def basic(self, p):
        global _info, _online
        if not _online:
            _info['quoted'][p[0]] = True
        return mk_bin(_basic, p[0], 'quoted')

    @_('DQCAT')
    def basic(self, p):
        global _info, _online
        if not _online:
            _info['quoted'][p[0]] = True
        return mk_bin(_basic, p[0], 'quoted')

    @_('SPECID')
    def basic(self, p):
        global _info, _online
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
        return (p[0]+' '+p.val).split(' ')

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
        return mk_bin(_app, p.bodys, p.body)

    @_('body')
    def bodys(self, p):
        return p.body

    @_('ID')
    def body(self, p):
        return p[0]

    @_('LP lcom RP')
    def body(self, p):
        return p.lcom

    @_('BS ID [ DOT ] lbody')
    def lterm(self, p):
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

def split_command (cline):  # splits a command line into command and list of args
    comarg= ' '.join(cline.split()).split(' ')
    return (comarg[0], comarg[1:])
    
def help ():
        print('           ... is space-separated items ending with newline')
        print(' a ...   | analyzes the expression ... in the currently loaded grammar')
        print(' c ...   | generates case functions (asymmetric relational rules),')
        print('         |   for all elements with parts of speech ...')
        print('         |   and adds them to currently loaded grammar')
        print(' d ...   | displays analyses with solutions numbered ...,')
        print('         |   all of them if no number is provided')
        print(" e .     | evaluates the python expression . if you know what you're doing")
        print(' g .     | grammar with the filename . is checked and loaded (and .lisp file generated)')
        print(' h       | lists commands')
        print(' k ...   | shows grammar elements which bear the keys ...')
        print(' m .     | model with the filename . is loaded (a .lisp file)')
        print(' o .     | runs the OS/shell command . at your own risk')
        print(' p ...   | shows the elements with parts of speech ...')
        print(' r ...   | ranks the expression ... using the currently loaded model')
        print(' x       | exits from the tool')
        print(' ?       | shows information about the currently loaded grammar')
        print(' = ...   | restricts synthetic case application to basic categories ...')
        print(' @ .     | shows the value of the Lisp object . ')
        print(" ^ . ... | calls Lisp function . with args ...")
        print(' ! .     | shows (without adding) the intermediate representation of element . in source format')
        print(' & .     | saves the intermediate representation of current grammar (a python dict) in file .')
        print(' > .     | Logs processor output to the file . (overridden, so beware)')
        print(' <       | Logging turned off')

def load_1pass(fname):        # checks but not updates the grammar with indices
    global _online, _grammar, _info  # here's the difference from load_2pass: grammarians must ignore <index,param>; at end
    lineno = 0                #   modelers cannot. modelers use load_2pass
    init_grammar()
    errors = False
    nofile = False
    result = False
    parserlog = f'file: {fname}\n'
    logfile = fname+'.log'
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
                    parserlog += f'Grammarians:\n'
                    parserlog += f'   Please do  NOT use <index, parameter> at\n'
                    parserlog += f'     the end of elements. It is used for model training.\n'
                    parserlog += f'   Use plain grammar entries instead.\n'
                    parserlog += f'Modelers:\n'
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

            
def do (commline):
    global _online, _grammar, _info
    comm, args = split_command(commline)
    if comm != 'h' and comm != 'x' and comm != 'pass' and comm != '?' and comm != '<' and not args:
        print('insufficient arguments')
        return
    if comm == 'h':
        help()
    elif comm == '&':
        fn = str(args[0])
        ch = False
        if os.path.exists(fn):
            ch = input(f"file {fn} exists, overwrite (y/n)? ")
        if not ch or ch == 'y':
            with open(str(fn),'w') as f:
                with redirect_stdout(f):
                    pp = pprint.PrettyPrinter(indent=2)
                    pp.pprint(_grammar)
            print(f"grammar binary is pretty-printed to {fn}")
        elif ch:
            print('canceled')
    elif comm == '!':
        _online = True
        args, _, _ = ' '.join([str(item) for item in args]).partition('%')   # just eliminate the comment
        if not mgparser.parse(mglexer.tokenize(args+_overscore)):
            print('ill-formed, no internal structure')
    elif comm == 'k':
            pp = pprint.PrettyPrinter(indent=2)
            for key in args:
                entry = _grammar.get(int(key))
                if entry:
                    pp.pprint(entry)
                else:
                    print(f"key {int(key)} not found")
    elif comm == 'g':
        load_1pass(args[0])      # args[0] is full filename, not necessarily full path name
    elif comm == 'e':
        try:
            eval(' '.join(str(item) for item in args))
        except (SyntaxError, NameError, TypeError, ZeroDivisionError, ValueError, KeyError): # all that i can think of going bad
            print('python says it is ill-formed or unevaluable')
    elif comm == 'o':
        os.system(' '.join([str(item) for item in args[0:]]))
    elif comm == '^':              
        try:
            f = _lisp.function(args[0])
            a = args[1:]
            if len(a) == 0:
                f()
            elif len(a) == 1:    # that horrifying syntax of py: tuple of [] is ([],) !!!
                f(a[0])
            else:
                f(tuple(a))
        except Exception:
            print('something went wrong')
        print()
    elif comm == '@':
        try:
            print(_lisp.eval(cl4py.Symbol(args[0])))
        except Exception:
            print('something went wrong')
    elif comm == '?':
        print(f" file    :  {_info['name']}\n elements:  {_info['el']}\n s rules :  {_info['srule']}\n a rules :  {_info['arule']}")
        print(" basics  : ", ' '.join(_info['basic'].keys()))
        print(" quoted  : ", ' '.join(_info['quoted'].keys()))
        print(" special : ", ' '.join(_info['special'].keys()))
        print(" features: ", ' '.join(_info['features'].keys()))
        print(" values  : ", ' '.join(_info['values'].keys()))
        print(" POSs    : ", ' '.join(_info['pos'].keys()))
    elif comm == 'x':       # caller knows what to do next
        pass
    elif comm == 'pass':    # not in the menu, to report others as bad
        pass
    elif comm == '>':
        print('Logging processor output to: ', args[0])
        _cl.dribble(args[0])
    elif comm == '<':
        _cl.dribble()
        print('Logging turned off')
    else:
        print('command unknown')

def welcome ():
    print('------------------------------------------------------------------------')
    print(1*_prompt+'Welcome to The Bench,')
    print(2*_prompt+"A workbench for studying Monadic Structures in Natural Language")
    print(3*_prompt+"Version:", _version, "Dated:", _vdate)
    print(3*_prompt+"Pre/post processing by Python (grammar checks, interfaces)")
    print(3*_prompt+"Processing by Common Lisp (analysis, training, ranking)")
    print(2*_prompt+datetime.now().strftime("Today: %B %d, %Y, %H:%M:%S"))
    print(1*_prompt+"Type x to exit, h to get some help")
    print('-----------------------------------------------------------------------')

mglexer  = MGLexer()
mgparser = MGParser()

if __name__ == '__main__': # MG REPL online
    init_grammar()
    welcome()
    command = 'pass'
    while split_command(command)[0] != 'x':
        do(command)
        command = input(_prompt)
    print('Done.')
