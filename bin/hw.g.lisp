(
;;;;;;;;;; bench.py-generated monadic Lisp grammar
;;;;;;;;;; from hw.g September 24, 2022, 15:54:30
;;
;; a rules
;;
(
(KEY 669446) (PARAM 1.0) (INDEX #subj) 
 ( 0 ‾arule)  ( 1 #subj)  ( 2  ( 0 ‾apair)  ( 1  ( 0 ‾cat)  ( 1 (SYN ((BCAT np)  (FEATS ( ) ) ) ) )  ( 2 (SEM lt) ) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾range)  ( 1 ((BCAT s)  (FEATS ( ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )   ( 0 ‾range)  ( 1 ((BCAT s)  (FEATS ( ) ) ) )  ( 2 ( (((DIR \)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) ) ) ) )  ( 2 (SEM (LAM lt (LAM p (p lt) ) ) ) ) ) ) 
)
(
(KEY 354256) (PARAM 1.0) (INDEX #lewis-rule) 
 ( 0 ‾arule)  ( 1 #lewis-rule)  ( 2  ( 0 ‾apair)  ( 1  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾range)  ( 1 ((BCAT np)  (FEATS ( ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) )  ( 2 (SEM lt) ) )  ( 2  ( 0 ‾cat)  ( 1 (SYN ((BCAT np)  (FEATS ( ) ) ) ) )  ( 2 (SEM (LAM lt (lt nompred) ) ) ) ) ) 
)
;;
;; elements
;;
(
(KEY 45061) (PARAM 1.0) (PHON it) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 it)  ( 2 n) )  ( 2  ( 0 ‾cat)  ( 1 (SYN ((BCAT xp)  (FEATS ( (lex no) (per s3) ) ) ) ) )  ( 2 (SEM it) ) ) 
)
(
(KEY 396371) (PARAM 1.0) (PHON john) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 john)  ( 2 n) )  ( 2  ( 0 ‾cat)  ( 1 (SYN ((BCAT np)  (FEATS ( (per 3s) (lex yes) ) ) ) ) )  ( 2 (SEM john) ) ) 
)
(
(KEY 396913) (PARAM 1.0) (PHON mary) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 mary)  ( 2 n) )  ( 2  ( 0 ‾cat)  ( 1 (SYN ((BCAT np)  (FEATS ( ) ) ) ) )  ( 2 (SEM mary) ) ) 
)
(
(KEY 860400) (PARAM 1.0) (PHON and) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 and)  ( 2 c) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾range)  ( 1 ((BCAT @x)  special) )  ( 2 ( (((DIR /)  (MODAL .) )   ( 0 ‾range)  ( 1 ((BCAT @x)  special) )  ( 2 ( (((DIR \)  (MODAL .) )  ((BCAT @x)  special) ) ) ) ) ) ) ) )  ( 2 (SEM (LAM p (LAM q (LAM x ((and (p x) )  (q x) ) ) ) ) ) ) ) 
)
(
(KEY 441069) (PARAM 1.0) (PHON study) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 study)  ( 2 inf) )  ( 2  ( 0 ‾cat)  ( 1 (SYN ((BCAT iv)  (FEATS ( ) ) ) ) )  ( 2 (SEM (LAM x (study x) ) ) ) ) 
)
(
(KEY 333055) (PARAM 1.0) (PHON persuaded) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 persuaded)  ( 2 v) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1 ((BCAT s)  (FEATS ( ) ) ) )  ( 2 ( (((DIR \)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT vp)  (FEATS ( ) ) ) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) )  ( 2 (SEM (LAM x (LAM p (LAM y (((persuade (p x) )  x)  y) ) ) ) ) ) ) 
)
(
(KEY 872408) (PARAM 1.0) (PHON promised) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 promised)  ( 2 v) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1 ((BCAT s)  (FEATS ( ) ) ) )  ( 2 ( (((DIR \)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT vp)  (FEATS ( ) ) ) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) )  ( 2 (SEM (LAM x (LAM p (LAM y (((promise (p y) )  x)  y) ) ) ) ) ) ) 
)
(
(KEY 323327) (PARAM 1.0) (PHON wanted) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 wanted)  ( 2 v) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1 ((BCAT s)  (FEATS ( ) ) ) )  ( 2 ( (((DIR \)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT vp)  (FEATS ( ) ) ) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) )  ( 2 (SEM (LAM x (LAM p (LAM y ((want (p x) )  y) ) ) ) ) ) ) 
)
(
(KEY 322042) (PARAM 1.0) (PHON expected) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 expected)  ( 2 v) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1 ((BCAT s)  (FEATS ( ) ) ) )  ( 2 ( (((DIR \)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT vp)  (FEATS ( ) ) ) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) )  ( 2 (SEM (LAM x (LAM p (LAM y ((expect (p x) )  y) ) ) ) ) ) ) 
)
(
(KEY 230603) (PARAM 1.0) (PHON considered) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 considered)  ( 2 v) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1 ((BCAT s)  (FEATS ( ) ) ) )  ( 2 ( (((DIR \)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT propp)  (FEATS ( ) ) ) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) )  ( 2 (SEM (LAM x (LAM p (LAM y ((consider (p x) )  y) ) ) ) ) ) ) 
)
(
(KEY 425085) (PARAM 1.0) (PHON seemed) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 seemed)  ( 2 v) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1 ((BCAT s)  (FEATS ( ) ) ) )  ( 2 ( (((DIR \)  (MODAL .) )  ((BCAT xp)  (FEATS ( ) ) ) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT s)  (FEATS ( ) ) ) ) ) ) ) )  ( 2 (SEM (LAM p (LAM x (seem p) ) ) ) ) ) 
)
(
(KEY 481648) (PARAM 1.0) (PHON seemed) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 seemed)  ( 2 v) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1 ((BCAT s)  (FEATS ( ) ) ) )  ( 2 ( (((DIR \)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT vp)  (FEATS ( ) ) ) ) ) ) ) )  ( 2 (SEM (LAM p (LAM x (seem (p x) ) ) ) ) ) ) 
)
(
(KEY 658992) (PARAM 1.0) (PHON to) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 to)  ( 2 p) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾range)  ( 1 ((BCAT vp)  (FEATS ( ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT iv)  (FEATS ( ) ) ) ) ) ) ) )  ( 2 (SEM (LAM p p) ) ) ) 
)
(
(KEY 980654) (PARAM 1.0) (PHON have) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 have)  ( 2 aux) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾range)  ( 1 ((BCAT iv)  (FEATS ( ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT iv)  (FEATS ( ) ) ) ) ) ) ) )  ( 2 (SEM (LAM p p) ) ) ) 
)
(
(KEY 834859) (PARAM 1.0) (PHON bought) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 bought)  ( 2 v) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾range)  ( 1 ((BCAT iv)  (FEATS ( ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) )  ( 2 (SEM (LAM x (LAM y ((buy x)  y) ) ) ) ) ) 
)
(
(KEY 332488) (PARAM 1.0) (PHON the) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 the)  ( 2 det) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾range)  ( 1 ((BCAT np)  (FEATS ( ) ) ) )  ( 2 ( (((DIR /)  (MODAL *) )  ((BCAT n)  (FEATS ( ) ) ) ) ) ) ) )  ( 2 (SEM def) ) ) 
)
(
(KEY 961272) (PARAM 1.0) (PHON car) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 car)  ( 2 n) )  ( 2  ( 0 ‾cat)  ( 1 (SYN ((BCAT n)  (FEATS ( ) ) ) ) )  ( 2 (SEM car) ) ) 
)
(
(KEY 901457) (PARAM 1.0) (PHON handsome) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 handsome)  ( 2 p) )  ( 2  ( 0 ‾cat)  ( 1 (SYN ((BCAT propp)  (FEATS ( ) ) ) ) )  ( 2 (SEM (LAM x (handsome x) ) ) ) ) 
)
(
(KEY 711660) (PARAM 1.0) (PHON kicked the bucked) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 kicked the bucked)  ( 2 idio) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾range)  ( 1 ((BCAT s)  (FEATS ( ) ) ) )  ( 2 ( (((DIR \)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) )  ( 2 (SEM (LAM x (die_euphemistic x) ) ) ) ) 
)
(
(KEY 454497) (PARAM 1.0) (PHON kicked) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 kicked)  ( 2 v) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1 ((BCAT s)  (FEATS ( ) ) ) )  ( 2 ( (((DIR \)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT 'bucket')  quoted) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT PredP)  (FEATS ( ) ) ) ) ) ) ) )  ( 2 (SEM (LAM p (LAM x (LAM y ((die_ ((euphemistic p)  x) )  y) ) ) ) ) ) ) 
)
(
(KEY 660727) (PARAM 1.0) (PHON pick up) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 pick up)  ( 2 pv) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾range)  ( 1 ((BCAT iv)  (FEATS ( ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) )  ( 2 (SEM (LAM x (LAM y ((pick_culminate x)  y) ) ) ) ) ) 
)
(
(KEY 437473) (PARAM 1.0) (PHON pick) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 pick)  ( 2 pv2) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1 ((BCAT iv)  (FEATS ( ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT 'up')  quoted) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) )  ( 2 (SEM (LAM x (LAM y (LAM z (((hold (culminate y) )  x)  z) ) ) ) ) ) ) 
)
(
(KEY 970904) (PARAM 1.0) (PHON run a mile) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 run a mile)  ( 2 #past) )  ( 2  ( 0 ‾cat)  ( 1 (SYN ((BCAT iv)  (FEATS ( ) ) ) ) )  ( 2 (SEM (LAM x (run x) ) ) ) ) 
)
(
(KEY 842734) (PARAM 1.0) (PHON km) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 km)  ( 2 #past) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾range)  ( 1 ((BCAT s)  (FEATS ( ) ) ) )  ( 2 ( (((DIR \)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) )  ( 2 (SEM (LAM x ((past run)  x) ) ) ) ) 
)
(
(KEY 724170) (PARAM 1.0) (PHON buy) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 buy)  ( 2 #past) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾range)  ( 1 ((BCAT iv)  (FEATS ( ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) )  ( 2 (SEM (LAM x (LAM y ((buy x)  y) ) ) ) ) ) 
)
(
(KEY 555755) (PARAM 1.0) (PHON bought something) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 bought something)  ( 2 #past) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1 ((BCAT s)  (FEATS ( ) ) ) )  ( 2 ( (((DIR \)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) )  ( 2 (SEM (LAM x (LAM y (((past buy)  x)  y) ) ) ) ) ) 
)
;;
;;;;;;;;;; end of bench.py-generated monadic Lisp grammar
)
