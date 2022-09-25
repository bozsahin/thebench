(
;;;;;;;;;; bench.py-generated monadic Lisp grammar
;;;;;;;;;; from hw.g September 25, 2022, 11:27:38
;;
;; a rules
;;
(
(KEY 632949) (PARAM 1.0) (INDEX #subj) 
(INSYN ((BCAT np)  (FEATS ( ) ) ) ) (OUTSYN  ( 0 ‾range)  ( 1 ((BCAT s)  (FEATS ( ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )   ( 0 ‾range)  ( 1 ((BCAT s)  (FEATS ( ) ) ) )  ( 2 ( (((DIR \)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) ) ) ) (INSEM lt) (OUTSEM (LAM lt (LAM p (p lt) ) ) ) 
)
(
(KEY 903523) (PARAM 1.0) (INDEX #lewis-rule) 
(INSYN  ( 0 ‾range)  ( 1 ((BCAT np)  (FEATS ( ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) (OUTSYN ((BCAT np)  (FEATS ( ) ) ) ) (INSEM lt) (OUTSEM (LAM lt (lt nompred) ) ) 
)
;;
;; elements
;;
(
(KEY 303130) (PARAM 1.0) (PHON it) 
(MORPH n) (SYN ((BCAT xp)  (FEATS ( (lex no) (per s3) ) ) ) ) (SEM it) 
)
(
(KEY 848420) (PARAM 1.0) (PHON john) 
(MORPH n) (SYN ((BCAT np)  (FEATS ( (per 3s) (lex yes) ) ) ) ) (SEM john) 
)
(
(KEY 953639) (PARAM 1.0) (PHON mary) 
(MORPH n) (SYN ((BCAT np)  (FEATS ( ) ) ) ) (SEM mary) 
)
(
(KEY 412272) (PARAM 1.0) (PHON and) 
(MORPH c) (SYN  ( 0 ‾range)  ( 1 ((BCAT @x)  special) )  ( 2 ( (((DIR /)  (MODAL .) )   ( 0 ‾range)  ( 1 ((BCAT @x)  special) )  ( 2 ( (((DIR \)  (MODAL .) )  ((BCAT @x)  special) ) ) ) ) ) ) ) (SEM (LAM p (LAM q (LAM x ((and (p x) )  (q x) ) ) ) ) ) 
)
(
(KEY 810510) (PARAM 1.0) (PHON study) 
(MORPH inf) (SYN ((BCAT iv)  (FEATS ( ) ) ) ) (SEM (LAM x (study x) ) ) 
)
(
(KEY 115455) (PARAM 1.0) (PHON persuaded) 
(MORPH v) (SYN  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1 ((BCAT s)  (FEATS ( ) ) ) )  ( 2 ( (((DIR \)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT vp)  (FEATS ( ) ) ) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) (SEM (LAM x (LAM p (LAM y (((persuade (p x) )  x)  y) ) ) ) ) 
)
(
(KEY 866327) (PARAM 1.0) (PHON promised) 
(MORPH v) (SYN  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1 ((BCAT s)  (FEATS ( ) ) ) )  ( 2 ( (((DIR \)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT vp)  (FEATS ( ) ) ) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) (SEM (LAM x (LAM p (LAM y (((promise (p y) )  x)  y) ) ) ) ) 
)
(
(KEY 133066) (PARAM 1.0) (PHON wanted) 
(MORPH v) (SYN  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1 ((BCAT s)  (FEATS ( ) ) ) )  ( 2 ( (((DIR \)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT vp)  (FEATS ( ) ) ) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) (SEM (LAM x (LAM p (LAM y ((want (p x) )  y) ) ) ) ) 
)
(
(KEY 285225) (PARAM 1.0) (PHON expected) 
(MORPH v) (SYN  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1 ((BCAT s)  (FEATS ( ) ) ) )  ( 2 ( (((DIR \)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT vp)  (FEATS ( ) ) ) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) (SEM (LAM x (LAM p (LAM y ((expect (p x) )  y) ) ) ) ) 
)
(
(KEY 360128) (PARAM 1.0) (PHON considered) 
(MORPH v) (SYN  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1 ((BCAT s)  (FEATS ( ) ) ) )  ( 2 ( (((DIR \)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT propp)  (FEATS ( ) ) ) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) (SEM (LAM x (LAM p (LAM y ((consider (p x) )  y) ) ) ) ) 
)
(
(KEY 434414) (PARAM 1.0) (PHON seemed) 
(MORPH v) (SYN  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1 ((BCAT s)  (FEATS ( ) ) ) )  ( 2 ( (((DIR \)  (MODAL .) )  ((BCAT xp)  (FEATS ( ) ) ) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT s)  (FEATS ( ) ) ) ) ) ) ) (SEM (LAM p (LAM x (seem p) ) ) ) 
)
(
(KEY 707716) (PARAM 1.0) (PHON seemed) 
(MORPH v) (SYN  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1 ((BCAT s)  (FEATS ( ) ) ) )  ( 2 ( (((DIR \)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT vp)  (FEATS ( ) ) ) ) ) ) ) (SEM (LAM p (LAM x (seem (p x) ) ) ) ) 
)
(
(KEY 481088) (PARAM 1.0) (PHON to) 
(MORPH p) (SYN  ( 0 ‾range)  ( 1 ((BCAT vp)  (FEATS ( ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT iv)  (FEATS ( ) ) ) ) ) ) ) (SEM (LAM p p) ) 
)
(
(KEY 195876) (PARAM 1.0) (PHON have) 
(MORPH aux) (SYN  ( 0 ‾range)  ( 1 ((BCAT iv)  (FEATS ( ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT iv)  (FEATS ( ) ) ) ) ) ) ) (SEM (LAM p p) ) 
)
(
(KEY 430206) (PARAM 1.0) (PHON bought) 
(MORPH v) (SYN  ( 0 ‾range)  ( 1 ((BCAT iv)  (FEATS ( ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) (SEM (LAM x (LAM y ((buy x)  y) ) ) ) 
)
(
(KEY 749342) (PARAM 1.0) (PHON the) 
(MORPH det) (SYN  ( 0 ‾range)  ( 1 ((BCAT np)  (FEATS ( ) ) ) )  ( 2 ( (((DIR /)  (MODAL *) )  ((BCAT n)  (FEATS ( ) ) ) ) ) ) ) (SEM def) 
)
(
(KEY 153827) (PARAM 1.0) (PHON car) 
(MORPH n) (SYN ((BCAT n)  (FEATS ( ) ) ) ) (SEM car) 
)
(
(KEY 712430) (PARAM 1.0) (PHON handsome) 
(MORPH p) (SYN ((BCAT propp)  (FEATS ( ) ) ) ) (SEM (LAM x (handsome x) ) ) 
)
(
(KEY 26424) (PARAM 1.0) (PHON kicked the bucked) 
(MORPH idio) (SYN  ( 0 ‾range)  ( 1 ((BCAT s)  (FEATS ( ) ) ) )  ( 2 ( (((DIR \)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) (SEM (LAM x (die_euphemistic x) ) ) 
)
(
(KEY 980787) (PARAM 1.0) (PHON kicked) 
(MORPH v) (SYN  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1 ((BCAT s)  (FEATS ( ) ) ) )  ( 2 ( (((DIR \)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT 'bucket')  quoted) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT PredP)  (FEATS ( ) ) ) ) ) ) ) (SEM (LAM p (LAM x (LAM y ((die_ ((euphemistic p)  x) )  y) ) ) ) ) 
)
(
(KEY 371827) (PARAM 1.0) (PHON pick up) 
(MORPH pv) (SYN  ( 0 ‾range)  ( 1 ((BCAT iv)  (FEATS ( ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) (SEM (LAM x (LAM y ((pick_culminate x)  y) ) ) ) 
)
(
(KEY 678907) (PARAM 1.0) (PHON pick) 
(MORPH pv2) (SYN  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1 ((BCAT iv)  (FEATS ( ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT 'up')  quoted) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) (SEM (LAM x (LAM y (LAM z (((hold (culminate y) )  x)  z) ) ) ) ) 
)
(
(KEY 181654) (PARAM 1.0) (PHON run a mile) 
(MORPH #past) (SYN ((BCAT iv)  (FEATS ( ) ) ) ) (SEM (LAM x (run x) ) ) 
)
(
(KEY 982459) (PARAM 1.0) (PHON km) 
(MORPH #past) (SYN  ( 0 ‾range)  ( 1 ((BCAT s)  (FEATS ( ) ) ) )  ( 2 ( (((DIR \)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) (SEM (LAM x ((past run)  x) ) ) 
)
(
(KEY 202387) (PARAM 1.0) (PHON buy) 
(MORPH #past) (SYN  ( 0 ‾range)  ( 1 ((BCAT iv)  (FEATS ( ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) (SEM (LAM x (LAM y ((buy x)  y) ) ) ) 
)
(
(KEY 494105) (PARAM 1.0) (PHON bought something) 
(MORPH #past) (SYN  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1 ((BCAT s)  (FEATS ( ) ) ) )  ( 2 ( (((DIR \)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) )  ( 2 ( (((DIR /)  (MODAL .) )  ((BCAT np)  (FEATS ( ) ) ) ) ) ) ) (SEM (LAM x (LAM y (((past buy)  x)  y) ) ) ) 
)
;;
;;;;;;;;;; end of bench.py-generated monadic Lisp grammar
)
