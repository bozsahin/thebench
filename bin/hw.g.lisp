(
;;;;;;;;;; bench.py-generated monadic Lisp grammar
;;;;;;;;;; from hw.g October 07, 2022, 13:23:20
;;
;; a rules
;;
(
(KEY 319342)(PARAM 1.0)(INDEX subj)
(INSYN ((BCAT np)(FEATS NIL)))(OUTSYN (((BCAT s)(FEATS NIL))(DIR FS)(MODAL ALL)(((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)((BCAT np)(FEATS NIL)))))(INSEM lt)(OUTSEM (LAM lt (LAM p (p lt))))
)
(
(KEY 303214)(PARAM 1.0)(INDEX lewis-rule)
(INSYN (((BCAT np)(FEATS NIL))(DIR FS)(MODAL ALL)((BCAT np)(FEATS NIL))))(OUTSYN ((BCAT np)(FEATS NIL)))(INSEM lt)(OUTSEM (LAM lt (lt nompred)))
)
;;
;; elements
;;
(
(KEY 700599)(PARAM 1.0)(PHON it)
(MORPH n)(SYN ((BCAT xp)(FEATS (lex no)(per s3))))(SEM it)
)
(
(KEY 858160)(PARAM 1.0)(PHON john)
(MORPH n)(SYN ((BCAT np)(FEATS (per 3s)(lex yes))))(SEM john)
)
(
(KEY 858972)(PARAM 1.0)(PHON mary)
(MORPH n)(SYN ((BCAT np)(FEATS NIL)))(SEM mary)
)
(
(KEY 987115)(PARAM 1.0)(PHON and)
(MORPH c)(SYN (((BCAT @x)special)(DIR FS)(MODAL ALL)(((BCAT @x)special)(DIR BS)(MODAL ALL)((BCAT @x)special))))(SEM (LAM p (LAM q (LAM x ((and (p x)) (q x))))))
)
(
(KEY 392653)(PARAM 1.0)(PHON study)
(MORPH inf)(SYN ((BCAT iv)(FEATS NIL)))(SEM (LAM x (study x)))
)
(
(KEY 575970)(PARAM 1.0)(PHON persuaded)
(MORPH v)(SYN (((((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)((BCAT np)(FEATS NIL)))(DIR FS)(MODAL ALL)((BCAT vp)(FEATS NIL)))(DIR FS)(MODAL CROSS)((BCAT np)(FEATS NIL))))(SEM (LAM x (LAM p (LAM y (((persuade (p x)) x) y)))))
)
(
(KEY 680062)(PARAM 1.0)(PHON promised)
(MORPH v)(SYN (((((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)(LEX t)((BCAT np)(FEATS NIL)))(DIR FS)(MODAL ALL)((BCAT vp)(FEATS NIL)))(DIR FS)(MODAL ALL)(LEX t)((BCAT np)(FEATS NIL))))(SEM (LAM x (LAM p (LAM y (((promise (p y)) x) y)))))
)
(
(KEY 977710)(PARAM 1.0)(PHON wanted)
(MORPH v)(SYN (((((BCAT s)(FEATS NIL))(DIR BS)(MODAL STAR)((BCAT np)(FEATS NIL)))(DIR FS)(MODAL HARMONIC)((BCAT vp)(FEATS NIL)))(DIR FS)(MODAL ALL)((BCAT np)(FEATS NIL))))(SEM (LAM x (LAM p (LAM y ((want (p x)) y)))))
)
(
(KEY 60670)(PARAM 1.0)(PHON expected)
(MORPH v)(SYN (((((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)((BCAT np)(FEATS NIL)))(DIR FS)(MODAL ALL)((BCAT vp)(FEATS NIL)))(DIR FS)(MODAL ALL)((BCAT np)(FEATS NIL))))(SEM (LAM x (LAM p (LAM y ((expect (p x)) y)))))
)
(
(KEY 288169)(PARAM 1.0)(PHON considered)
(MORPH v)(SYN (((((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)((BCAT np)(FEATS NIL)))(DIR FS)(MODAL ALL)((BCAT propp)(FEATS NIL)))(DIR FS)(MODAL ALL)((BCAT np)(FEATS NIL))))(SEM (LAM x (LAM p (LAM y ((consider (p x)) y)))))
)
(
(KEY 86913)(PARAM 1.0)(PHON seemed)
(MORPH v)(SYN ((((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)((BCAT xp)(FEATS NIL)))(DIR FS)(MODAL ALL)((BCAT s)(FEATS NIL))))(SEM (LAM p (LAM x (seem p))))
)
(
(KEY 757556)(PARAM 1.0)(PHON seemed)
(MORPH v)(SYN ((((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)((BCAT np)(FEATS NIL)))(DIR FS)(MODAL ALL)((BCAT vp)(FEATS NIL))))(SEM (LAM p (LAM x (seem (p x)))))
)
(
(KEY 375202)(PARAM 1.0)(PHON to)
(MORPH p)(SYN (((BCAT vp)(FEATS NIL))(DIR FS)(MODAL ALL)((BCAT iv)(FEATS NIL))))(SEM (LAM p p))
)
(
(KEY 676255)(PARAM 1.0)(PHON have)
(MORPH aux)(SYN (((BCAT iv)(FEATS NIL))(DIR FS)(MODAL ALL)((BCAT iv)(FEATS NIL))))(SEM (LAM p p))
)
(
(KEY 880302)(PARAM 1.0)(PHON bought)
(MORPH v)(SYN (((BCAT iv)(FEATS NIL))(DIR FS)(MODAL ALL)((BCAT np)(FEATS NIL))))(SEM (LAM x (LAM y ((buy x) y))))
)
(
(KEY 78699)(PARAM 1.0)(PHON the)
(MORPH det)(SYN (((BCAT np)(FEATS NIL))(DIR FS)(MODAL STAR)((BCAT n)(FEATS NIL))))(SEM def)
)
(
(KEY 867821)(PARAM 1.0)(PHON car)
(MORPH n)(SYN ((BCAT n)(FEATS NIL)))(SEM car)
)
(
(KEY 451673)(PARAM 1.0)(PHON handsome)
(MORPH p)(SYN ((BCAT propp)(FEATS NIL)))(SEM (LAM x (handsome x)))
)
(
(KEY 736978)(PARAM 1.0)(PHON kicked the bucked)
(MORPH idio)(SYN (((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)((BCAT np)(FEATS NIL))))(SEM (LAM x (die_euphemistic x)))
)
(
(KEY 50758)(PARAM 1.0)(PHON kicked)
(MORPH v)(SYN (((((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)((BCAT np)(FEATS NIL)))(DIR FS)(MODAL ALL)((BCAT (the bucket))(BCONST T)(FEATS NIL)))(DIR FS)(MODAL ALL)((BCAT PredP)(FEATS NIL))))(SEM (LAM p (LAM x (LAM y ((die_ ((euphemistic p) x)) y)))))
)
(
(KEY 195135)(PARAM 1.0)(PHON pick up)
(MORPH pv)(SYN (((BCAT iv)(FEATS NIL))(DIR FS)(MODAL ALL)((BCAT np)(FEATS NIL))))(SEM (LAM x (LAM y ((pick_culminate x) y))))
)
(
(KEY 402087)(PARAM 1.0)(PHON pick)
(MORPH pv2)(SYN ((((BCAT iv)(FEATS NIL))(DIR FS)(MODAL ALL)((BCAT (up))(BCONST T)(FEATS NIL)))(DIR FS)(MODAL ALL)((BCAT np)(FEATS NIL))))(SEM (LAM x (LAM y (LAM z (((hold (culminate y)) x) z)))))
)
(
(KEY 955978)(PARAM 1.0)(PHON run a mile)
(MORPH past)(SYN ((BCAT iv)(FEATS NIL)))(SEM (LAM x (run x)))
)
(
(KEY 122029)(PARAM 1.0)(PHON km)
(MORPH past)(SYN (((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)((BCAT np)(FEATS NIL))))(SEM (LAM x ((past run) x)))
)
(
(KEY 393539)(PARAM 1.0)(PHON buy)
(MORPH past)(SYN (((BCAT iv)(FEATS NIL))(DIR FS)(MODAL ALL)((BCAT np)(FEATS NIL))))(SEM (LAM x (LAM y ((buy x) y))))
)
(
(KEY 975260)(PARAM 1.0)(PHON bought something)
(MORPH past)(SYN ((((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)((BCAT np)(FEATS NIL)))(DIR FS)(MODAL ALL)((BCAT np)(FEATS NIL))))(SEM (LAM x (LAM y (((past buy) x) y))))
)
;;
;;;;;;;;;; end of bench.py-generated monadic Lisp grammar
)
