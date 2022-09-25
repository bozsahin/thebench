(
;;;;;;;;;; bench.py-generated monadic Lisp grammar
;;;;;;;;;; from acid-test.g September 25, 2022, 15:12:45
;;
;; a rules
;;
(
(KEY 272275) (PARAM 1.0) (INDEX #subj) 
(INSYN ((BCAT np)  (FEATS ( ) ) ) ) (OUTSYN ( (((BCAT s)  (FEATS ( ) ) )  ( ((DIR FS) (MODAL ALL) (LEX nil)  ( (((BCAT s)  (FEATS ( ) ) )  ( ((DIR BS) (MODAL ALL) (LEX nil)  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) ) ) ) ) ) (INSEM lt) (OUTSEM (LAM lt (LAM p (p lt) ) ) ) 
)
(
(KEY 936871) (PARAM 1.0) (INDEX #lewis-rule) 
(INSYN ( (((BCAT np)  (FEATS ( ) ) )  ( ((DIR FS) (MODAL ALL) (LEX nil)  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) ) (OUTSYN ((BCAT np)  (FEATS ( ) ) ) ) (INSEM lt) (OUTSEM (LAM lt (lt nompred) ) ) 
)
;;
;; elements
;;
(
(KEY 431008) (PARAM 1.0) (PHON it is more) 
(MORPH n) (SYN ((BCAT xp)  (FEATS ( (typ x) ) ) ) ) (SEM it) 
)
(
(KEY 4895) (PARAM 1.0) (PHON john) 
(MORPH n) (SYN ((BCAT np)  (FEATS ( (agr ?x) (num sg) ) ) ) ) (SEM john) 
)
(
(KEY 964249) (PARAM 1.0) (PHON mary) 
(MORPH n) (SYN ((BCAT np)  (FEATS ( ) ) ) ) (SEM mary) 
)
(
(KEY 17) (PARAM 1.27) (PHON study) 
(MORPH inf) (SYN ((BCAT iv)  (FEATS ( ) ) ) ) (SEM (LAM x (study x) ) ) 
)
(
(KEY 946090) (PARAM 1.0) (PHON persuaded) 
(MORPH v) (SYN ( (( (( (((BCAT s)  (FEATS ( (type decl) ) ) )  ( ((DIR BS) (MODAL ALL) (LEX nil)  ((BCAT np)  (FEATS ( (det none) (h ?x) ) ) ) ) ) ) )  ( ((DIR FS) (MODAL ALL) (LEX nil)  ((BCAT vp)  (FEATS ( (h ?x) ) ) ) ) ) ) )  ( ((DIR FS) (MODAL ALL) (LEX nil)  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) ) (SEM (LAM x (LAM p (LAM y (((persuade (p x) )  x)  y) ) ) ) ) 
)
(
(KEY 640332) (PARAM 1.0) (PHON promised) 
(MORPH v) (SYN ( (( (( (((BCAT s)  (FEATS ( ) ) )  ( ((DIR BS) (MODAL ALL) (LEX nil)  ((BCAT np)  (FEATS ( ) ) ) ) ) ) )  ( ((DIR FS) (MODAL ALL) (LEX nil)  ((BCAT vp)  (FEATS ( ) ) ) ) ) ) )  ( ((DIR FS) (MODAL ALL) (LEX nil)  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) ) (SEM (LAM x (LAM p (LAM y (((promise (p y) )  x)  y) ) ) ) ) 
)
(
(KEY 8665) (PARAM 1.0) (PHON wanted) 
(MORPH v) (SYN ( (( (( (((BCAT s)  (FEATS ( ) ) )  ( ((DIR BS) (MODAL ALL) (LEX nil)  ((BCAT np)  (FEATS ( ) ) ) ) ) ) )  ( ((DIR FS) (MODAL ALL) (LEX nil)  ((BCAT vp)  (FEATS ( ) ) ) ) ) ) )  ( ((DIR FS) (MODAL ALL) (LEX nil)  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) ) (SEM (LAM x (LAM p (LAM y ((want (p x) )  y) ) ) ) ) 
)
(
(KEY 21) (PARAM 2.8) (PHON expected) 
(MORPH v) (SYN ( (( (( (((BCAT s)  (FEATS ( ) ) )  ( ((DIR BS) (MODAL ALL) (LEX nil)  ((BCAT np)  (FEATS ( ) ) ) ) ) ) )  ( ((DIR FS) (MODAL HARMONIC) (LEX nil)  ((BCAT vp)  (FEATS ( ) ) ) ) ) ) )  ( ((DIR FS) (MODAL ALL) (LEX nil)  ((BCAT +np)  (FEATS ( ) ) ) ) ) ) ) ) (SEM (LAM x (LAM p (LAM y ((expect (p x) )  y) ) ) ) ) 
)
(
(KEY 682007) (PARAM 1.0) (PHON considered) 
(MORPH v) (SYN ( (( (( (((BCAT s)  (FEATS ( ) ) )  ( ((DIR BS) (MODAL ALL) (LEX nil)  ((BCAT np)  (FEATS ( ) ) ) ) ) ) )  ( ((DIR FS) (MODAL ALL) (LEX t)  ((BCAT propp)  (FEATS ( ) ) ) ) ) ) )  ( ((DIR FS) (MODAL ALL) (LEX nil)  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) ) (SEM (LAM x (LAM p (LAM y ((consider (p x) )  y) ) ) ) ) 
)
(
(KEY 636218) (PARAM 1.0) (PHON seemed) 
(MORPH v) (SYN ( (( (((BCAT s)  (FEATS ( ) ) )  ( ((DIR BS) (MODAL ALL) (LEX nil)  ((BCAT 'it is less')  quoted) ) ) ) )  ( ((DIR FS) (MODAL ALL) (LEX nil)  ((BCAT s)  (FEATS ( ) ) ) ) ) ) ) ) (SEM (LAM p (LAM x (seem p) ) ) ) 
)
(
(KEY 172619) (PARAM 1.0) (PHON seemed) 
(MORPH v) (SYN ( (( (((BCAT s)  (FEATS ( ) ) )  ( ((DIR BS) (MODAL ALL) (LEX nil)  ((BCAT "it is less")  quoted) ) ) ) )  ( ((DIR FS) (MODAL ALL) (LEX nil)  ((BCAT s)  (FEATS ( ) ) ) ) ) ) ) ) (SEM (LAM p (LAM x (seem p) ) ) ) 
)
(
(KEY 938888) (PARAM 1.0) (PHON seemed) 
(MORPH v) (SYN ( (( (((BCAT s)  (FEATS ( ) ) )  ( ((DIR BS) (MODAL ALL) (LEX t)  ((BCAT np)  (FEATS ( ) ) ) ) ) ) )  ( ((DIR FS) (MODAL APP) (LEX nil)  ((BCAT vp)  (FEATS ( ) ) ) ) ) ) ) ) (SEM (LAM p (LAM x (seem (p x) ) ) ) ) 
)
(
(KEY 109647) (PARAM 1.0) (PHON and) 
(MORPH c) (SYN ( (( (((BCAT @x)  special)  ( ((DIR BS) (MODAL ALL) (LEX nil)  ((BCAT @x)  special) ) ) ) )  ( ((DIR FS) (MODAL ALL) (LEX nil)  ((BCAT @x)  special) ) ) ) ) ) (SEM (LAM p (LAM q (LAM x ((and (p x) )  (q x) ) ) ) ) ) 
)
(
(KEY 757167) (PARAM 1.0) (PHON boldly) 
(MORPH j) (SYN ( (( (((BCAT s)  (FEATS ( ) ) )  ( ((DIR BS) (MODAL ALL) (LEX nil)  ((BCAT np)  (FEATS ( ) ) ) ) ) ) )  ( ((DIR FS) (MODAL ALL) (LEX nil)  ( (((BCAT s)  (FEATS ( (o kirk) (s ?y) ) ) )  ( ((DIR BS) (MODAL ALL) (LEX nil)  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) ) ) ) ) ) (SEM (LAM p (LAM x (boldly (p x) ) ) ) ) 
)
(
(KEY 711325) (PARAM 1.0) (PHON to) 
(MORPH p) (SYN ( (((BCAT vp)  (FEATS ( ) ) )  ( ((DIR FS) (MODAL ALL) (LEX nil)  ((BCAT iv)  (FEATS ( ) ) ) ) ) ) ) ) (SEM (LAM p p) ) 
)
(
(KEY 949149) (PARAM 1.0) (PHON have) 
(MORPH aux) (SYN ( (((BCAT iv)  (FEATS ( ) ) )  ( ((DIR FS) (MODAL ALL) (LEX nil)  ((BCAT iv)  (FEATS ( ) ) ) ) ) ) ) ) (SEM (LAM p p) ) 
)
(
(KEY 997695) (PARAM 1.0) (PHON bought) 
(MORPH v) (SYN ( (((BCAT iv)  (FEATS ( ) ) )  ( ((DIR FS) (MODAL ALL) (LEX nil)  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) ) (SEM (LAM x (LAM y ((buy x)  y) ) ) ) 
)
(
(KEY 298698) (PARAM 1.0) (PHON the) 
(MORPH det) (SYN ( (((BCAT np)  (FEATS ( ) ) )  ( ((DIR FS) (MODAL APP) (LEX nil)  ((BCAT n)  (FEATS ( ) ) ) ) ) ) ) ) (SEM def) 
)
(
(KEY 778429) (PARAM 1.0) (PHON car) 
(MORPH n) (SYN ((BCAT n)  (FEATS ( ) ) ) ) (SEM car) 
)
(
(KEY 52032) (PARAM 1.0) (PHON handsome) 
(MORPH p) (SYN ((BCAT propp)  (FEATS ( ) ) ) ) (SEM (LAM x (handsome x) ) ) 
)
(
(KEY 442797) (PARAM 1.0) (PHON kicked the bucked) 
(MORPH idio) (SYN ( (((BCAT s)  (FEATS ( ) ) )  ( ((DIR BS) (MODAL ALL) (LEX nil)  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) ) (SEM (LAM x (die_euphemistic x) ) ) 
)
(
(KEY 497676) (PARAM 1.0) (PHON kicked) 
(MORPH v) (SYN ( (( (( (((BCAT s)  (FEATS ( ) ) )  ( ((DIR BS) (MODAL ALL) (LEX nil)  ((BCAT np)  (FEATS ( ) ) ) ) ) ) )  ( ((DIR FS) (MODAL ALL) (LEX nil)  ((BCAT 'bucket')  quoted) ) ) ) )  ( ((DIR FS) (MODAL ALL) (LEX nil)  ((BCAT PredP)  (FEATS ( ) ) ) ) ) ) ) ) (SEM (LAM p (LAM x (LAM y ((die_ ((euphemistic p)  x) )  y) ) ) ) ) 
)
(
(KEY 744667) (PARAM 1.0) (PHON pick up) 
(MORPH pv) (SYN ( (((BCAT iv)  (FEATS ( ) ) )  ( ((DIR FS) (MODAL ALL) (LEX nil)  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) ) (SEM (LAM x (LAM y ((pick_culminate x)  y) ) ) ) 
)
(
(KEY 876745) (PARAM 1.0) (PHON pick) 
(MORPH pv2) (SYN ( (( (((BCAT iv)  (FEATS ( ) ) )  ( ((DIR FS) (MODAL ALL) (LEX nil)  ((BCAT 'up')  quoted) ) ) ) )  ( ((DIR FS) (MODAL ALL) (LEX nil)  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) ) (SEM (LAM x (LAM y (LAM z (((hold (culminate y) )  x)  z) ) ) ) ) 
)
(
(KEY 122078) (PARAM 1.0) (PHON run) 
(MORPH #past) (SYN ((BCAT iv)  (FEATS ( ) ) ) ) (SEM (LAM x (run x) ) ) 
)
(
(KEY 170042) (PARAM 1.0) (PHON ran) 
(MORPH #past) (SYN ( (((BCAT s)  (FEATS ( ) ) )  ( ((DIR BS) (MODAL ALL) (LEX nil)  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) ) (SEM (LAM x ((past run)  x) ) ) 
)
(
(KEY 140265) (PARAM 1.0) (PHON buy) 
(MORPH #past) (SYN ( (((BCAT iv)  (FEATS ( ) ) )  ( ((DIR FS) (MODAL ALL) (LEX nil)  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) ) (SEM (LAM x (LAM y ((buy x)  y) ) ) ) 
)
(
(KEY 455671) (PARAM 1.0) (PHON bought) 
(MORPH #past) (SYN ( (( (((BCAT s)  (FEATS ( ) ) )  ( ((DIR BS) (MODAL ALL) (LEX nil)  ((BCAT np)  (FEATS ( ) ) ) ) ) ) )  ( ((DIR FS) (MODAL ALL) (LEX nil)  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) ) (SEM (LAM x (LAM y (((past buy)  x)  y) ) ) ) 
)
;;
;;;;;;;;;; end of bench.py-generated monadic Lisp grammar
)
