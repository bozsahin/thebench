(
;;;;;;;;;; bench.py-generated monadic Lisp grammar
;;;;;;;;;; from hw.g September 24, 2022, 14:58:00
;;
;; a rules
;;
(
(KEY 62855) (PARAM 1.0) (INDEX #subj) 
 ( 0 ‾arule)  ( 1 #subj)  ( 2  ( 0 ‾apair)  ( 1  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾basic)  ( 1 np)  ( 2 (FEATS ( ) ) ) ) )  ( 2 (SEM lt) ) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾range)  ( 1  ( 0 ‾basic)  ( 1 s)  ( 2 (FEATS ( ) ) ) )  ( 2  ( 0 ‾dom)  ( 1  ( 0 ‾dir)  ( 1 /)  ( 2 .) )  ( 2  ( 0 ‾range)  ( 1  ( 0 ‾basic)  ( 1 s)  ( 2 (FEATS ( ) ) ) )  ( 2  ( 0 ‾dom)  ( 1  ( 0 ‾dir)  ( 1 \)  ( 2 .) )  ( 2  ( 0 ‾basic)  ( 1 np)  ( 2 (FEATS ( ) ) ) ) ) ) ) ) )  ( 2 (SEM {0: '‾lam', 1: 'lt', 2: {0: '‾lam', 1: 'p', 2: {0: '‾app', 1: 'p', 2: 'lt'}}}) ) ) ) 
)
(
(KEY 542638) (PARAM 1.0) (INDEX #lewis-rule) 
 ( 0 ‾arule)  ( 1 #lewis-rule)  ( 2  ( 0 ‾apair)  ( 1  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾range)  ( 1  ( 0 ‾basic)  ( 1 np)  ( 2 (FEATS ( ) ) ) )  ( 2  ( 0 ‾dom)  ( 1  ( 0 ‾dir)  ( 1 /)  ( 2 .) )  ( 2  ( 0 ‾basic)  ( 1 np)  ( 2 (FEATS ( ) ) ) ) ) ) )  ( 2 (SEM lt) ) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾basic)  ( 1 np)  ( 2 (FEATS ( ) ) ) ) )  ( 2 (SEM {0: '‾lam', 1: 'lt', 2: {0: '‾app', 1: 'lt', 2: 'nompred'}}) ) ) ) 
)
;;
;; elements
;;
(
(KEY 25964) (PARAM 1.0) (PHON it) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 it)  ( 2 n) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾basic)  ( 1 xp)  ( 2 (FEATS ( (lex no) (per s3) ) ) ) ) )  ( 2 (SEM it) ) ) 
)
(
(KEY 522252) (PARAM 1.0) (PHON john) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 john)  ( 2 n) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾basic)  ( 1 np)  ( 2 (FEATS ( (per 3s) (lex yes) ) ) ) ) )  ( 2 (SEM john) ) ) 
)
(
(KEY 13829) (PARAM 1.0) (PHON mary) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 mary)  ( 2 n) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾basic)  ( 1 np)  ( 2 (FEATS ( ) ) ) ) )  ( 2 (SEM mary) ) ) 
)
(
(KEY 366765) (PARAM 1.0) (PHON and) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 and)  ( 2 c) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾range)  ( 1  ( 0 ‾basic)  ( 1 @x)  ( 2 special) )  ( 2  ( 0 ‾dom)  ( 1  ( 0 ‾dir)  ( 1 /)  ( 2 .) )  ( 2  ( 0 ‾range)  ( 1  ( 0 ‾basic)  ( 1 @x)  ( 2 special) )  ( 2  ( 0 ‾dom)  ( 1  ( 0 ‾dir)  ( 1 \)  ( 2 .) )  ( 2  ( 0 ‾basic)  ( 1 @x)  ( 2 special) ) ) ) ) ) )  ( 2 (SEM {0: '‾lam', 1: 'p', 2: {0: '‾lam', 1: 'q', 2: {0: '‾lam', 1: 'x', 2: {0: '‾app', 1: {0: '‾app', 1: 'and', 2: {0: '‾app', 1: 'p', 2: 'x'}}, 2: {0: '‾app', 1: 'q', 2: 'x'}}}}}) ) ) 
)
(
(KEY 379521) (PARAM 1.0) (PHON study) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 study)  ( 2 inf) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾basic)  ( 1 iv)  ( 2 (FEATS ( ) ) ) ) )  ( 2 (SEM {0: '‾lam', 1: 'x', 2: {0: '‾app', 1: 'study', 2: 'x'}}) ) ) 
)
(
(KEY 272543) (PARAM 1.0) (PHON persuaded) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 persuaded)  ( 2 v) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1  ( 0 ‾basic)  ( 1 s)  ( 2 (FEATS ( ) ) ) )  ( 2  ( 0 ‾dom)  ( 1  ( 0 ‾dir)  ( 1 \)  ( 2 .) )  ( 2  ( 0 ‾basic)  ( 1 np)  ( 2 (FEATS ( ) ) ) ) ) )  ( 2  ( 0 ‾dom)  ( 1  ( 0 ‾dir)  ( 1 /)  ( 2 .) )  ( 2  ( 0 ‾basic)  ( 1 vp)  ( 2 (FEATS ( ) ) ) ) ) )  ( 2  ( 0 ‾dom)  ( 1  ( 0 ‾dir)  ( 1 /)  ( 2 .) )  ( 2  ( 0 ‾basic)  ( 1 np)  ( 2 (FEATS ( ) ) ) ) ) ) )  ( 2 (SEM {0: '‾lam', 1: 'x', 2: {0: '‾lam', 1: 'p', 2: {0: '‾lam', 1: 'y', 2: {0: '‾app', 1: {0: '‾app', 1: {0: '‾app', 1: 'persuade', 2: {0: '‾app', 1: 'p', 2: 'x'}}, 2: 'x'}, 2: 'y'}}}}) ) ) 
)
(
(KEY 270389) (PARAM 1.0) (PHON promised) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 promised)  ( 2 v) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1  ( 0 ‾basic)  ( 1 s)  ( 2 (FEATS ( ) ) ) )  ( 2  ( 0 ‾dom)  ( 1  ( 0 ‾dir)  ( 1 \)  ( 2 .) )  ( 2  ( 0 ‾basic)  ( 1 np)  ( 2 (FEATS ( ) ) ) ) ) )  ( 2  ( 0 ‾dom)  ( 1  ( 0 ‾dir)  ( 1 /)  ( 2 .) )  ( 2  ( 0 ‾basic)  ( 1 vp)  ( 2 (FEATS ( ) ) ) ) ) )  ( 2  ( 0 ‾dom)  ( 1  ( 0 ‾dir)  ( 1 /)  ( 2 .) )  ( 2  ( 0 ‾basic)  ( 1 np)  ( 2 (FEATS ( ) ) ) ) ) ) )  ( 2 (SEM {0: '‾lam', 1: 'x', 2: {0: '‾lam', 1: 'p', 2: {0: '‾lam', 1: 'y', 2: {0: '‾app', 1: {0: '‾app', 1: {0: '‾app', 1: 'promise', 2: {0: '‾app', 1: 'p', 2: 'y'}}, 2: 'x'}, 2: 'y'}}}}) ) ) 
)
(
(KEY 836409) (PARAM 1.0) (PHON wanted) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 wanted)  ( 2 v) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1  ( 0 ‾basic)  ( 1 s)  ( 2 (FEATS ( ) ) ) )  ( 2  ( 0 ‾dom)  ( 1  ( 0 ‾dir)  ( 1 \)  ( 2 .) )  ( 2  ( 0 ‾basic)  ( 1 np)  ( 2 (FEATS ( ) ) ) ) ) )  ( 2  ( 0 ‾dom)  ( 1  ( 0 ‾dir)  ( 1 /)  ( 2 .) )  ( 2  ( 0 ‾basic)  ( 1 vp)  ( 2 (FEATS ( ) ) ) ) ) )  ( 2  ( 0 ‾dom)  ( 1  ( 0 ‾dir)  ( 1 /)  ( 2 .) )  ( 2  ( 0 ‾basic)  ( 1 np)  ( 2 (FEATS ( ) ) ) ) ) ) )  ( 2 (SEM {0: '‾lam', 1: 'x', 2: {0: '‾lam', 1: 'p', 2: {0: '‾lam', 1: 'y', 2: {0: '‾app', 1: {0: '‾app', 1: 'want', 2: {0: '‾app', 1: 'p', 2: 'x'}}, 2: 'y'}}}}) ) ) 
)
(
(KEY 289580) (PARAM 1.0) (PHON expected) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 expected)  ( 2 v) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1  ( 0 ‾basic)  ( 1 s)  ( 2 (FEATS ( ) ) ) )  ( 2  ( 0 ‾dom)  ( 1  ( 0 ‾dir)  ( 1 \)  ( 2 .) )  ( 2  ( 0 ‾basic)  ( 1 np)  ( 2 (FEATS ( ) ) ) ) ) )  ( 2  ( 0 ‾dom)  ( 1  ( 0 ‾dir)  ( 1 /)  ( 2 .) )  ( 2  ( 0 ‾basic)  ( 1 vp)  ( 2 (FEATS ( ) ) ) ) ) )  ( 2  ( 0 ‾dom)  ( 1  ( 0 ‾dir)  ( 1 /)  ( 2 .) )  ( 2  ( 0 ‾basic)  ( 1 np)  ( 2 (FEATS ( ) ) ) ) ) ) )  ( 2 (SEM {0: '‾lam', 1: 'x', 2: {0: '‾lam', 1: 'p', 2: {0: '‾lam', 1: 'y', 2: {0: '‾app', 1: {0: '‾app', 1: 'expect', 2: {0: '‾app', 1: 'p', 2: 'x'}}, 2: 'y'}}}}) ) ) 
)
(
(KEY 631271) (PARAM 1.0) (PHON considered) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 considered)  ( 2 v) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1  ( 0 ‾basic)  ( 1 s)  ( 2 (FEATS ( ) ) ) )  ( 2  ( 0 ‾dom)  ( 1  ( 0 ‾dir)  ( 1 \)  ( 2 .) )  ( 2  ( 0 ‾basic)  ( 1 np)  ( 2 (FEATS ( ) ) ) ) ) )  ( 2  ( 0 ‾dom)  ( 1  ( 0 ‾dir)  ( 1 /)  ( 2 .) )  ( 2  ( 0 ‾basic)  ( 1 propp)  ( 2 (FEATS ( ) ) ) ) ) )  ( 2  ( 0 ‾dom)  ( 1  ( 0 ‾dir)  ( 1 /)  ( 2 .) )  ( 2  ( 0 ‾basic)  ( 1 np)  ( 2 (FEATS ( ) ) ) ) ) ) )  ( 2 (SEM {0: '‾lam', 1: 'x', 2: {0: '‾lam', 1: 'p', 2: {0: '‾lam', 1: 'y', 2: {0: '‾app', 1: {0: '‾app', 1: 'consider', 2: {0: '‾app', 1: 'p', 2: 'x'}}, 2: 'y'}}}}) ) ) 
)
(
(KEY 190415) (PARAM 1.0) (PHON seemed) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 seemed)  ( 2 v) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1  ( 0 ‾basic)  ( 1 s)  ( 2 (FEATS ( ) ) ) )  ( 2  ( 0 ‾dom)  ( 1  ( 0 ‾dir)  ( 1 \)  ( 2 .) )  ( 2  ( 0 ‾basic)  ( 1 xp)  ( 2 (FEATS ( ) ) ) ) ) )  ( 2  ( 0 ‾dom)  ( 1  ( 0 ‾dir)  ( 1 /)  ( 2 .) )  ( 2  ( 0 ‾basic)  ( 1 s)  ( 2 (FEATS ( ) ) ) ) ) ) )  ( 2 (SEM {0: '‾lam', 1: 'p', 2: {0: '‾lam', 1: 'x', 2: {0: '‾app', 1: 'seem', 2: 'p'}}}) ) ) 
)
(
(KEY 314408) (PARAM 1.0) (PHON seemed) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 seemed)  ( 2 v) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1  ( 0 ‾basic)  ( 1 s)  ( 2 (FEATS ( ) ) ) )  ( 2  ( 0 ‾dom)  ( 1  ( 0 ‾dir)  ( 1 \)  ( 2 .) )  ( 2  ( 0 ‾basic)  ( 1 np)  ( 2 (FEATS ( ) ) ) ) ) )  ( 2  ( 0 ‾dom)  ( 1  ( 0 ‾dir)  ( 1 /)  ( 2 .) )  ( 2  ( 0 ‾basic)  ( 1 vp)  ( 2 (FEATS ( ) ) ) ) ) ) )  ( 2 (SEM {0: '‾lam', 1: 'p', 2: {0: '‾lam', 1: 'x', 2: {0: '‾app', 1: 'seem', 2: {0: '‾app', 1: 'p', 2: 'x'}}}}) ) ) 
)
(
(KEY 287575) (PARAM 1.0) (PHON to) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 to)  ( 2 p) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾range)  ( 1  ( 0 ‾basic)  ( 1 vp)  ( 2 (FEATS ( ) ) ) )  ( 2  ( 0 ‾dom)  ( 1  ( 0 ‾dir)  ( 1 /)  ( 2 .) )  ( 2  ( 0 ‾basic)  ( 1 iv)  ( 2 (FEATS ( ) ) ) ) ) ) )  ( 2 (SEM {0: '‾lam', 1: 'p', 2: 'p'}) ) ) 
)
(
(KEY 583824) (PARAM 1.0) (PHON have) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 have)  ( 2 aux) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾range)  ( 1  ( 0 ‾basic)  ( 1 iv)  ( 2 (FEATS ( ) ) ) )  ( 2  ( 0 ‾dom)  ( 1  ( 0 ‾dir)  ( 1 /)  ( 2 .) )  ( 2  ( 0 ‾basic)  ( 1 iv)  ( 2 (FEATS ( ) ) ) ) ) ) )  ( 2 (SEM {0: '‾lam', 1: 'p', 2: 'p'}) ) ) 
)
(
(KEY 890325) (PARAM 1.0) (PHON bought) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 bought)  ( 2 v) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾range)  ( 1  ( 0 ‾basic)  ( 1 iv)  ( 2 (FEATS ( ) ) ) )  ( 2  ( 0 ‾dom)  ( 1  ( 0 ‾dir)  ( 1 /)  ( 2 .) )  ( 2  ( 0 ‾basic)  ( 1 np)  ( 2 (FEATS ( ) ) ) ) ) ) )  ( 2 (SEM {0: '‾lam', 1: 'x', 2: {0: '‾lam', 1: 'y', 2: {0: '‾app', 1: {0: '‾app', 1: 'buy', 2: 'x'}, 2: 'y'}}}) ) ) 
)
(
(KEY 316211) (PARAM 1.0) (PHON the) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 the)  ( 2 det) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾range)  ( 1  ( 0 ‾basic)  ( 1 np)  ( 2 (FEATS ( ) ) ) )  ( 2  ( 0 ‾dom)  ( 1  ( 0 ‾dir)  ( 1 /)  ( 2 *) )  ( 2  ( 0 ‾basic)  ( 1 n)  ( 2 (FEATS ( ) ) ) ) ) ) )  ( 2 (SEM def) ) ) 
)
(
(KEY 149367) (PARAM 1.0) (PHON car) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 car)  ( 2 n) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾basic)  ( 1 n)  ( 2 (FEATS ( ) ) ) ) )  ( 2 (SEM car) ) ) 
)
(
(KEY 631524) (PARAM 1.0) (PHON handsome) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 handsome)  ( 2 p) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾basic)  ( 1 propp)  ( 2 (FEATS ( ) ) ) ) )  ( 2 (SEM {0: '‾lam', 1: 'x', 2: {0: '‾app', 1: 'handsome', 2: 'x'}}) ) ) 
)
(
(KEY 84786) (PARAM 1.0) (PHON kicked the bucked) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 kicked the bucked)  ( 2 idio) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾range)  ( 1  ( 0 ‾basic)  ( 1 s)  ( 2 (FEATS ( ) ) ) )  ( 2  ( 0 ‾dom)  ( 1  ( 0 ‾dir)  ( 1 \)  ( 2 .) )  ( 2  ( 0 ‾basic)  ( 1 np)  ( 2 (FEATS ( ) ) ) ) ) ) )  ( 2 (SEM {0: '‾lam', 1: 'x', 2: {0: '‾app', 1: 'die_euphemistic', 2: 'x'}}) ) ) 
)
(
(KEY 320127) (PARAM 1.0) (PHON kicked) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 kicked)  ( 2 v) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1  ( 0 ‾basic)  ( 1 s)  ( 2 (FEATS ( ) ) ) )  ( 2  ( 0 ‾dom)  ( 1  ( 0 ‾dir)  ( 1 \)  ( 2 .) )  ( 2  ( 0 ‾basic)  ( 1 np)  ( 2 (FEATS ( ) ) ) ) ) )  ( 2  ( 0 ‾dom)  ( 1  ( 0 ‾dir)  ( 1 /)  ( 2 .) )  ( 2  ( 0 ‾basic)  ( 1 'bucket')  ( 2 quoted) ) ) )  ( 2  ( 0 ‾dom)  ( 1  ( 0 ‾dir)  ( 1 /)  ( 2 .) )  ( 2  ( 0 ‾basic)  ( 1 PredP)  ( 2 (FEATS ( ) ) ) ) ) ) )  ( 2 (SEM {0: '‾lam', 1: 'p', 2: {0: '‾lam', 1: 'x', 2: {0: '‾lam', 1: 'y', 2: {0: '‾app', 1: {0: '‾app', 1: 'die_', 2: {0: '‾app', 1: {0: '‾app', 1: 'euphemistic', 2: 'p'}, 2: 'x'}}, 2: 'y'}}}}) ) ) 
)
(
(KEY 526140) (PARAM 1.0) (PHON pick up) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 pick up)  ( 2 pv) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾range)  ( 1  ( 0 ‾basic)  ( 1 iv)  ( 2 (FEATS ( ) ) ) )  ( 2  ( 0 ‾dom)  ( 1  ( 0 ‾dir)  ( 1 /)  ( 2 .) )  ( 2  ( 0 ‾basic)  ( 1 np)  ( 2 (FEATS ( ) ) ) ) ) ) )  ( 2 (SEM {0: '‾lam', 1: 'x', 2: {0: '‾lam', 1: 'y', 2: {0: '‾app', 1: {0: '‾app', 1: 'pick_culminate', 2: 'x'}, 2: 'y'}}}) ) ) 
)
(
(KEY 425402) (PARAM 1.0) (PHON pick) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 pick)  ( 2 pv2) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1  ( 0 ‾basic)  ( 1 iv)  ( 2 (FEATS ( ) ) ) )  ( 2  ( 0 ‾dom)  ( 1  ( 0 ‾dir)  ( 1 /)  ( 2 .) )  ( 2  ( 0 ‾basic)  ( 1 'up')  ( 2 quoted) ) ) )  ( 2  ( 0 ‾dom)  ( 1  ( 0 ‾dir)  ( 1 /)  ( 2 .) )  ( 2  ( 0 ‾basic)  ( 1 np)  ( 2 (FEATS ( ) ) ) ) ) ) )  ( 2 (SEM {0: '‾lam', 1: 'x', 2: {0: '‾lam', 1: 'y', 2: {0: '‾lam', 1: 'z', 2: {0: '‾app', 1: {0: '‾app', 1: {0: '‾app', 1: 'hold', 2: {0: '‾app', 1: 'culminate', 2: 'y'}}, 2: 'x'}, 2: 'z'}}}}) ) ) 
)
(
(KEY 702453) (PARAM 1.0) (PHON run a mile) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 run a mile)  ( 2 #past) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾basic)  ( 1 iv)  ( 2 (FEATS ( ) ) ) ) )  ( 2 (SEM {0: '‾lam', 1: 'x', 2: {0: '‾app', 1: 'run', 2: 'x'}}) ) ) 
)
(
(KEY 472396) (PARAM 1.0) (PHON km) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 km)  ( 2 #past) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾range)  ( 1  ( 0 ‾basic)  ( 1 s)  ( 2 (FEATS ( ) ) ) )  ( 2  ( 0 ‾dom)  ( 1  ( 0 ‾dir)  ( 1 \)  ( 2 .) )  ( 2  ( 0 ‾basic)  ( 1 np)  ( 2 (FEATS ( ) ) ) ) ) ) )  ( 2 (SEM {0: '‾lam', 1: 'x', 2: {0: '‾app', 1: {0: '‾app', 1: 'past', 2: 'run'}, 2: 'x'}}) ) ) 
)
(
(KEY 466199) (PARAM 1.0) (PHON buy) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 buy)  ( 2 #past) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾range)  ( 1  ( 0 ‾basic)  ( 1 iv)  ( 2 (FEATS ( ) ) ) )  ( 2  ( 0 ‾dom)  ( 1  ( 0 ‾dir)  ( 1 /)  ( 2 .) )  ( 2  ( 0 ‾basic)  ( 1 np)  ( 2 (FEATS ( ) ) ) ) ) ) )  ( 2 (SEM {0: '‾lam', 1: 'x', 2: {0: '‾lam', 1: 'y', 2: {0: '‾app', 1: {0: '‾app', 1: 'buy', 2: 'x'}, 2: 'y'}}}) ) ) 
)
(
(KEY 285821) (PARAM 1.0) (PHON bought something) 
 ( 0 ‾el)  ( 1  ( 0 ‾form)  ( 1 bought something)  ( 2 #past) )  ( 2  ( 0 ‾cat)  ( 1 (SYN  ( 0 ‾range)  ( 1  ( 0 ‾range)  ( 1  ( 0 ‾basic)  ( 1 s)  ( 2 (FEATS ( ) ) ) )  ( 2  ( 0 ‾dom)  ( 1  ( 0 ‾dir)  ( 1 \)  ( 2 .) )  ( 2  ( 0 ‾basic)  ( 1 np)  ( 2 (FEATS ( ) ) ) ) ) )  ( 2  ( 0 ‾dom)  ( 1  ( 0 ‾dir)  ( 1 /)  ( 2 .) )  ( 2  ( 0 ‾basic)  ( 1 np)  ( 2 (FEATS ( ) ) ) ) ) ) )  ( 2 (SEM {0: '‾lam', 1: 'x', 2: {0: '‾lam', 1: 'y', 2: {0: '‾app', 1: {0: '‾app', 1: {0: '‾app', 1: 'past', 2: 'buy'}, 2: 'x'}, 2: 'y'}}}) ) ) 
)
;;
;;;;;;;;;; end of bench.py-generated monadic Lisp grammar
)
