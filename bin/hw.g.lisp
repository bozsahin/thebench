(
;;;;;;;;;; bench.py-generated monadic Lisp grammar
;;;;;;;;;; from hw.g October 02, 2022, 14:32:06
;;
;; a rules
;;
(
(KEY 769281)(PARAM 1.0)(INDEX subj)
(INSYN (BCAT np)(FEATS NIL))(OUTSYN ((BCAT s)(FEATS NIL))(DIR FS)(MODAL ALL)(LEX nil)(((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)(LEX nil)((BCAT np)(FEATS NIL))))(INSEM lt)(OUTSEM (LAM lt (LAM p (p lt))))
)
(
(KEY 401053)(PARAM 1.0)(INDEX lewis-rule)
(INSYN ((BCAT np)(FEATS NIL))(DIR FS)(MODAL ALL)(LEX nil)((BCAT np)(FEATS NIL)))(OUTSYN (BCAT np)(FEATS NIL))(INSEM lt)(OUTSEM (LAM lt (lt nompred)))
)
;;
;; elements
;;
(
(KEY 90128)(PARAM 1.0)(PHON it)
(MORPH n)(SYN ((BCAT xp)(FEATS (lex no)(per s3))))(SEM it)
)
(
(KEY 439376)(PARAM 1.0)(PHON john)
(MORPH n)(SYN ((BCAT np)(FEATS (per 3s)(lex yes))))(SEM john)
)
(
(KEY 4582)(PARAM 1.0)(PHON mary)
(MORPH n)(SYN ((BCAT np)(FEATS NIL)))(SEM mary)
)
(
(KEY 750147)(PARAM 1.0)(PHON and)
(MORPH c)(SYN (((BCAT @x)special)(DIR FS)(MODAL ALL)(LEX nil)(((BCAT @x)special)(DIR BS)(MODAL ALL)(LEX nil)((BCAT @x)special))))(SEM (LAM p (LAM q (LAM x ((and (p x)) (q x))))))
)
(
(KEY 746289)(PARAM 1.0)(PHON study)
(MORPH inf)(SYN ((BCAT iv)(FEATS NIL)))(SEM (LAM x (study x)))
)
(
(KEY 676249)(PARAM 1.0)(PHON persuaded)
(MORPH v)(SYN (((((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)(LEX nil)((BCAT np)(FEATS NIL)))(DIR FS)(MODAL ALL)(LEX nil)((BCAT vp)(FEATS NIL)))(DIR FS)(MODAL CROSS)(LEX nil)((BCAT np)(FEATS NIL))))(SEM (LAM x (LAM p (LAM y (((persuade (p x)) x) y)))))
)
(
(KEY 155672)(PARAM 1.0)(PHON promised)
(MORPH v)(SYN (((((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)(LEX t)((BCAT np)(FEATS NIL)))(DIR FS)(MODAL ALL)(LEX nil)((BCAT vp)(FEATS NIL)))(DIR FS)(MODAL ALL)(LEX t)((BCAT np)(FEATS NIL))))(SEM (LAM x (LAM p (LAM y (((promise (p y)) x) y)))))
)
(
(KEY 664143)(PARAM 1.0)(PHON wanted)
(MORPH v)(SYN (((((BCAT s)(FEATS NIL))(DIR BS)(MODAL STAR)(LEX nil)((BCAT np)(FEATS NIL)))(DIR FS)(MODAL HARMONIC)(LEX nil)((BCAT vp)(FEATS NIL)))(DIR FS)(MODAL ALL)(LEX nil)((BCAT np)(FEATS NIL))))(SEM (LAM x (LAM p (LAM y ((want (p x)) y)))))
)
(
(KEY 614904)(PARAM 1.0)(PHON expected)
(MORPH v)(SYN (((((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)(LEX nil)((BCAT np)(FEATS NIL)))(DIR FS)(MODAL ALL)(LEX nil)((BCAT vp)(FEATS NIL)))(DIR FS)(MODAL ALL)(LEX nil)((BCAT np)(FEATS NIL))))(SEM (LAM x (LAM p (LAM y ((expect (p x)) y)))))
)
(
(KEY 605845)(PARAM 1.0)(PHON considered)
(MORPH v)(SYN (((((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)(LEX nil)((BCAT np)(FEATS NIL)))(DIR FS)(MODAL ALL)(LEX nil)((BCAT propp)(FEATS NIL)))(DIR FS)(MODAL ALL)(LEX nil)((BCAT np)(FEATS NIL))))(SEM (LAM x (LAM p (LAM y ((consider (p x)) y)))))
)
(
(KEY 79637)(PARAM 1.0)(PHON seemed)
(MORPH v)(SYN ((((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)(LEX nil)((BCAT xp)(FEATS NIL)))(DIR FS)(MODAL ALL)(LEX nil)((BCAT s)(FEATS NIL))))(SEM (LAM p (LAM x (seem p))))
)
(
(KEY 946861)(PARAM 1.0)(PHON seemed)
(MORPH v)(SYN ((((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)(LEX nil)((BCAT np)(FEATS NIL)))(DIR FS)(MODAL ALL)(LEX nil)((BCAT vp)(FEATS NIL))))(SEM (LAM p (LAM x (seem (p x)))))
)
(
(KEY 208281)(PARAM 1.0)(PHON to)
(MORPH p)(SYN (((BCAT vp)(FEATS NIL))(DIR FS)(MODAL ALL)(LEX nil)((BCAT iv)(FEATS NIL))))(SEM (LAM p p))
)
(
(KEY 62040)(PARAM 1.0)(PHON have)
(MORPH aux)(SYN (((BCAT iv)(FEATS NIL))(DIR FS)(MODAL ALL)(LEX nil)((BCAT iv)(FEATS NIL))))(SEM (LAM p p))
)
(
(KEY 657401)(PARAM 1.0)(PHON bought)
(MORPH v)(SYN (((BCAT iv)(FEATS NIL))(DIR FS)(MODAL ALL)(LEX nil)((BCAT np)(FEATS NIL))))(SEM (LAM x (LAM y ((buy x) y))))
)
(
(KEY 330507)(PARAM 1.0)(PHON the)
(MORPH det)(SYN (((BCAT np)(FEATS NIL))(DIR FS)(MODAL STAR)(LEX nil)((BCAT n)(FEATS NIL))))(SEM def)
)
(
(KEY 771993)(PARAM 1.0)(PHON car)
(MORPH n)(SYN ((BCAT n)(FEATS NIL)))(SEM car)
)
(
(KEY 104916)(PARAM 1.0)(PHON handsome)
(MORPH p)(SYN ((BCAT propp)(FEATS NIL)))(SEM (LAM x (handsome x)))
)
(
(KEY 876179)(PARAM 1.0)(PHON kicked the bucked)
(MORPH idio)(SYN (((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)(LEX nil)((BCAT np)(FEATS NIL))))(SEM (LAM x (die_euphemistic x)))
)
(
(KEY 423003)(PARAM 1.0)(PHON kicked)
(MORPH v)(SYN (((((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)(LEX nil)((BCAT np)(FEATS NIL)))(DIR FS)(MODAL ALL)(LEX nil)((BCAT (the bucket))(BCONST T)(FEATS NIL)))(DIR FS)(MODAL ALL)(LEX nil)((BCAT PredP)(FEATS NIL))))(SEM (LAM p (LAM x (LAM y ((die_ ((euphemistic p) x)) y)))))
)
(
(KEY 17365)(PARAM 1.0)(PHON pick up)
(MORPH pv)(SYN (((BCAT iv)(FEATS NIL))(DIR FS)(MODAL ALL)(LEX nil)((BCAT np)(FEATS NIL))))(SEM (LAM x (LAM y ((pick_culminate x) y))))
)
(
(KEY 305388)(PARAM 1.0)(PHON pick)
(MORPH pv2)(SYN ((((BCAT iv)(FEATS NIL))(DIR FS)(MODAL ALL)(LEX nil)((BCAT (up))(BCONST T)(FEATS NIL)))(DIR FS)(MODAL ALL)(LEX nil)((BCAT np)(FEATS NIL))))(SEM (LAM x (LAM y (LAM z (((hold (culminate y)) x) z)))))
)
(
(KEY 111952)(PARAM 1.0)(PHON run a mile)
(MORPH past)(SYN ((BCAT iv)(FEATS NIL)))(SEM (LAM x (run x)))
)
(
(KEY 312364)(PARAM 1.0)(PHON km)
(MORPH past)(SYN (((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)(LEX nil)((BCAT np)(FEATS NIL))))(SEM (LAM x ((past run) x)))
)
(
(KEY 844236)(PARAM 1.0)(PHON buy)
(MORPH past)(SYN (((BCAT iv)(FEATS NIL))(DIR FS)(MODAL ALL)(LEX nil)((BCAT np)(FEATS NIL))))(SEM (LAM x (LAM y ((buy x) y))))
)
(
(KEY 47114)(PARAM 1.0)(PHON bought something)
(MORPH past)(SYN ((((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)(LEX nil)((BCAT np)(FEATS NIL)))(DIR FS)(MODAL ALL)(LEX nil)((BCAT np)(FEATS NIL))))(SEM (LAM x (LAM y (((past buy) x) y))))
)
;;
;;;;;;;;;; end of bench.py-generated monadic Lisp grammar
)
