(
;;;;;;;;;; bench.py-generated monadic Lisp grammar
;;;;;;;;;; from hw.g October 01, 2022, 14:28:22
;;
;; a rules
;;
(
(KEY 54255)(PARAM 1.0)(INDEX #subj)
(INSYN ((BCAT np) (FEATS NIL)))(OUTSYN ( ((BCAT s) (FEATS NIL)))(DIR FS)(MODAL ALL)(LEX nil)( ((BCAT s) (FEATS NIL)))(DIR BS)(MODAL ALL)(LEX nil)((BCAT np) (FEATS NIL)))(INSEM lt)(OUTSEM (LAM lt (LAM p (p lt))))
)
(
(KEY 72540)(PARAM 1.0)(INDEX #lewis-rule)
(INSYN ( ((BCAT np) (FEATS NIL)))(DIR FS)(MODAL ALL)(LEX nil)((BCAT np) (FEATS NIL)))(OUTSYN ((BCAT np) (FEATS NIL)))(INSEM lt)(OUTSEM (LAM lt (lt nompred)))
)
;;
;; elements
;;
(
(KEY 702931)(PARAM 1.0)(PHON it)
(MORPH n)(SYN ((BCAT xp) (FEATS ( (lex no)(per s3)))))(SEM it)
)
(
(KEY 542108)(PARAM 1.0)(PHON john)
(MORPH n)(SYN ((BCAT np) (FEATS ( (per 3s)(lex yes)))))(SEM john)
)
(
(KEY 838494)(PARAM 1.0)(PHON mary)
(MORPH n)(SYN ((BCAT np) (FEATS NIL)))(SEM mary)
)
(
(KEY 773822)(PARAM 1.0)(PHON and)
(MORPH c)(SYN ( ((BCAT @x) special))(DIR FS)(MODAL ALL)(LEX nil)( ((BCAT @x) special))(DIR BS)(MODAL ALL)(LEX nil)((BCAT @x) special))(SEM (LAM p (LAM q (LAM x ((and (p x)) (q x))))))
)
(
(KEY 16205)(PARAM 1.0)(PHON study)
(MORPH inf)(SYN ((BCAT iv) (FEATS NIL)))(SEM (LAM x (study x)))
)
(
(KEY 408738)(PARAM 1.0)(PHON persuaded)
(MORPH v)(SYN ( ( ( ((BCAT s) (FEATS NIL)))(DIR BS)(MODAL ALL)(LEX nil)((BCAT np) (FEATS NIL)))(DIR FS)(MODAL ALL)(LEX nil)((BCAT vp) (FEATS NIL)))(DIR FS)(MODAL CROSS)(LEX nil)((BCAT np) (FEATS NIL)))(SEM (LAM x (LAM p (LAM y (((persuade (p x)) x) y)))))
)
(
(KEY 198547)(PARAM 1.0)(PHON promised)
(MORPH v)(SYN ( ( ( ((BCAT s) (FEATS NIL)))(DIR BS)(MODAL ALL)(LEX t)((BCAT np) (FEATS NIL)))(DIR FS)(MODAL ALL)(LEX nil)((BCAT vp) (FEATS NIL)))(DIR FS)(MODAL ALL)(LEX t)((BCAT np) (FEATS NIL)))(SEM (LAM x (LAM p (LAM y (((promise (p y)) x) y)))))
)
(
(KEY 14816)(PARAM 1.0)(PHON wanted)
(MORPH v)(SYN ( ( ( ((BCAT s) (FEATS NIL)))(DIR BS)(MODAL STAR)(LEX nil)((BCAT np) (FEATS NIL)))(DIR FS)(MODAL HARMONIC)(LEX nil)((BCAT vp) (FEATS NIL)))(DIR FS)(MODAL ALL)(LEX nil)((BCAT np) (FEATS NIL)))(SEM (LAM x (LAM p (LAM y ((want (p x)) y)))))
)
(
(KEY 1412)(PARAM 1.0)(PHON expected)
(MORPH v)(SYN ( ( ( ((BCAT s) (FEATS NIL)))(DIR BS)(MODAL ALL)(LEX nil)((BCAT np) (FEATS NIL)))(DIR FS)(MODAL ALL)(LEX nil)((BCAT vp) (FEATS NIL)))(DIR FS)(MODAL ALL)(LEX nil)((BCAT np) (FEATS NIL)))(SEM (LAM x (LAM p (LAM y ((expect (p x)) y)))))
)
(
(KEY 93586)(PARAM 1.0)(PHON considered)
(MORPH v)(SYN ( ( ( ((BCAT s) (FEATS NIL)))(DIR BS)(MODAL ALL)(LEX nil)((BCAT np) (FEATS NIL)))(DIR FS)(MODAL ALL)(LEX nil)((BCAT propp) (FEATS NIL)))(DIR FS)(MODAL ALL)(LEX nil)((BCAT np) (FEATS NIL)))(SEM (LAM x (LAM p (LAM y ((consider (p x)) y)))))
)
(
(KEY 1887)(PARAM 1.0)(PHON seemed)
(MORPH v)(SYN ( ( ((BCAT s) (FEATS NIL)))(DIR BS)(MODAL ALL)(LEX nil)((BCAT xp) (FEATS NIL)))(DIR FS)(MODAL ALL)(LEX nil)((BCAT s) (FEATS NIL)))(SEM (LAM p (LAM x (seem p))))
)
(
(KEY 36148)(PARAM 1.0)(PHON seemed)
(MORPH v)(SYN ( ( ((BCAT s) (FEATS NIL)))(DIR BS)(MODAL ALL)(LEX nil)((BCAT np) (FEATS NIL)))(DIR FS)(MODAL ALL)(LEX nil)((BCAT vp) (FEATS NIL)))(SEM (LAM p (LAM x (seem (p x)))))
)
(
(KEY 156226)(PARAM 1.0)(PHON to)
(MORPH p)(SYN ( ((BCAT vp) (FEATS NIL)))(DIR FS)(MODAL ALL)(LEX nil)((BCAT iv) (FEATS NIL)))(SEM (LAM p p))
)
(
(KEY 238283)(PARAM 1.0)(PHON have)
(MORPH aux)(SYN ( ((BCAT iv) (FEATS NIL)))(DIR FS)(MODAL ALL)(LEX nil)((BCAT iv) (FEATS NIL)))(SEM (LAM p p))
)
(
(KEY 907788)(PARAM 1.0)(PHON bought)
(MORPH v)(SYN ( ((BCAT iv) (FEATS NIL)))(DIR FS)(MODAL ALL)(LEX nil)((BCAT np) (FEATS NIL)))(SEM (LAM x (LAM y ((buy x) y))))
)
(
(KEY 760324)(PARAM 1.0)(PHON the)
(MORPH det)(SYN ( ((BCAT np) (FEATS NIL)))(DIR FS)(MODAL STAR)(LEX nil)((BCAT n) (FEATS NIL)))(SEM def)
)
(
(KEY 718784)(PARAM 1.0)(PHON car)
(MORPH n)(SYN ((BCAT n) (FEATS NIL)))(SEM car)
)
(
(KEY 334341)(PARAM 1.0)(PHON handsome)
(MORPH p)(SYN ((BCAT propp) (FEATS NIL)))(SEM (LAM x (handsome x)))
)
(
(KEY 538691)(PARAM 1.0)(PHON kicked the bucked)
(MORPH idio)(SYN ( ((BCAT s) (FEATS NIL)))(DIR BS)(MODAL ALL)(LEX nil)((BCAT np) (FEATS NIL)))(SEM (LAM x (die_euphemistic x)))
)
(
(KEY 280325)(PARAM 1.0)(PHON kicked)
(MORPH v)(SYN ( ( ( ((BCAT s) (FEATS NIL)))(DIR BS)(MODAL ALL)(LEX nil)((BCAT np) (FEATS NIL)))(DIR FS)(MODAL ALL)(LEX nil)((BCAT 'bucket') quoted))(DIR FS)(MODAL ALL)(LEX nil)((BCAT PredP) (FEATS NIL)))(SEM (LAM p (LAM x (LAM y ((die_ ((euphemistic p) x)) y)))))
)
(
(KEY 784162)(PARAM 1.0)(PHON pick up)
(MORPH pv)(SYN ( ((BCAT iv) (FEATS NIL)))(DIR FS)(MODAL ALL)(LEX nil)((BCAT np) (FEATS NIL)))(SEM (LAM x (LAM y ((pick_culminate x) y))))
)
(
(KEY 169584)(PARAM 1.0)(PHON pick)
(MORPH pv2)(SYN ( ( ((BCAT iv) (FEATS NIL)))(DIR FS)(MODAL ALL)(LEX nil)((BCAT 'up') quoted))(DIR FS)(MODAL ALL)(LEX nil)((BCAT np) (FEATS NIL)))(SEM (LAM x (LAM y (LAM z (((hold (culminate y)) x) z)))))
)
(
(KEY 273137)(PARAM 1.0)(PHON run a mile)
(MORPH #past)(SYN ((BCAT iv) (FEATS NIL)))(SEM (LAM x (run x)))
)
(
(KEY 706829)(PARAM 1.0)(PHON km)
(MORPH #past)(SYN ( ((BCAT s) (FEATS NIL)))(DIR BS)(MODAL ALL)(LEX nil)((BCAT np) (FEATS NIL)))(SEM (LAM x ((past run) x)))
)
(
(KEY 699336)(PARAM 1.0)(PHON buy)
(MORPH #past)(SYN ( ((BCAT iv) (FEATS NIL)))(DIR FS)(MODAL ALL)(LEX nil)((BCAT np) (FEATS NIL)))(SEM (LAM x (LAM y ((buy x) y))))
)
(
(KEY 887762)(PARAM 1.0)(PHON bought something)
(MORPH #past)(SYN ( ( ((BCAT s) (FEATS NIL)))(DIR BS)(MODAL ALL)(LEX nil)((BCAT np) (FEATS NIL)))(DIR FS)(MODAL ALL)(LEX nil)((BCAT np) (FEATS NIL)))(SEM (LAM x (LAM y (((past buy) x) y))))
)
;;
;;;;;;;;;; end of bench.py-generated monadic Lisp grammar
)
