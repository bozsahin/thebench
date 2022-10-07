(
;;;;;;;;;; bench.py-generated monadic Lisp grammar
;;;;;;;;;; from acid-test.g October 07, 2022, 10:25:20
;;
;; a rules
;;
(
(KEY 846510)(PARAM 1.0)(INDEX subj)
(INSYN ((BCAT np)(FEATS NIL)))(OUTSYN (((BCAT s)(FEATS NIL))(DIR FS)(MODAL ALL)(((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)((BCAT np)(FEATS NIL)))))(INSEM lt)(OUTSEM (LAM lt (LAM p (p lt))))
)
(
(KEY 132068)(PARAM 1.0)(INDEX lewis-rule)
(INSYN (((BCAT np)(FEATS NIL))(DIR FS)(MODAL ALL)((BCAT np)(FEATS NIL))))(OUTSYN ((BCAT np)(FEATS NIL)))(INSEM lt)(OUTSEM (LAM lt (lt nompred)))
)
;;
;; elements
;;
(
(KEY 28607)(PARAM 1.0)(PHON it is more)
(MORPH n)(SYN ((BCAT xp)(FEATS (typ x))))(SEM it)
)
(
(KEY 985698)(PARAM 1.0)(PHON john)
(MORPH n)(SYN ((BCAT np)(FEATS (agr ?x)(num sg))))(SEM john)
)
(
(KEY 179043)(PARAM 1.0)(PHON mary)
(MORPH n)(SYN ((BCAT np)(FEATS NIL)))(SEM mary)
)
(
(KEY 17)(PARAM 1.27)(PHON study)
(MORPH inf)(SYN ((BCAT iv)(FEATS NIL)))(SEM (LAM x (study x)))
)
(
(KEY 128261)(PARAM 1.0)(PHON persuaded)
(MORPH v)(SYN (((((BCAT s)(FEATS (type decl)))(DIR BS)(MODAL ALL)((BCAT np)(FEATS (det none)(h ?x))))(DIR FS)(MODAL ALL)((BCAT vp)(FEATS (h ?x))))(DIR FS)(MODAL ALL)((BCAT np)(FEATS NIL))))(SEM (LAM x (LAM p (LAM y (((persuade (p x)) x) y)))))
)
(
(KEY 196173)(PARAM 1.0)(PHON promised)
(MORPH v)(SYN (((((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)((BCAT np)(FEATS NIL)))(DIR FS)(MODAL ALL)((BCAT vp)(FEATS NIL)))(DIR FS)(MODAL ALL)((BCAT np)(FEATS NIL))))(SEM (LAM x (LAM p (LAM y (((promise (p y)) x) y)))))
)
(
(KEY 176247)(PARAM 1.0)(PHON wanted)
(MORPH v)(SYN (((((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)((BCAT np)(FEATS NIL)))(DIR FS)(MODAL ALL)((BCAT vp)(FEATS NIL)))(DIR FS)(MODAL ALL)((BCAT np)(FEATS NIL))))(SEM (LAM x (LAM p (LAM y ((want (p x)) y)))))
)
(
(KEY 21)(PARAM 2.8)(PHON expected)
(MORPH v)(SYN (((((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)((BCAT np)(FEATS NIL)))(DIR FS)(MODAL HARMONIC)((BCAT vp)(FEATS NIL)))(DIR FS)(MODAL CROSS)((BCAT np)(FEATS NIL))))(SEM (LAM x (LAM p (LAM y ((expect (p x)) y)))))
)
(
(KEY 108745)(PARAM 1.0)(PHON considered)
(MORPH v)(SYN (((((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)((BCAT np)(FEATS NIL)))(DIR FS)(MODAL ALL)(LEX t)((BCAT propp)(FEATS NIL)))(DIR FS)(MODAL ALL)((BCAT np)(FEATS NIL))))(SEM (LAM x (LAM p (LAM y ((consider (p x)) y)))))
)
(
(KEY 454414)(PARAM 1.0)(PHON seemed)
(MORPH v)(SYN ((((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)((BCAT (it is less))(BCONST T)(FEATS NIL)))(DIR FS)(MODAL ALL)((BCAT s)(FEATS NIL))))(SEM (LAM p (LAM x (seem p))))
)
(
(KEY 739458)(PARAM 1.0)(PHON seemed)
(MORPH v)(SYN ((((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)((BCAT (it is less))(BCONST T)(FEATS NIL)))(DIR FS)(MODAL ALL)((BCAT s)(FEATS NIL))))(SEM (LAM p (LAM x (seem p))))
)
(
(KEY 337000)(PARAM 1.0)(PHON seemed)
(MORPH v)(SYN ((((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)(LEX t)((BCAT np)(FEATS NIL)))(DIR FS)(MODAL STAR)((BCAT vp)(FEATS NIL))))(SEM (LAM p (LAM x (seem (p x)))))
)
(
(KEY 3230)(PARAM 1.0)(PHON and)
(MORPH c)(SYN ((((BCAT @x)special)(DIR BS)(MODAL ALL)((BCAT @x)special))(DIR FS)(MODAL ALL)((BCAT @x)special)))(SEM (LAM p (LAM q (LAM x ((and (p x)) (q x))))))
)
(
(KEY 663740)(PARAM 1.0)(PHON boldly)
(MORPH j)(SYN ((((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)((BCAT np)(FEATS NIL)))(DIR FS)(MODAL ALL)(((BCAT s)(FEATS (o kirk)(s ?y)))(DIR BS)(MODAL ALL)((BCAT np)(FEATS NIL)))))(SEM (LAM p (LAM x (boldly (p x)))))
)
(
(KEY 639149)(PARAM 1.0)(PHON to)
(MORPH p)(SYN (((BCAT vp)(FEATS NIL))(DIR FS)(MODAL ALL)((BCAT iv)(FEATS NIL))))(SEM (LAM p p))
)
(
(KEY 892629)(PARAM 1.0)(PHON have)
(MORPH aux)(SYN (((BCAT iv)(FEATS NIL))(DIR FS)(MODAL ALL)((BCAT iv)(FEATS NIL))))(SEM (LAM p p))
)
(
(KEY 998377)(PARAM 1.0)(PHON bought)
(MORPH v)(SYN (((BCAT iv)(FEATS NIL))(DIR FS)(MODAL ALL)((BCAT np)(FEATS NIL))))(SEM (LAM x (LAM y ((buy x) y))))
)
(
(KEY 459328)(PARAM 1.0)(PHON the)
(MORPH det)(SYN (((BCAT np)(FEATS NIL))(DIR FS)(MODAL STAR)((BCAT n)(FEATS NIL))))(SEM def)
)
(
(KEY 364027)(PARAM 1.0)(PHON car)
(MORPH n)(SYN ((BCAT n)(FEATS NIL)))(SEM car)
)
(
(KEY 959099)(PARAM 1.0)(PHON handsome)
(MORPH p)(SYN ((BCAT propp)(FEATS NIL)))(SEM (LAM x (handsome x)))
)
(
(KEY 939170)(PARAM 1.0)(PHON kicked the bucked)
(MORPH idio)(SYN (((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)((BCAT np)(FEATS NIL))))(SEM (LAM x (die_euphemistic x)))
)
(
(KEY 67247)(PARAM 1.0)(PHON kicked)
(MORPH v)(SYN (((((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)((BCAT np)(FEATS NIL)))(DIR FS)(MODAL ALL)((BCAT (bucket))(BCONST T)(FEATS NIL)))(DIR FS)(MODAL ALL)((BCAT PredP)(FEATS NIL))))(SEM (LAM p (LAM x (LAM y ((die_ ((euphemistic p) x)) y)))))
)
(
(KEY 44843)(PARAM 1.0)(PHON pick up)
(MORPH pv)(SYN (((BCAT iv)(FEATS NIL))(DIR FS)(MODAL ALL)((BCAT np)(FEATS NIL))))(SEM (LAM x (LAM y ((pick_culminate x) y))))
)
(
(KEY 191332)(PARAM 1.0)(PHON pick)
(MORPH pv2)(SYN ((((BCAT iv)(FEATS NIL))(DIR FS)(MODAL ALL)((BCAT (up))(BCONST T)(FEATS NIL)))(DIR FS)(MODAL ALL)((BCAT np)(FEATS NIL))))(SEM (LAM x (LAM y (LAM z (((hold (culminate y)) x) z)))))
)
(
(KEY 571199)(PARAM 1.0)(PHON run)
(MORPH past)(SYN ((BCAT iv)(FEATS NIL)))(SEM (LAM x (run x)))
)
(
(KEY 923982)(PARAM 1.0)(PHON ran)
(MORPH past)(SYN (((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)((BCAT np)(FEATS NIL))))(SEM (LAM x ((past run) x)))
)
(
(KEY 193409)(PARAM 1.0)(PHON buy)
(MORPH past)(SYN (((BCAT iv)(FEATS NIL))(DIR FS)(MODAL ALL)((BCAT np)(FEATS NIL))))(SEM (LAM x (LAM y ((buy x) y))))
)
(
(KEY 984265)(PARAM 1.0)(PHON bought)
(MORPH past)(SYN ((((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)((BCAT np)(FEATS NIL)))(DIR FS)(MODAL ALL)((BCAT np)(FEATS NIL))))(SEM (LAM x (LAM y (((past buy) x) y))))
)
;;
;;;;;;;;;; end of bench.py-generated monadic Lisp grammar
)
