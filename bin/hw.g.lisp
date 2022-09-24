(
;;;;;;;;;; bench.py-generated monadic Lisp grammar
;;;;;;;;;; from hw.g September 24, 2022, 17:58:22
;;
;; a rules
;;
(
(KEY 472945) (PARAM 1.0) (INDEX #subj) 
(INSYN ((BCAT np)  (FEATS ( ) ) ) ) (OUTSYN  ( 0 ‾range)  ( 1 ((BCAT s)  (FEATS ( ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )   ( 0 ‾range)  ( 1 ((BCAT s)  (FEATS ( ) ) ) )  ( 2 ( (((DIR \)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) ) ) ) (INSEM (SEM lt) ) (OUTSEM (SEM (LAM lt (LAM p (p lt) ) ) ) ) 
)
(
(KEY 307663) (PARAM 1.0) (INDEX #lewis-rule) 
(INSYN  ( 0 ‾range)  ( 1 ((BCAT np)  (FEATS ( ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) (OUTSYN ((BCAT np)  (FEATS ( ) ) ) ) (INSEM (SEM lt) ) (OUTSEM (SEM (LAM lt (lt nompred) ) ) ) 
)
;;
;; elements
;;
(
(KEY 17604) (PARAM 1.0) (PHON it) 
(MORPH n) (SYN ((BCAT xp)  (FEATS ( (lex no) (per s3) ) ) ) ) (SEM it) 
)
(
(KEY 746134) (PARAM 1.0) (PHON john) 
(MORPH n) (SYN ((BCAT np)  (FEATS ( (per 3s) (lex yes) ) ) ) ) (SEM john) 
)
(
(KEY 928707) (PARAM 1.0) (PHON mary) 
(MORPH n) (SYN ((BCAT np)  (FEATS ( ) ) ) ) (SEM mary) 
)
(
(KEY 283322) (PARAM 1.0) (PHON and) 
(MORPH c) (SYN  ( 0 ‾range)  ( 1 ((BCAT @x)  special) )  ( 2 ( (((DIR /)  (MODAL .) )   ( 0 ‾range)  ( 1 ((BCAT @x)  special) )  ( 2 ( (((DIR \)  (MODAL .) )  ((BCAT @x)  special) ) ) ) ) ) ) ) (SEM (LAM p (LAM q (LAM x ((and (p x) )  (q x) ) ) ) ) ) 
)
(
(KEY 471858) (PARAM 1.0) (PHON study) 
(MORPH inf) (SYN ((BCAT iv)  (FEATS ( ) ) ) ) (SEM (LAM x (study x) ) ) 
)
(
(KEY 194789) (PARAM 1.0) (PHON persuaded) 
(MORPH v) (SYN  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1 ((BCAT s)  (FEATS ( ) ) ) )  ( 2 ( (((DIR \)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT vp)  (FEATS ( ) ) ) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) (SEM (LAM x (LAM p (LAM y (((persuade (p x) )  x)  y) ) ) ) ) 
)
(
(KEY 692611) (PARAM 1.0) (PHON promised) 
(MORPH v) (SYN  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1 ((BCAT s)  (FEATS ( ) ) ) )  ( 2 ( (((DIR \)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT vp)  (FEATS ( ) ) ) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) (SEM (LAM x (LAM p (LAM y (((promise (p y) )  x)  y) ) ) ) ) 
)
(
(KEY 928259) (PARAM 1.0) (PHON wanted) 
(MORPH v) (SYN  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1 ((BCAT s)  (FEATS ( ) ) ) )  ( 2 ( (((DIR \)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT vp)  (FEATS ( ) ) ) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) (SEM (LAM x (LAM p (LAM y ((want (p x) )  y) ) ) ) ) 
)
(
(KEY 702360) (PARAM 1.0) (PHON expected) 
(MORPH v) (SYN  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1 ((BCAT s)  (FEATS ( ) ) ) )  ( 2 ( (((DIR \)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT vp)  (FEATS ( ) ) ) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) (SEM (LAM x (LAM p (LAM y ((expect (p x) )  y) ) ) ) ) 
)
(
(KEY 5853) (PARAM 1.0) (PHON considered) 
(MORPH v) (SYN  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1 ((BCAT s)  (FEATS ( ) ) ) )  ( 2 ( (((DIR \)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT propp)  (FEATS ( ) ) ) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) (SEM (LAM x (LAM p (LAM y ((consider (p x) )  y) ) ) ) ) 
)
(
(KEY 116636) (PARAM 1.0) (PHON seemed) 
(MORPH v) (SYN  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1 ((BCAT s)  (FEATS ( ) ) ) )  ( 2 ( (((DIR \)  (MODAL .) )  ((BCAT xp)  (FEATS ( ) ) ) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT s)  (FEATS ( ) ) ) ) ) ) ) (SEM (LAM p (LAM x (seem p) ) ) ) 
)
(
(KEY 415086) (PARAM 1.0) (PHON seemed) 
(MORPH v) (SYN  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1 ((BCAT s)  (FEATS ( ) ) ) )  ( 2 ( (((DIR \)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT vp)  (FEATS ( ) ) ) ) ) ) ) (SEM (LAM p (LAM x (seem (p x) ) ) ) ) 
)
(
(KEY 575893) (PARAM 1.0) (PHON to) 
(MORPH p) (SYN  ( 0 ‾range)  ( 1 ((BCAT vp)  (FEATS ( ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT iv)  (FEATS ( ) ) ) ) ) ) ) (SEM (LAM p p) ) 
)
(
(KEY 606335) (PARAM 1.0) (PHON have) 
(MORPH aux) (SYN  ( 0 ‾range)  ( 1 ((BCAT iv)  (FEATS ( ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT iv)  (FEATS ( ) ) ) ) ) ) ) (SEM (LAM p p) ) 
)
(
(KEY 608856) (PARAM 1.0) (PHON bought) 
(MORPH v) (SYN  ( 0 ‾range)  ( 1 ((BCAT iv)  (FEATS ( ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) (SEM (LAM x (LAM y ((buy x)  y) ) ) ) 
)
(
(KEY 981276) (PARAM 1.0) (PHON the) 
(MORPH det) (SYN  ( 0 ‾range)  ( 1 ((BCAT np)  (FEATS ( ) ) ) )  ( 2 ( (((DIR /)  (MODAL *) )  ((BCAT n)  (FEATS ( ) ) ) ) ) ) ) (SEM def) 
)
(
(KEY 424353) (PARAM 1.0) (PHON car) 
(MORPH n) (SYN ((BCAT n)  (FEATS ( ) ) ) ) (SEM car) 
)
(
(KEY 827249) (PARAM 1.0) (PHON handsome) 
(MORPH p) (SYN ((BCAT propp)  (FEATS ( ) ) ) ) (SEM (LAM x (handsome x) ) ) 
)
(
(KEY 133415) (PARAM 1.0) (PHON kicked the bucked) 
(MORPH idio) (SYN  ( 0 ‾range)  ( 1 ((BCAT s)  (FEATS ( ) ) ) )  ( 2 ( (((DIR \)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) (SEM (LAM x (die_euphemistic x) ) ) 
)
(
(KEY 591609) (PARAM 1.0) (PHON kicked) 
(MORPH v) (SYN  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1 ((BCAT s)  (FEATS ( ) ) ) )  ( 2 ( (((DIR \)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT 'bucket')  quoted) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT PredP)  (FEATS ( ) ) ) ) ) ) ) (SEM (LAM p (LAM x (LAM y ((die_ ((euphemistic p)  x) )  y) ) ) ) ) 
)
(
(KEY 322670) (PARAM 1.0) (PHON pick up) 
(MORPH pv) (SYN  ( 0 ‾range)  ( 1 ((BCAT iv)  (FEATS ( ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) (SEM (LAM x (LAM y ((pick_culminate x)  y) ) ) ) 
)
(
(KEY 465773) (PARAM 1.0) (PHON pick) 
(MORPH pv2) (SYN  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1 ((BCAT iv)  (FEATS ( ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT 'up')  quoted) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) (SEM (LAM x (LAM y (LAM z (((hold (culminate y) )  x)  z) ) ) ) ) 
)
(
(KEY 97662) (PARAM 1.0) (PHON run a mile) 
(MORPH #past) (SYN ((BCAT iv)  (FEATS ( ) ) ) ) (SEM (LAM x (run x) ) ) 
)
(
(KEY 872620) (PARAM 1.0) (PHON km) 
(MORPH #past) (SYN  ( 0 ‾range)  ( 1 ((BCAT s)  (FEATS ( ) ) ) )  ( 2 ( (((DIR \)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) (SEM (LAM x ((past run)  x) ) ) 
)
(
(KEY 291601) (PARAM 1.0) (PHON buy) 
(MORPH #past) (SYN  ( 0 ‾range)  ( 1 ((BCAT iv)  (FEATS ( ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) (SEM (LAM x (LAM y ((buy x)  y) ) ) ) 
)
(
(KEY 684421) (PARAM 1.0) (PHON bought something) 
(MORPH #past) (SYN  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1 ((BCAT s)  (FEATS ( ) ) ) )  ( 2 ( (((DIR \)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) (SEM (LAM x (LAM y (((past buy)  x)  y) ) ) ) 
)
;;
;;;;;;;;;; end of bench.py-generated monadic Lisp grammar
)
