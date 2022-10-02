(
;;;;;;;;;; bench.py-generated monadic Lisp grammar
;;;;;;;;;; from acid-test.g October 02, 2022, 00:00:29
;;
;; a rules
;;
(
(KEY 556962)(PARAM 1.0)(INDEX #subj)
(INSYN (BCAT np)(FEATS NIL))(OUTSYN ((BCAT s)(FEATS NIL))(DIR FS)(MODAL ALL)(LEX nil)(((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)(LEX nil)((BCAT np)(FEATS NIL))))(INSEM lt)(OUTSEM (LAM lt (LAM p (p lt))))
)
(
(KEY 150948)(PARAM 1.0)(INDEX #lewis-rule)
(INSYN ((BCAT np)(FEATS NIL))(DIR FS)(MODAL ALL)(LEX nil)((BCAT np)(FEATS NIL)))(OUTSYN (BCAT np)(FEATS NIL))(INSEM lt)(OUTSEM (LAM lt (lt nompred)))
)
;;
;; elements
;;
(
(KEY 689614)(PARAM 1.0)(PHON it is more)
(MORPH n)(SYN ((BCAT xp)(FEATS (typ x))))(SEM it)
)
(
(KEY 978335)(PARAM 1.0)(PHON john)
(MORPH n)(SYN ((BCAT np)(FEATS (agr ?x)(num sg))))(SEM john)
)
(
(KEY 250244)(PARAM 1.0)(PHON mary)
(MORPH n)(SYN ((BCAT np)(FEATS NIL)))(SEM mary)
)
(
(KEY 17)(PARAM 1.27)(PHON study)
(MORPH inf)(SYN ((BCAT iv)(FEATS NIL)))(SEM (LAM x (study x)))
)
(
(KEY 151646)(PARAM 1.0)(PHON persuaded)
(MORPH v)(SYN (((((BCAT s)(FEATS (type decl)))(DIR BS)(MODAL ALL)(LEX nil)((BCAT np)(FEATS (det none)(h ?x))))(DIR FS)(MODAL ALL)(LEX nil)((BCAT vp)(FEATS (h ?x))))(DIR FS)(MODAL ALL)(LEX nil)((BCAT np)(FEATS NIL))))(SEM (LAM x (LAM p (LAM y (((persuade (p x)) x) y)))))
)
(
(KEY 944484)(PARAM 1.0)(PHON promised)
(MORPH v)(SYN (((((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)(LEX nil)((BCAT np)(FEATS NIL)))(DIR FS)(MODAL ALL)(LEX nil)((BCAT vp)(FEATS NIL)))(DIR FS)(MODAL ALL)(LEX nil)((BCAT np)(FEATS NIL))))(SEM (LAM x (LAM p (LAM y (((promise (p y)) x) y)))))
)
(
(KEY 714110)(PARAM 1.0)(PHON wanted)
(MORPH v)(SYN (((((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)(LEX nil)((BCAT np)(FEATS NIL)))(DIR FS)(MODAL ALL)(LEX nil)((BCAT vp)(FEATS NIL)))(DIR FS)(MODAL ALL)(LEX nil)((BCAT np)(FEATS NIL))))(SEM (LAM x (LAM p (LAM y ((want (p x)) y)))))
)
(
(KEY 21)(PARAM 2.8)(PHON expected)
(MORPH v)(SYN (((((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)(LEX nil)((BCAT np)(FEATS NIL)))(DIR FS)(MODAL HARMONIC)(LEX nil)((BCAT vp)(FEATS NIL)))(DIR FS)(MODAL CROSS)(LEX nil)((BCAT np)(FEATS NIL))))(SEM (LAM x (LAM p (LAM y ((expect (p x)) y)))))
)
(
(KEY 159497)(PARAM 1.0)(PHON considered)
(MORPH v)(SYN (((((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)(LEX nil)((BCAT np)(FEATS NIL)))(DIR FS)(MODAL ALL)(LEX t)((BCAT propp)(FEATS NIL)))(DIR FS)(MODAL ALL)(LEX nil)((BCAT np)(FEATS NIL))))(SEM (LAM x (LAM p (LAM y ((consider (p x)) y)))))
)
(
(KEY 721404)(PARAM 1.0)(PHON seemed)
(MORPH v)(SYN ((((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)(LEX nil)((BCAT 'it is less')quoted))(DIR FS)(MODAL ALL)(LEX nil)((BCAT s)(FEATS NIL))))(SEM (LAM p (LAM x (seem p))))
)
(
(KEY 584304)(PARAM 1.0)(PHON seemed)
(MORPH v)(SYN ((((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)(LEX nil)((BCAT "it is less")quoted))(DIR FS)(MODAL ALL)(LEX nil)((BCAT s)(FEATS NIL))))(SEM (LAM p (LAM x (seem p))))
)
(
(KEY 621139)(PARAM 1.0)(PHON seemed)
(MORPH v)(SYN ((((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)(LEX t)((BCAT np)(FEATS NIL)))(DIR FS)(MODAL STAR)(LEX nil)((BCAT vp)(FEATS NIL))))(SEM (LAM p (LAM x (seem (p x)))))
)
(
(KEY 822697)(PARAM 1.0)(PHON and)
(MORPH c)(SYN ((((BCAT @x)special)(DIR BS)(MODAL ALL)(LEX nil)((BCAT @x)special))(DIR FS)(MODAL ALL)(LEX nil)((BCAT @x)special)))(SEM (LAM p (LAM q (LAM x ((and (p x)) (q x))))))
)
(
(KEY 631304)(PARAM 1.0)(PHON boldly)
(MORPH j)(SYN ((((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)(LEX nil)((BCAT np)(FEATS NIL)))(DIR FS)(MODAL ALL)(LEX nil)(((BCAT s)(FEATS (o kirk)(s ?y)))(DIR BS)(MODAL ALL)(LEX nil)((BCAT np)(FEATS NIL)))))(SEM (LAM p (LAM x (boldly (p x)))))
)
(
(KEY 386866)(PARAM 1.0)(PHON to)
(MORPH p)(SYN (((BCAT vp)(FEATS NIL))(DIR FS)(MODAL ALL)(LEX nil)((BCAT iv)(FEATS NIL))))(SEM (LAM p p))
)
(
(KEY 443117)(PARAM 1.0)(PHON have)
(MORPH aux)(SYN (((BCAT iv)(FEATS NIL))(DIR FS)(MODAL ALL)(LEX nil)((BCAT iv)(FEATS NIL))))(SEM (LAM p p))
)
(
(KEY 669216)(PARAM 1.0)(PHON bought)
(MORPH v)(SYN (((BCAT iv)(FEATS NIL))(DIR FS)(MODAL ALL)(LEX nil)((BCAT np)(FEATS NIL))))(SEM (LAM x (LAM y ((buy x) y))))
)
(
(KEY 178606)(PARAM 1.0)(PHON the)
(MORPH det)(SYN (((BCAT np)(FEATS NIL))(DIR FS)(MODAL STAR)(LEX nil)((BCAT n)(FEATS NIL))))(SEM def)
)
(
(KEY 25343)(PARAM 1.0)(PHON car)
(MORPH n)(SYN ((BCAT n)(FEATS NIL)))(SEM car)
)
(
(KEY 925450)(PARAM 1.0)(PHON handsome)
(MORPH p)(SYN ((BCAT propp)(FEATS NIL)))(SEM (LAM x (handsome x)))
)
(
(KEY 562556)(PARAM 1.0)(PHON kicked the bucked)
(MORPH idio)(SYN (((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)(LEX nil)((BCAT np)(FEATS NIL))))(SEM (LAM x (die_euphemistic x)))
)
(
(KEY 787520)(PARAM 1.0)(PHON kicked)
(MORPH v)(SYN (((((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)(LEX nil)((BCAT np)(FEATS NIL)))(DIR FS)(MODAL ALL)(LEX nil)((BCAT 'bucket')quoted))(DIR FS)(MODAL ALL)(LEX nil)((BCAT PredP)(FEATS NIL))))(SEM (LAM p (LAM x (LAM y ((die_ ((euphemistic p) x)) y)))))
)
(
(KEY 436627)(PARAM 1.0)(PHON pick up)
(MORPH pv)(SYN (((BCAT iv)(FEATS NIL))(DIR FS)(MODAL ALL)(LEX nil)((BCAT np)(FEATS NIL))))(SEM (LAM x (LAM y ((pick_culminate x) y))))
)
(
(KEY 406478)(PARAM 1.0)(PHON pick)
(MORPH pv2)(SYN ((((BCAT iv)(FEATS NIL))(DIR FS)(MODAL ALL)(LEX nil)((BCAT 'up')quoted))(DIR FS)(MODAL ALL)(LEX nil)((BCAT np)(FEATS NIL))))(SEM (LAM x (LAM y (LAM z (((hold (culminate y)) x) z)))))
)
(
(KEY 346665)(PARAM 1.0)(PHON run)
(MORPH #past)(SYN ((BCAT iv)(FEATS NIL)))(SEM (LAM x (run x)))
)
(
(KEY 565131)(PARAM 1.0)(PHON ran)
(MORPH #past)(SYN (((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)(LEX nil)((BCAT np)(FEATS NIL))))(SEM (LAM x ((past run) x)))
)
(
(KEY 850873)(PARAM 1.0)(PHON buy)
(MORPH #past)(SYN (((BCAT iv)(FEATS NIL))(DIR FS)(MODAL ALL)(LEX nil)((BCAT np)(FEATS NIL))))(SEM (LAM x (LAM y ((buy x) y))))
)
(
(KEY 455803)(PARAM 1.0)(PHON bought)
(MORPH #past)(SYN ((((BCAT s)(FEATS NIL))(DIR BS)(MODAL ALL)(LEX nil)((BCAT np)(FEATS NIL)))(DIR FS)(MODAL ALL)(LEX nil)((BCAT np)(FEATS NIL))))(SEM (LAM x (LAM y (((past buy) x) y))))
)
;;
;;;;;;;;;; end of bench.py-generated monadic Lisp grammar
)
