(
;;;;;;;;;; bench.py-generated monadic Lisp grammar
;;;;;;;;;; from hw.g September 25, 2022, 17:36:21
;;
;; a rules
;;
(
(KEY 116402) (PARAM 1.0) (INDEX #subj) 
(INSYN ((BCAT np)  (FEATS ( ) ) ) ) (OUTSYN ( (((BCAT s)  (FEATS ( ) ) )  ( ((DIR FS) (MODAL ALL) (LEX nil)  ( (((BCAT s)  (FEATS ( ) ) )  ( ((DIR BS) (MODAL ALL) (LEX nil)  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) ) ) ) ) ) (INSEM lt) (OUTSEM (LAM lt (LAM p (p lt) ) ) ) 
)
(
(KEY 40949) (PARAM 1.0) (INDEX #lewis-rule) 
(INSYN ( (((BCAT np)  (FEATS ( ) ) )  ( ((DIR FS) (MODAL ALL) (LEX nil)  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) ) (OUTSYN ((BCAT np)  (FEATS ( ) ) ) ) (INSEM lt) (OUTSEM (LAM lt (lt nompred) ) ) 
)
;;
;; elements
;;
(
(KEY 298776) (PARAM 1.0) (PHON it) 
(MORPH n) (SYN ((BCAT xp)  (FEATS ( (lex no) (per s3) ) ) ) ) (SEM it) 
)
(
(KEY 86017) (PARAM 1.0) (PHON john) 
(MORPH n) (SYN ((BCAT np)  (FEATS ( (per 3s) (lex yes) ) ) ) ) (SEM john) 
)
(
(KEY 989823) (PARAM 1.0) (PHON mary) 
(MORPH n) (SYN ((BCAT np)  (FEATS ( ) ) ) ) (SEM mary) 
)
(
(KEY 587974) (PARAM 1.0) (PHON and) 
(MORPH c) (SYN ( (((BCAT @x)  special)  ( ((DIR FS) (MODAL ALL) (LEX nil)  ( (((BCAT @x)  special)  ( ((DIR BS) (MODAL ALL) (LEX nil)  ((BCAT @x)  special) ) ) ) ) ) ) ) ) ) (SEM (LAM p (LAM q (LAM x ((and (p x) )  (q x) ) ) ) ) ) 
)
(
(KEY 884591) (PARAM 1.0) (PHON study) 
(MORPH inf) (SYN ((BCAT iv)  (FEATS ( ) ) ) ) (SEM (LAM x (study x) ) ) 
)
(
(KEY 514661) (PARAM 1.0) (PHON persuaded) 
(MORPH v) (SYN ( (( (( (((BCAT s)  (FEATS ( ) ) )  ( ((DIR BS) (MODAL ALL) (LEX nil)  ((BCAT np)  (FEATS ( ) ) ) ) ) ) )  ( ((DIR FS) (MODAL ALL) (LEX nil)  ((BCAT vp)  (FEATS ( ) ) ) ) ) ) )  ( ((DIR FS) (MODAL CROSS) (LEX nil)  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) ) (SEM (LAM x (LAM p (LAM y (((persuade (p x) )  x)  y) ) ) ) ) 
)
(
(KEY 246045) (PARAM 1.0) (PHON promised) 
(MORPH v) (SYN ( (( (( (((BCAT s)  (FEATS ( ) ) )  ( ((DIR BS) (MODAL ALL) (LEX t)  ((BCAT np)  (FEATS ( ) ) ) ) ) ) )  ( ((DIR FS) (MODAL ALL) (LEX nil)  ((BCAT vp)  (FEATS ( ) ) ) ) ) ) )  ( ((DIR FS) (MODAL ALL) (LEX t)  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) ) (SEM (LAM x (LAM p (LAM y (((promise (p y) )  x)  y) ) ) ) ) 
)
(
(KEY 184866) (PARAM 1.0) (PHON wanted) 
(MORPH v) (SYN ( (( (( (((BCAT s)  (FEATS ( ) ) )  ( ((DIR BS) (MODAL STAR) (LEX nil)  ((BCAT np)  (FEATS ( ) ) ) ) ) ) )  ( ((DIR FS) (MODAL HARMONIC) (LEX nil)  ((BCAT vp)  (FEATS ( ) ) ) ) ) ) )  ( ((DIR FS) (MODAL ALL) (LEX nil)  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) ) (SEM (LAM x (LAM p (LAM y ((want (p x) )  y) ) ) ) ) 
)
(
(KEY 391454) (PARAM 1.0) (PHON expected) 
(MORPH v) (SYN ( (( (( (((BCAT s)  (FEATS ( ) ) )  ( ((DIR BS) (MODAL ALL) (LEX nil)  ((BCAT np)  (FEATS ( ) ) ) ) ) ) )  ( ((DIR FS) (MODAL ALL) (LEX nil)  ((BCAT vp)  (FEATS ( ) ) ) ) ) ) )  ( ((DIR FS) (MODAL ALL) (LEX nil)  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) ) (SEM (LAM x (LAM p (LAM y ((expect (p x) )  y) ) ) ) ) 
)
(
(KEY 68213) (PARAM 1.0) (PHON considered) 
(MORPH v) (SYN ( (( (( (((BCAT s)  (FEATS ( ) ) )  ( ((DIR BS) (MODAL ALL) (LEX nil)  ((BCAT np)  (FEATS ( ) ) ) ) ) ) )  ( ((DIR FS) (MODAL ALL) (LEX nil)  ((BCAT propp)  (FEATS ( ) ) ) ) ) ) )  ( ((DIR FS) (MODAL ALL) (LEX nil)  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) ) (SEM (LAM x (LAM p (LAM y ((consider (p x) )  y) ) ) ) ) 
)
(
(KEY 360625) (PARAM 1.0) (PHON seemed) 
(MORPH v) (SYN ( (( (((BCAT s)  (FEATS ( ) ) )  ( ((DIR BS) (MODAL ALL) (LEX nil)  ((BCAT xp)  (FEATS ( ) ) ) ) ) ) )  ( ((DIR FS) (MODAL ALL) (LEX nil)  ((BCAT s)  (FEATS ( ) ) ) ) ) ) ) ) (SEM (LAM p (LAM x (seem p) ) ) ) 
)
(
(KEY 324070) (PARAM 1.0) (PHON seemed) 
(MORPH v) (SYN ( (( (((BCAT s)  (FEATS ( ) ) )  ( ((DIR BS) (MODAL ALL) (LEX nil)  ((BCAT np)  (FEATS ( ) ) ) ) ) ) )  ( ((DIR FS) (MODAL ALL) (LEX nil)  ((BCAT vp)  (FEATS ( ) ) ) ) ) ) ) ) (SEM (LAM p (LAM x (seem (p x) ) ) ) ) 
)
(
(KEY 681273) (PARAM 1.0) (PHON to) 
(MORPH p) (SYN ( (((BCAT vp)  (FEATS ( ) ) )  ( ((DIR FS) (MODAL ALL) (LEX nil)  ((BCAT iv)  (FEATS ( ) ) ) ) ) ) ) ) (SEM (LAM p p) ) 
)
(
(KEY 279946) (PARAM 1.0) (PHON have) 
(MORPH aux) (SYN ( (((BCAT iv)  (FEATS ( ) ) )  ( ((DIR FS) (MODAL ALL) (LEX nil)  ((BCAT iv)  (FEATS ( ) ) ) ) ) ) ) ) (SEM (LAM p p) ) 
)
(
(KEY 704054) (PARAM 1.0) (PHON bought) 
(MORPH v) (SYN ( (((BCAT iv)  (FEATS ( ) ) )  ( ((DIR FS) (MODAL ALL) (LEX nil)  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) ) (SEM (LAM x (LAM y ((buy x)  y) ) ) ) 
)
(
(KEY 734676) (PARAM 1.0) (PHON the) 
(MORPH det) (SYN ( (((BCAT np)  (FEATS ( ) ) )  ( ((DIR FS) (MODAL STAR) (LEX nil)  ((BCAT n)  (FEATS ( ) ) ) ) ) ) ) ) (SEM def) 
)
(
(KEY 377018) (PARAM 1.0) (PHON car) 
(MORPH n) (SYN ((BCAT n)  (FEATS ( ) ) ) ) (SEM car) 
)
(
(KEY 17277) (PARAM 1.0) (PHON handsome) 
(MORPH p) (SYN ((BCAT propp)  (FEATS ( ) ) ) ) (SEM (LAM x (handsome x) ) ) 
)
(
(KEY 358245) (PARAM 1.0) (PHON kicked the bucked) 
(MORPH idio) (SYN ( (((BCAT s)  (FEATS ( ) ) )  ( ((DIR BS) (MODAL ALL) (LEX nil)  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) ) (SEM (LAM x (die_euphemistic x) ) ) 
)
(
(KEY 43869) (PARAM 1.0) (PHON kicked) 
(MORPH v) (SYN ( (( (( (((BCAT s)  (FEATS ( ) ) )  ( ((DIR BS) (MODAL ALL) (LEX nil)  ((BCAT np)  (FEATS ( ) ) ) ) ) ) )  ( ((DIR FS) (MODAL ALL) (LEX nil)  ((BCAT 'bucket')  quoted) ) ) ) )  ( ((DIR FS) (MODAL ALL) (LEX nil)  ((BCAT PredP)  (FEATS ( ) ) ) ) ) ) ) ) (SEM (LAM p (LAM x (LAM y ((die_ ((euphemistic p)  x) )  y) ) ) ) ) 
)
(
(KEY 234338) (PARAM 1.0) (PHON pick up) 
(MORPH pv) (SYN ( (((BCAT iv)  (FEATS ( ) ) )  ( ((DIR FS) (MODAL ALL) (LEX nil)  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) ) (SEM (LAM x (LAM y ((pick_culminate x)  y) ) ) ) 
)
(
(KEY 953896) (PARAM 1.0) (PHON pick) 
(MORPH pv2) (SYN ( (( (((BCAT iv)  (FEATS ( ) ) )  ( ((DIR FS) (MODAL ALL) (LEX nil)  ((BCAT 'up')  quoted) ) ) ) )  ( ((DIR FS) (MODAL ALL) (LEX nil)  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) ) (SEM (LAM x (LAM y (LAM z (((hold (culminate y) )  x)  z) ) ) ) ) 
)
(
(KEY 440048) (PARAM 1.0) (PHON run a mile) 
(MORPH #past) (SYN ((BCAT iv)  (FEATS ( ) ) ) ) (SEM (LAM x (run x) ) ) 
)
(
(KEY 488562) (PARAM 1.0) (PHON km) 
(MORPH #past) (SYN ( (((BCAT s)  (FEATS ( ) ) )  ( ((DIR BS) (MODAL ALL) (LEX nil)  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) ) (SEM (LAM x ((past run)  x) ) ) 
)
(
(KEY 924132) (PARAM 1.0) (PHON buy) 
(MORPH #past) (SYN ( (((BCAT iv)  (FEATS ( ) ) )  ( ((DIR FS) (MODAL ALL) (LEX nil)  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) ) (SEM (LAM x (LAM y ((buy x)  y) ) ) ) 
)
(
(KEY 410505) (PARAM 1.0) (PHON bought something) 
(MORPH #past) (SYN ( (( (((BCAT s)  (FEATS ( ) ) )  ( ((DIR BS) (MODAL ALL) (LEX nil)  ((BCAT np)  (FEATS ( ) ) ) ) ) ) )  ( ((DIR FS) (MODAL ALL) (LEX nil)  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) ) (SEM (LAM x (LAM y (((past buy)  x)  y) ) ) ) 
)
;;
;;;;;;;;;; end of bench.py-generated monadic Lisp grammar
)
