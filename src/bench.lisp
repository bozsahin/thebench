;; to suppress style warnings --load before anything else
;; first form is SBCL-specific
;; -cem bozsahin

(setf *read-default-float-format* 'double-float) ; needed this in some trainings 
                                                 ; to avoid (exp) overflow

(declaim #+sbcl(sb-ext:muffle-conditions style-warning))
(setf *load-verbose* nil)
(setf *load-print* nil)
(defmacro silent-load (stuff)  ; let defs by Nikodemus Siivola (thanks)
  `(let* ((nada (make-broadcast-stream))
       (*standard-output* nada)
       (*error-output* nada))
     (load ,stuff)))

(defconstant day-names
           '("Monday" "Tuesday" "Wednesday"
	         "Thursday" "Friday" "Saturday"
	         "Sunday"))

(defun put_timestamp (s)
  (multiple-value-bind (sec minute hour day month year day-of-week dst-p tz)
    (get-decoded-time)
    (format s "~2,'0d:~2,'0d:~2,'0d of ~a, ~d.~2,'0d.~d (GMT~@d)"
	    	 hour
	    	 minute
	    	 sec
	    	 (nth day-of-week day-names)
	    	 day
	    	 month
	    	 year
	    	 (- tz))))

;;;; ==================================================
;;;  == Lisp code for studying Monadic Structures
;;;  == function names with underscores have become python interfaces
;;;  == Cem Bozsahin, 2022, Ankara, Datca, Sile
;;;  == Basically, projection is as it has been worked 
;;;  ==  by CCG, except no S, no semantic function application.
;;;  == Referentiality is from the book on Monadic Structures.
;;;  == We get a monad with composition only, and always headed
;;;  ==  by the ultimate element.
;;;; ==================================================

;; Lisp Top level needs and some general utilities

(defparameter *tmploc* #P"/tmp/thebench")  ; non-editable files go here, ideally this is all taken care of in py interface

(defparameter *mydef-rules* nil)  ; rules can be chosen by turning their switches on
(defparameter *mydef-globals* nil) ; to keep track of all globals defined by mydef macro
                                    ; i seem to want to define more and more and lose track
(defparameter *mydef-switches* nil) ; to keep track of all on/off switches
                                    ; i seem to want to define more and more and lose track

(defmacro mydef (nam val &key (rule nil) (msg t))
  (if (member nam *mydef-globals*)
    (and msg (format t "~%mydef warning! the name is RE-defined: ~A" nam))
    (progn 
      (push nam *mydef-globals*)
      (and rule (push nam *mydef-rules*))))
  `(defparameter ,nam ,val))  ; do the def in any case; no defvars in this dynamic env!

(defmacro defswitch (nam val &optional (msg nil))
  (if (member nam *mydef-switches*)
    (and msg (format t "~%defswitch warning! the name is RE-defined: ~A" nam))
    (push nam *mydef-switches*)) ; do the def in any case 
  `(defparameter ,nam ,val))      ; no defvars in this dynamic env!

(defun rules ()
  (dolist (g (sort (copy-seq *mydef-rules*) #'string<))
    (format t "~%~a ~a" g (eval g))))

(defun globals ()
  (dolist (g (sort (copy-seq *mydef-globals*) #'string<))
    (format t "~%~a" g)))

(defun onoff ()
  (dolist (g (sort (copy-seq *mydef-switches*) #'string<))
    (format t "~%~a : ~a" g (eval g))))

;; -----------------
;; a path language layer for multiple gethashes, to write linearly for visibility
;; -----------------

(defmacro machash (&rest path)
  "Instead of native (gethash 'F1 (gethash 'F2 ht)), we write (machash 'F1 'F2 ht)
  if ht table has a feature named F2 and the value has feature F1.
  NB.We cannot check at compile-time whether ht is a hashtable. No-one declares them.
  The idea is that only the outermost (F1 above) feature is assumed to be not necessarily hash-valued."
  (let* ((p (reverse path))
	 (ht (first p))
	 (feats (rest p))
	 (base (list 'gethash (first feats) ht)))
    (if (null feats)
      (error "No feature in hash path:~S ~S~%" ht feats)
      (dolist (feat (rest feats))(setf base (nconc (list 'gethash feat)
						   (list base)))))
    base))

;; Some reader macros and others are defined first to avoid complaints from Lisp compilers. 
;; SBCL can be particularly chatty.

(set-macro-character #\!     ; turns !c to "c". Used for LF constants.
  #'(lambda (s char)
      (declare (ignore char))
      (write-to-string (read s t nil t))))

(defmethod print-object ((object hash-table) stream) ;this is for lisp printer to print hashtables, not for mortals
    (format stream "#HASH{~{~{(~A  ~A)~}~^ ~}}"
	 (loop for key being the hash-keys of object
	       using (hash-value value)
	       collect (list key value))))

;; some common utilities

(defmacro mysqrt (num)
  `(if (> ,num 0.0) (sqrt ,num) 0.0))

(defun mpe (x1 x2 x3 x4)
  "computes the Cabay & Jackson '76 limit for minimum polynomial extrapolation (MPE) from 4 stages of the gradient."
  (let* ((x2x1 (- x2 x1))
	 (x3x2 (- x3 x2))
	 (a (+ x2x1 x3x2))
	 (x3x4 (- x3 x4)))
    (if (or (almost-eq x2 x1) (almost-eq x3 x2) (almost-eq x4 x3))
      x4
      (/ (+ (* x2 (/ x3x4 a)) (* x3 (/ x3x4 a)) x4)
	 (+ 1.0 (/ (* 2.0 x3x4) a))))))

(defmacro cabay-jackson (p1 p2 p3 p4)
  "safeguard MPE calls because of possibility for antilimit (divergence); see Cabay-Jackson 1976"
  `(handler-case (mpe ,p1 ,p2 ,p3 ,p4)
             (division-by-zero (c) (progn (format t "Warning! Antilimit in MPE because of ~a~%" c)
					  (/ most-positive-short-float 2.0)))))


(defun make-dummy-lex-entries (phon)
  "two dummy entries-- @X/*@X and @X\*@X"
  (let ((k1 (gensym))
	(k2 (gensym))
	(lf (gensym "unknown-")))
    `(((KEY ,k1) (PHON ,phon) (MORPH X)
		      (SYN (((BCAT @X) (FEATS NIL)) (DIR BS) (MODAL STAR) ((BCAT @X) (FEATS NIL))))
		      (SEM (LAM P (,lf P))) (PARAM 1.0))
      ((KEY ,k2) (PHON ,phon) (MORPH X)
		      (SYN (((BCAT @X) (FEATS NIL)) (DIR FS) (MODAL STAR) ((BCAT @X) (FEATS NIL))))
		      (SEM (LAM P (,lf P))) (PARAM 1.0)))))

(defmacro push-t (el st)
  "push element onto stack if el is not nil. eval el only once."
  `(let (($$elr ,el))(and $$elr (push $$elr ,st))))

(defun word-list-from-string (st)
  "from a string to list of its words as dictated by the Lisp reader"
  (with-input-from-string (p st)
    (do* ((w (read p nil nil) (read p nil nil)) ; whatever Lisp reader considers token is a word
	  (wl nil))              
      ((null w) (reverse wl))
      (push-t w wl))))

(defun mk-basic-cat (bcat)
  "if bcat is a string constant, BCAT feature's value is the list of lisp reader tokens in it, otherwise a symbol.
  In the first case, we mark the BCAT special, as (BCONST t). Returns list of name-value pairs.
  This avoids needless repetition of string to list conversion at parse time.
  No empty string check is performed because Lisp reader has funny ways to deal with strings."
  (if (stringp bcat)
    (list (list 'BCAT (word-list-from-string bcat)) '(BCONST t))
    (list (list 'BCAT bcat))))

(defmacro nv-list-val (key nvpl)
  "Returns the value of a list of (name value) pairs nvpl, where each pair's SECOND is the value"
  `(second (assoc ,key ,nvpl)))

(defmacro nv-get-v (key nvpl)
  `(nv-list-val ,key ,nvpl))  ; short macros for long ones

;; macros for cky cell's key type (len pos analysis)
(defmacro cell-len (cell)
  `(first ,cell))
(defmacro cell-pos (cell)
  `(second ,cell))
(defmacro cell-ana (cell)
  `(third ,cell))
(defmacro cell-len (cell)
  `(first ,cell))
(defmacro cell-pos (cell)
  `(second ,cell))
(defmacro cell-ana (cell)
  `(third ,cell))
(defmacro get-cell-param (cell)
  `(machash 'PARAM (nv-list-val 'SOLUTION (machash ,cell *cky-hashtable*))))

(defmacro lex-check (l1 l2)
  "return true if l2 is true when l1 is true, true when l1 is false"
  `(or (not ,l1) ,l2))

;; macros for training table access
(defmacro get-key-param (key)
  `(first (machash ,key *training-hashtable*)))
(defmacro get-key-param-xp (key)
  `(fifth (machash ,key *training-hashtable-x4*)))
(defmacro get-key-derivative (key)
  `(rest (machash ,key *training-hashtable*)))
(defmacro put-key-param (key param)
  `(setf (first (machash ,key *training-hashtable*)) ,param))
(defmacro put-key-derivative (key der)
  `(setf (rest (machash ,key *training-hashtable*)) ,der))
(defmacro mk-train-entry (key param der)
  `(setf (machash ,key *training-hashtable*) (cons ,param ,der)))
(defmacro get-param (val)
  `(first ,val))
(defmacro get-derivative (val)
  `(rest ,val))
(defmacro put-param (val param)
  `(setf (first ,val) ,param))
(defmacro put-derivative (key der)
  `(setf (rest (machash ,key *training-hashtable*)) ,der))

;; macros for supervision pairs of (Sentence l-command)
(defmacro sup-sentence (pair)
  `(first ,pair))
(defmacro sup-lf (pair)
  `(second ,pair))

;; macros for combinators
(defmacro &i ()
  "identity--used only in some LFs empirically, i.e. by the grammarian"
  `(mk-l (mk-v 'x) 'x))
(defmacro  &a (f a)
  "application, which is not a combinator, contrary to common belief, but the primitive of combinators."
  `(mk-a ,f ,a))
(defmacro &b (f g)
  "B combinator"
  `(mk-l (mk-v 'x)(mk-a ,f (mk-a ,g 'x))))
(defmacro &b2 (f g)
  "B^2 combinator"
  `(mk-l (mk-v 'x)(mk-l (mk-v 'y)(mk-a ,f (mk-a (mk-a ,g 'x)'y)))))
(defmacro &b3 (f g)
  "B^3 combinator"
  `(mk-l (mk-v 'x)(mk-l (mk-v 'y)(mk-l (mk-v 'z)(mk-a ,f (mk-a (mk-a (mk-a ,g 'x)'y)'z))))))
(defmacro &s (f g)
  "S combinator"
  `(mk-l (mk-v 'x)(mk-a (mk-a ,f 'x) (mk-a ,g 'x))))
(defmacro &sbar (f g)
  "Sbar combinator, aka the lost combinator"
  `(mk-l (mk-v 'w) (mk-l (mk-v 'z) (mk-a (mk-a ,f 'z) (mk-a ,g 'w)))))
(defmacro &sbarp (f g)
  "sbar variant; cf. lambda orders"
  `(mk-l (mk-v 'w) (mk-l (mk-v 'z) (mk-a (mk-a ,f 'w) (mk-a ,g 'z)))))
(defmacro &s2 (f g)
  "S^2 combinator. not Curry's S^2. See Bozsahin 2012"
  `(mk-l (mk-v 'x)(mk-l (mk-v 'y)(mk-a (mk-a ,f 'x) (mk-a (mk-a ,g 'x)'y)))))
(defmacro &d (f g)
  "D by Hoyt & Baldridge 2008. See Bozsahin 2015 book for discussion."
  `(mk-l (mk-v 'h)(mk-a ,f (mk-l (mk-v 'x)(mk-a ,g (mk-a 'h 'x))))))
(defmacro &d2 (f g)
  "D^2"
  `(mk-l (mk-v 'x1) (mk-l (mk-v 'h) (mk-a ,f (mk-l (mk-v 'x2)(mk-a (mk-a ,g 'x1) (mk-a 'h 'x2)))))))

;; hash tables and their keys (features)

(defmacro name-clash-report (feat)
  "reports a warning if feat is a name that clashes with hashtables' fixed features.
  The only hashtable that has potential clash is the basic cat table because only there we have
  user features."
  `(if (member ,feat *mydef-reserved*) (format t "~%*** warning *** Your feature name clashes with built-in features; please rename : ~A" ,feat)))

(defun make-lex-hashtable ()
  "keys are: index key param sem syn morph phon tag. Tag is NF tag"
  (make-hash-table :test #'equal :size 8 :rehash-size 2 :rehash-threshold 1.0))

(defun make-lrule-hashtable ()
  "keys are: index param insem outsem insyn outsyn."
  (make-hash-table :test #'equal :size 101 :rehash-size 20 :rehash-threshold 1.0))

(defun make-basic-cat-hashtable (nfeatures)
  "keys are: bcat, bconst, and features of the basic cat"
  (make-hash-table :test #'equal :size (+ nfeatures 5) :rehash-size 2 :rehash-threshold 1.0))

(defun make-complex-cat-hashtable ()
  "keys are: dir modal lex result arg."
  (make-hash-table :test #'equal :size 5 :rehash-size 2 :rehash-threshold 1.0))

(defun make-cky-entry-hashtable ()
  "keys are: syn sem index param lex tag. Tag is NF tag."
  (make-hash-table :test #'equal :size 6 :rehash-size 2 :rehash-threshold 1.0))

(defun copy-hashtable (ht)
  "To create a fresh copy of ht"
  (let ((new-table (make-hash-table :test (hash-table-test ht)
				    :size (hash-table-size ht))))
    (maphash #'(lambda(key value) 
		 (cond ((eql (type-of value) 'HASH-TABLE)
			(setf (machash key new-table) (copy-hashtable value)))
		       (t (setf (machash key new-table) value))))
	     ht)
    new-table))

(defun make-cky-hashtable (size)
  "keys are: (i j k) where i j k are integers.
  values are: (i1 j1 k1) and (i2 j2 k2), as left and right term
  pointer of combination, and one entry for analysis, with
  type cky-entry-hashtable. The key's value is an assoc list
  of 'left, 'right , and 'solution labels.
  These keys match by structure."
  (make-hash-table :test #'equal :size size :rehash-size size)) ; if data is big, dont spend too much time on rehash

(defun make-lf-hashtable (size)
  "used for finding argmax of most likely LF in the probabilistic part. The keys are LF items themselves, so there
  is no search for them. Consequently, key equality can be pretty complex.
  Values are tuples (cump indexes), where cump is scalar-product of the key LF's features, and indexes
  is a list of CKY entries for the cumulative."
  (make-hash-table :test #'equal :size size :rehash-size size)) ; double the size if full; to avoid rehash trashing

(defun make-training-hashtable (n)
  "keys are: lex item keys. they are assumed to be simple symbols.
  Values are :
  for *training-hashtable*: conses, first one is current parameter value, the second one is partial derivative 
  with respect to the lex item with key for the current training pair.
  for *training-non0-hashtable*: value: whether key'd feature has nonzero count in cky parse (for inside-outside)"
  (make-hash-table :test #'equal :size (+ n 100) :rehash-size 1000 :rehash-threshold 1.0))

;; 
;; safer load with error catching (rather than falling off to debugger--useful for servers)
;;
;; Thanks to Juanjo of stackoverflow

(mydef *error-message* 'LOAD_ERROR)
(mydef *error-tag* 'loaderror)
(mydef *error* nil)

(defun capture-error (condition)
  (setf *error*
	(format nil "***load error: ~A"
		condition))
  (throw *error-tag* (cons *error* *error-message*)))

(defun safely_load (file)
  (handler-bind ((serious-condition #'capture-error))
      (catch *error-tag*
        (load file)
        nil)))

;;; =======
;;; globals
;;; =======

(mydef *mydef-reserved* '(tag phon morph syn sem param insyn insem outsyn outsem bcat dir feats modal
				  left right solution result arg index lex bconst key id)) ; reserved words
(mydef *hash-data-size* 65536)  ; for CKY and LF argmax tables. Make IT REALLY BIG for training sets
                                       ; involving LOOOONG sentences.
				       ; default is 64K entries
;; the following two tables are created only once, and cleared before every parse. Change the variable above and reload 
;; for very long examples and large unpredictable training sets

(mydef *cky-hashtable* (make-cky-hashtable *hash-data-size*))    ; this is the CKY table keyed by cky loop indices
(mydef *cky-lf-hashtable* (make-lf-hashtable *hash-data-size*)) ; All LFs for the solution in the cky table.

(setf *print-readably* nil) ; In case you want to look at partial results. Turn it off to avoid print errors.
                            ; (Hard to believe but there is no consistent set of print variable values in CL that
                            ; would allow us to print lists, functions and hashtables readably at the same time.)
(setf *print-pretty* t)     ; NB: defvar does not reset when you re-load this file.
(mydef *lex-rules-table* nil)  ; this table is global to avoid loading/searching it everytime we parse.
(mydef *cky-input* nil)        ; current input which engendered the cky-hashtable entries.  
(mydef *cky-max* nil)          ; current highest ranking result cell in cky table.

;; for beam search in inside-outside computation 
(defswitch *beamp* t)            ; to beam or not to beam (not much of a question for big data)
(mydef *cky-nparses* 0)      ; *beam* is that number exp'd to *beam-exp*
(mydef *training-sorted-solutions-list* nil) ; to get out of loops by beam
(mydef *beam* 0)             ; beam width, determined by number of solutions
(mydef *beam-exp* 0.9)       ; must be 0 <= x <= 1 . Larger means wider beam

;; for NF parse, Eisner 1996-style---eliminate them at the source (no cky-entry)
(defswitch *nf-parse* t)
(mydef *bc* 'BC)
(mydef *fc* 'FC)
(mydef *ot* 'OT)
(mydef *forward-tag-set* (list *bc* *ot*))
(mydef *backward-tag-set* (list *fc* *ot*))

;; more globals
(mydef *epsilon* 0.001)        ; largest difference to be considered equal
(mydef *cky-lf-hashtable-sum* 0.0) ; sum of all result LFs inner product
(mydef *cky-argmax-lf* nil)    ; list of solutions for most likely LF
(mydef *cky-argmax-lf-max* nil); current highest-ranking cell in cky table for the most likely LF.
(mydef *cky-lf* nil)           ; LF with the argmax
(mydef *current-grammar* nil)  ; current  grammar, as a list of Lisp-translated lex specs
(mydef *loaded-grammar* nil)   ; The source of currently loaded grammar

(defswitch *lambdaflag* t) ; whether to show intermediate LFs in the output (final one always shown)
(mydef *abv* nil) ; list of shortcuts for common functions-- see the bottom
(defswitch *oovp* nil) ; set it to t to avoid out of vocabulary errors---two entries with uknown LFs will be created 
                          ;  to get partial parses as much as possible in a knowledge-poor way.

;; rule switches and default values
(mydef *a-apply* t :rule t)   ;application
(mydef *t-apply* t :rule t)
(mydef *f-comp* t  :rule t)  ;composition
(mydef *b-comp* t :rule t)
(mydef *fx-comp* t :rule t)
(mydef *bx-comp* t :rule t)
(mydef *f2-comp* t  :rule t)     ; B^2
(mydef *b2-comp* t :rule t)
(mydef *fx2-comp* t :rule t)
(mydef *bx2-comp* t :rule t)
(mydef *f3-comp* t  :rule t)  ;B^3
(mydef *b3-comp* t :rule t)
(mydef *fx3-comp* t :rule t)
(mydef *bx3-comp* t :rule t)

;; NF control
(defmacro backward-nf ()
  "this macro is dirty because it knows ht2 is the local var in all backward rules; avoids repeat"
  `(if *nf-parse* 
    (member (machash 'TAG ht2) *backward-tag-set*)
    t))

(defmacro forward-nf ()
  "this macro is dirty because it knows ht1 is the local var in all forward rules; avoids repeat"
  `(if *nf-parse* 
    (member (machash 'TAG ht1) *forward-tag-set*)
    t))

(defmacro set-nf-tag (ht tag)
  `(and *nf-parse* (setf (machash 'TAG ,ht) ,tag)))

;; ------------------------------
;; rule switch wholesale controls
;; ------------------------------

(defun monad-all ()
  (setf 
    *a-apply* t   ;application
    *t-apply* t
    *f-comp* t    ;composition
    *b-comp* t
    *fx-comp* t
    *bx-comp* t
    *f2-comp* t   ;B^2
    *b2-comp* t
    *fx2-comp* t
    *bx2-comp* t
    *f3-comp* t   ;B^3
    *b3-comp* t
    *fx3-comp* t
    *bx3-comp* t))

(defun monad-montague ()
  (setf 
    *a-apply* t   ;application
    *t-apply* t
    *f-comp* nil    ;composition
    *b-comp* nil
    *fx-comp* nil
    *bx-comp* nil
    *f2-comp* nil   ;B^2
    *b2-comp* nil
    *fx2-comp* nil
    *bx2-comp* nil
    *f3-comp* nil   ;B^3
    *b3-comp* nil
    *fx3-comp* nil
    *bx3-comp* nil))

;
; -----------------

(defmacro sort-grammar (&optional (order #'>))
  "sort current grammar by order, default descending. report quartiles"
  `(let* ((g (copy-seq *current-grammar*))   ; sort is destructive
	  (gs (sort g ,order :key #'(lambda (x)(nv-get-v 'PARAM x))))
	  (n (length gs)))
     (values gs
	     (nv-get-v 'PARAM (first gs))                      ;highest
	     (nv-get-v 'PARAM (nth (truncate (* n 0.25)) gs))  ;q1
	     (nv-get-v 'PARAM (nth (truncate (* n 0.5)) gs))   ;q2
	     (nv-get-v 'PARAM (nth (truncate (* n 0.75)) gs))  ;q3
	     (nv-get-v 'PARAM (car (last gs)))                 ;lowest
	     )))

(defun pack-cky-lf-hashtable ()
  (let ((lf-list nil))
    (maphash #'(lambda (key val)(push (list key (first val) (rest val)) lf-list))
	     *cky-lf-hashtable*)
    (sort lf-list #'> :key #'second)))


(defun status(&optional (all-lfs nil))
  (format t "  ---------------------------~%")
  (format t "  Currently loaded grammar  : ~A~%" *loaded-grammar*)
  (format t "  current-grammar           : ~A item~:p~%" (length *current-grammar*))
  (format t "  ARULES-TABLE              : ~A item~:p~%" (length *lex-rules-table*))
  (format t "  CKY-HASHTABLE             : ~A item~:p~%" (hash-table-count *cky-hashtable*))
  (format t "  CKY-INPUT  for the table  : ~A ~%" *cky-input*)
  (format t "  Most likely l-command     : ~A ~%" *cky-lf*)
  (format t "  Its most likely analysis  : ~A~%" *cky-argmax-lf-max*)
  (format t "  Sum of weighted counts    : ~A ~%" *cky-lf-hashtable-sum*)
  (format t "  Most likely l-command's cell  : ~A ~%" *cky-argmax-lf*)
  (format t "  Number of differing l-commands: ~A ~%" (hash-table-count *cky-lf-hashtable*))
  (format t "  Most weighted analysis        : ~A ~%" *cky-max*)
  (format t "  ---------------------------~%")
  (and all-lfs (pack-cky-lf-hashtable))
  )

(defun which_processor ()
  (values "Monad of Natural Command" "8.0"))

(defun flash-news (&optional (report t))
  (cond (report 
	  (format t "~%Synthetic case and second-order function generation available.")
	  (format t "~%Kullback-Leibler test available.")
	  )))

(defun welcome () 
  (format t "~%=====================================================")
  (multiple-value-bind (pr v) (which_processor)
    (format t "~%This is the processor for ~A,~%  version ~A" pr v))
  (format t "~%-----------------------------------------------------")
  (flash-news)
  (format t "~%Ready.")
  (format t "~%=====================================================~%"))

(defun beam-value ()
  (format t "~%*Beamp* = ~A  *Beam-exp* = ~A~%" *beamp* *beam-exp*))

(defun nf-parse-value ()
  (format t "~%*nf-parse* = ~A~%" *nf-parse*))

(defun set-beam-exp (val)
  (and (> val 1.0) (format t "Beware! impossible beam = ~A~%" val))
  (and (< val 0.6) (format t "Warning! very narrow beam = ~A~%" val))
  (setf *beam-exp* val)
  (beam-value))

(defun show-config ()
  (onoff)
  (beam-value)
  (rules))

;; ==========================

(defun beamer ()
  "use this to set beam only after a parse so that *cky-nparses* is known."
  (setf *beam* (ceiling (expt *cky-nparses* *beam-exp*))))

;;;; ==============================================
;;;; The lambda layer, whose syntax is given below.
;;;; ==============================================
;;;;
;;;; this is a direct import of Alessandro Cimatti's ADT for Lambda-calculus. 
;;;; Thanks for putting it on the web.
;;;; (minor addition for our purposes: singleton e can be symbol OR constant)

;;;; The ADT for expressions
;;;; e ::= v | l | a
;;;; v ::= symbolp | constantp
;;;; a ::= ( e e )
;;;; l :: = ( lam v e )

(defun mk-v (sym) sym)
(defun is-v (e) (cond ((consp e) nil)
		      ((symbolp e) t) 
		      ((constantp e) t)
		      ;((special-operator-p e) t)
		      (t nil)))
(defun mk-l (v b) (list 'lam v b))
(defun is-l (e) (and (consp e) (= (length e) 3) (equal 'lam (first e)) (is-v (second e))))
(defun l-get-v (l) (second l))
(defun l-get-b (l) (third l))
(defun mk-a (f a) (list f a))
(defun is-a (e) (and (consp e) (= (length e) 2)))
(defun a-get-f (a) (first a))
(defun a-get-a (a) (second a))
(defun freshvar ()(gensym))

;; Recognizer. takes arbitrary s-exp in input

(defun is-e (e)
  (cond ((is-v e) t)
	((is-a e) (and
		    (is-e (a-get-f e))
		    (is-e (a-get-a e))))
	((is-l e) (and
		    (is-e (l-get-v e))
		    (is-e (l-get-b e))))
	(t nil)))

;; Return the free variables of an expression

(defun fv (e)
  (cond
    ((is-v e) (list e))
    ((is-a e) (append
		(fv (a-get-f e))
		(fv (a-get-a e))))
    ((is-l e) (remove
		(l-get-v e)
		(fv (l-get-b e))))
    (t (error "Unknown lambda term type"))))

(defun free-in (v e) (member v (fv e)))

;;; equivalence up to alpha conversion

(defun alpha-equivalent1 (e1 e2 rpl1 rpl2)
  (cond 
    ((is-v e1)
     (and (is-v e2)
	  (let ((new1 (cdr (assoc e1 rpl1)))
		(new2 (cdr (assoc e2 rpl2))))
	    (if (and (null new1) (null new2))
	      (equal e1 e2)
	      (equal new1 new2)))))
    ((is-a e1)
     (and (is-a e2)
	  (alpha-equivalent1 (a-get-f e1) (a-get-f e2) rpl1 rpl2) 
	  (alpha-equivalent1 (a-get-a e1) (a-get-a e2) rpl1 rpl2)))
    ((is-l e1)
     (and (is-l e2)
	  (let* ((new (freshvar))
		 (old1 (l-get-v e1))
		 (old2 (l-get-v e2))
		 (newrpl1 (cons (cons old1 new) rpl1))
		 (newrpl2 (cons (cons old2 new) rpl2)))
	    (alpha-equivalent1 (l-get-b e1) (l-get-b e2) newrpl1 newrpl2))))))

(defun alpha-equivalent (e1 e2)  (alpha-equivalent1 e1 e2 nil nil))

;;; substitution

(defun subst-with-in (x e1 exp)
  (cond 
    ((is-v exp)
     (if (equal x exp) e1 exp))
    ((is-a exp)
     (mk-a
       (subst-with-in x e1 (a-get-f exp))
       (subst-with-in x e1 (a-get-a exp))))
    ((is-l exp) ; say exp is (lam y e)
     (let ((y (l-get-v exp)) (e (l-get-b exp)))
       (cond
	 ((equal x y) exp)
	 ((not (free-in x e)) exp)
	 ((and (free-in x e) (not (free-in y e1)))
	  (mk-l y (subst-with-in x e1 e)))
	 ((and (free-in x e) (free-in y e1))
	  (let ((z (freshvar)))
	    (mk-l z (subst-with-in x e1 (subst-with-in y z e))))))))))

;;; beta reduction

(defun is-rdx (e) (and (is-a e) (is-l (a-get-f e))))
(defun rdx-get-v (rdx) (l-get-v (a-get-f rdx)))
(defun rdx-get-b (rdx) (l-get-b (a-get-f rdx)))
(defun rdx-get-a (rdx) (a-get-a rdx))

;;; Beta reduce: (a (l v e) e1) ==> [e1 / v] e

(defun beta-reduce (rdx)
  (subst-with-in 
    (rdx-get-v rdx)
    (rdx-get-a rdx)
    (rdx-get-b rdx)))

;;; Beta reduce if possible

(defun beta-reduce-if-redex (e)
  (if (is-rdx e) (beta-reduce e) e))

;;; Iterate beta reduction on outermost redex

(defun beta-reduce-outer (e &optional (lim 100))
  (cond
    ((< lim 0) e)
    ((is-rdx e)
     (beta-reduce-outer (beta-reduce e) (- lim 1)))
    ((is-v e) e)
    ((is-a e)
     (mk-a
       (beta-reduce-outer (a-get-f e))
       (beta-reduce-outer (a-get-a e))))
    ((is-l e)
     (mk-l
       (l-get-v e)
       (beta-reduce-outer (l-get-b e))))))

;;; Iterate beta reduction on innermost redex

(defun beta-reduce-inner (e &optional (lim 100))
  (cond
    ((< lim 0) e)
    ((is-v e) e)
    ((is-a e)
     (beta-reduce-if-redex
       (mk-a (beta-reduce-inner (a-get-f e) lim)
	     (beta-reduce-inner (a-get-a e) lim))))
    ((is-l e)
     (mk-l
       (l-get-v e)
       (beta-reduce-inner (l-get-b e) lim)))))

;;; Beta normalization

(defun beta-normalize-param (e fn &optional (lim 100))
  (let* ((res (apply fn (list e lim)))
	 (use-alpha-equivalent t)
	 (stop (if use-alpha-equivalent
		 (alpha-equivalent res e)
		 (equal res e))))
    (if stop
      res ; fix point reached
      (beta-normalize-param res fn))))

(defun beta-normalize-outer (e &optional (lim 100))
  (beta-normalize-param e 'beta-reduce-outer lim))

(defun beta-normalize-inner (e &optional (lim 100))
  (beta-normalize-param e 'beta-reduce-inner lim))

;;; try with the two different strategies and compare results

(defun beta-normalize (e)
  (let ((res-inner (beta-normalize-inner e 100))
	(res-outer (beta-normalize-outer e 100)))
    (if (alpha-equivalent res-outer res-inner)
      (progn 
	(format t "Results are alpha equivalent~%")
	(format t "Inner: ~A~%" res-inner)
	(format t "Outer: ~A~2%" res-outer))
      (progn 
	(format t "Results are NOT alpha-equivalent!")
	(format t "Inner: ~A~%" res-inner)
	(format t "Outer: ~A~2%" res-outer)))))
  
;;;; =============================================================================
;;;; == Part 0: common functions               			               ==
;;;; =============================================================================

(defun format-mod (modality)
  (cond ((eql modality 'CROSS) "+")
	((eql modality 'HARMONIC) "^")
	((eql modality 'STAR) "*")
	(t ""))) ; ALL is default

(defun format-dir (dir lex)
  (if lex 
    (cond ((eql dir 'BS) "\\\\")
	  ((eql dir 'FS) "//")
	  (t ""))
    (cond ((eql dir 'BS) "\\")
	  ((eql dir 'FS) "/")
	  (t ""))))

(defun input-range (len pos)
  "return a subsequence of the current input starting from pos and length long"
  (subseq *cky-input* (- pos 1) (+ (- pos 1) len)))

(defun linearize-syn (synht)
  "turns the syn hashtable synht to a string for display; avoids features other than BCAT DIR MODAL"
  (cond ((null synht) "")
	((machash 'BCAT synht)
	 (if (machash 'BCONST synht)
	   (format nil "'~{~A~^ ~}'" (machash 'BCAT synht))
	   (write-to-string (machash 'BCAT synht))))
	(t (if (machash 'LEX synht)  ; don't print modality for LEX slash. it's * anyway.
	     (concatenate 'string
			  (cond ((machash 'DIR 'RESULT synht) "("))
			  (linearize-syn (machash 'RESULT synht))
			  (cond ((machash 'DIR 'RESULT synht) ")"))
			  (format-dir  (machash 'DIR synht) t)
			  (cond ((machash 'DIR 'ARG synht) "("))
			  (linearize-syn (machash 'ARG synht))
			  (cond ((machash 'DIR 'ARG synht) ")")))
	     (concatenate 'string
			  (cond ((machash 'DIR 'RESULT synht) "("))
			  (linearize-syn (machash 'RESULT synht))
			  (cond ((machash 'DIR 'RESULT synht) ")"))
			  (format-dir  (machash 'DIR synht) nil)
			  (format-mod (machash 'MODAL synht)) 
			  (cond ((machash 'DIR 'ARG synht) "("))
			  (linearize-syn (machash 'ARG synht))
			  (cond ((machash 'DIR 'ARG synht) ")")))))))

(defun display-lf (lf &optional (res nil))
  "shorten the keyword LAM as '\' and avoid parenths of currying."
  (cond ((null lf) res)
	((is-v lf) (cons lf res))
	((is-l lf) (let ((x (display-lf (l-get-b lf))))
		     (append (list '|\\| (l-get-v lf) '|\.|) x res)))
	((is-a lf) (let* ((f (display-lf (a-get-f lf)))
			  (y (display-lf (a-get-a lf)))
			  (a (if (and (consp y)(= (length y) 1))
			       (first y)
			       y)))
		     (append f (list a) res)))))

(defun cky-sem (cell)
  "get the lf stored in cky table's cell location. Cells are (i j k) triplets"
  (and (machash cell *cky-hashtable*)
       (machash 'SEM (nv-list-val 'SOLUTION (machash cell *cky-hashtable*)))))

(defun cky-thread (cell)
  "to show (partial) results"
  (let* ((solution (nv-list-val 'SOLUTION (machash cell *cky-hashtable*)))
	 (l (nv-list-val 'LEFT (machash cell *cky-hashtable*)))
	 (r (nv-list-val 'RIGHT (machash cell *cky-hashtable*)))
	 (lf (machash 'SEM solution))
	 (ix (machash 'INDEX solution))
	 (inputs (concatenate 'string
			      (write-to-string (input-range (cell-len l)(cell-pos l)))
			      (write-to-string (input-range (cell-len r)(cell-pos r)))))
	 (syn (linearize-syn (machash 'SYN solution))))
    (cond ((equal l r)   ; we've reached a lexical cell 
	   (cond ((> (cell-len l) 1)
		  (format t (cky-thread l)))) ; it may be a lex rule applying to a phrase
	   (if *lambdaflag*
	     (format nil "~%~5,,,a~6T~A :: ~A~%        : ~A" ix (input-range (cell-len l)(cell-pos l)) syn lf)
	     (format nil "~%~5,,,a~6T~A :: ~A" ix (input-range (cell-len l)(cell-pos l)) syn)))
	  (t (concatenate 'string 
			    (cky-thread l)
			    (cky-thread r)
			    (if *lambdaflag*
			      (format nil "~%~5,,,a~6T~A :: ~A~%        : ~A" ix inputs syn lf)
			      (format nil "~%~5,,,a~6T~A :: ~A" ix inputs syn)))))))

(defun cky-reveal-cell (cell)
  (format t (cky-thread cell))
  (format t "~2%Final l-command, normal-evaluated:~2%~A =~%~A" 
	  (beta-normalize-outer (cky-sem cell))
	  (display-lf (beta-normalize-outer (cky-sem cell)))))

(defun f-param-inner-prod (pr1 pr2)
  "Implements the inner product of f and parameters of Zettlemoyer & Collins (2005) formula 1, 
  dynamic programming-style."
  (+ pr1 pr2))

(defun get-gram-items (phon)
  "given a phonological string, return a list of lex specs for the string."
  (let ((specs nil))
    (dolist (l *current-grammar*)
      (and (equal (nv-list-val 'PHON l) phon)(push l specs)))
    specs))

(defun show_pos (poses)
  (dolist (l *current-grammar*)
    (if (member (nv-list-val 'MORPH l) poses)
      (format t "~%Entry: ~A~%--~%" l)))
  t)

(defun mod-compatiblep (mod1 mod2)
  "checks if two lexical modalities are compatible. Returns t if they are."
  (or (eql mod1 'ALL) (eql mod2 'ALL) (eql mod1 mod2)))

(defun basicp (syntype)
  "Returns non-nil if syntype has BCAT feature at top level, which means it is basic."
  (nv-list-val 'BCAT syntype))

(defun var? (x)
  "If a feature's value is a local variable, it has the ? prefix."
  (and (symbolp x)(eql (char (symbol-name x) 0) #\?)))

(defun algebraic? (x)
  "If a basic category is an algebraic unknown (NOT a variable), it has the @ prefix.
  Keep in mind that MG has NO VARIABLES; basic, complex, syncategorematic, or trace."
  (and (symbolp x)(eql (char (symbol-name x) 0) #\@)))

(defun specialp-hash (htsyn)
  "special cats have @ prefix on BCAT and can be complex in result but not in arg.
  This way we maintain procedural neutrality."
  (cond ((and (machash 'BCAT htsyn)(algebraic? (machash 'BCAT htsyn))))
        ((and (machash 'ARG htsyn)(null (machash 'DIR 'ARG htsyn))
	 (algebraic? (machash 'BCAT 'ARG htsyn))))))

(defun basicp-hash (htsyn)
  "Returns true iff htsyn has no DIR feature, and it is not special."
  (and (null (machash 'DIR htsyn)) (not (specialp-hash htsyn)))) 

(defun complexp-hash (htsyn)
  (and (not (basicp-hash htsyn)) (not (specialp-hash htsyn))))

(defun lexp (spec)
  "Returns non-nil if spec has PHON feature."
  (nv-list-val 'PHON spec))

(defun lexp-hash (ht)
  "Returns the PHON feature of hashtable ht, which is nil only for lexical rules."
  (machash 'PHON ht))

(defun create-syn-table (cat)
  "Creates a hash table, which may contain other hash tables if cat is complex."
  (cond ((basicp cat) 
	 (let ((ht (make-basic-cat-hashtable (length (nv-list-val 'FEATS cat)))))
	   (setf (machash 'BCAT ht) (nv-list-val 'BCAT cat))
	   (if (nv-list-val 'BCONST cat) (setf (machash 'BCONST ht) (nv-list-val 'BCONST cat))) ; no BCONST feature in hashtable if nil (less consing)
	   (dolist (feat-val (nv-list-val 'FEATS cat))
	     (setf (machash (car feat-val) ht) (cadr feat-val)))
	   (return-from create-syn-table ht)))
	(t 		   ; the cat is complex
	  (let ((ht (make-complex-cat-hashtable)))
	    (setf (machash 'DIR ht) (nv-list-val 'DIR cat))
	    (setf (machash 'MODAL ht) (nv-list-val 'MODAL cat))
	    (and (nv-list-val 'LEX cat) (setf (machash 'LEX ht) (nv-list-val 'LEX cat))) ; no LEX feature in hashtable if nil (less consing)
	    (setf (machash 'RESULT ht) (create-syn-table (first cat)))
	    (if (nv-list-val 'LEX cat)
	      (setf (machash 'ARG ht) (create-syn-table (fifth cat))) ; after RESULT DIR MOD LEX
	      (setf (machash 'ARG ht) (create-syn-table (fourth cat)))) ; after RESULT DIR MOD
	    (return-from create-syn-table ht)))))

(defun hash-lex (lexspec)
  "This function turns a sequentially represented lex entry, which consists of 
  Lisp association lists in the lexicalized grammar, to a hashtable, 
  for faster and easier parsing. Called during parsing and synthetic case arules generation."
  (let ((ht (make-lex-hashtable)))
    (setf (machash 'INDEX ht) 'ELM)     ; created by not combining
    (setf (machash 'TAG ht) *ot*)        ; NF tag initialization
    (setf (machash 'KEY ht) (nv-list-val 'KEY lexspec))
    (setf (machash 'PARAM ht) (nv-list-val 'PARAM lexspec))
    (setf (machash 'SEM ht) (nv-list-val 'SEM lexspec))
    (setf (machash 'MORPH ht) (nv-list-val 'MORPH lexspec))
    (setf (machash 'PHON ht) (nv-list-val 'PHON lexspec))
    (setf (machash 'SYN ht) (create-syn-table (nv-list-val 'SYN lexspec))) ; this is another hash table
    ht))

(defun hash-lexrule (lexspec)
  "Lexical rules are kept in a global hash table to avoid search and reload.
  This function creates a lexical rule entry to be put in that table."
  (let ((ht (make-lrule-hashtable)))
    (setf (machash 'INDEX ht) (nv-list-val 'INDEX lexspec))     ; lexical rule name
    (setf (machash 'KEY ht) (nv-list-val 'KEY lexspec))
    (setf (machash 'PARAM ht) (nv-list-val 'PARAM lexspec))
    (setf (machash 'INSEM ht) (nv-list-val 'INSEM lexspec))
    (setf (machash 'OUTSEM ht) (nv-list-val 'OUTSEM lexspec))
    (setf (machash 'INSYN ht) (create-syn-table (nv-list-val 'INSYN lexspec)))
    (setf (machash 'OUTSYN ht) (create-syn-table (nv-list-val 'OUTSYN lexspec)))
    ht))

(defun singleton-match (fht aht alex ruleindex coorda)
  "called only when functor hashtable fht's argument is singleton category; succeeds if argument hashtable aht's string
  span matches fht's arg's singleton category. (These categories were converted to word lists during file processing.)
  Called from function application only. 
  Strings coordinates are of the form (x y) for argument; 
  they are used to access *cky-input*; x is length, y is starting pos (from 1).
  Returns the new hashtable if succesful, otherwise nil.
  Check the BCAT, which is a phon sequence, one by one because of |..| inside"
  (let* ((bcat (format nil "~{~A~^ ~}" (mapcar #'symbol-name (machash 'BCAT 'ARG 'SYN fht))))
	 (substr (format nil "~{~A~^ ~}" (mapcar #'symbol-name (subseq *cky-input* 
						 (- (second coorda) 1) (+ (first coorda) (- (second coorda) 1))))))
	 (success (equal bcat substr)))
    (if (and success (lex-check (machash 'LEX 'SYN fht) alex))
      (let ((newht (make-cky-entry-hashtable)))
	(set-nf-tag newht *ot*)
	(setf (machash 'SEM newht) (&a (machash 'SEM fht) (machash 'SEM aht))) ; this means lexical LFs must be compositional
	(setf (machash 'INDEX newht) ruleindex)
	(and (machash 'LEX 'SYN fht) (setf (machash 'LEX newht) t))
	(setf (machash 'SYN newht) (machash 'RESULT 'SYN fht)) ; nothing to bind, assuming no features for singletons
	newht))))

(defun cat-match (sht1 sht2)
  "Checks to see if potentially complex syntactic cat hashtables, sht1 and sht2,
  are slash equivalent, modally compatible, and feature compatible.
  If common features have variable values on both sides, they are not instantiated
  to each other to avoid global variable passing of the HPSG kind.
  E.g. agr=?x in sht1 and agr=?y in sht2, would make first agr ?y.
  There ain't no global variables or complex features.
  There is no structured unification. Feature match is simply value match or lack of value.
  Returns 3 values: success of match, local variables and their values in two binding
  lists of the form (feature variable value).
  First list relates to left term, and right list to right term."
  (cond ((and (basicp-hash sht1)(basicp-hash sht2))
	 (let ((binds1 nil)
	       (binds2 nil))
	   (maphash #'(lambda (feat1 v1)  ; check sht1 feats and find binds
			(let ((v2 (machash feat1 sht2)))
			  (and v1 v2 (not (var? v1))(not (var? v2))(not (equal v1 v2))  ; changed eql to equal. (BCAT v)
			       (return-from cat-match (values nil nil nil)))            ; can have list value for v because of singletons
			  (and v2 (var? v1)(not (var? v2))(push (list feat1 v2) binds1))))
		    sht1)
	   (maphash #'(lambda (feat2 v2)  ; find sht2 binds, common features are by now known to match
			(let ((v1 (machash feat2 sht1)))
			  (and v1 (var? v2)(not (var? v1))(push (list feat2 v1) binds2))))
		    sht2)
	   (values t binds1 binds2)))
	((and (complexp-hash sht1)(complexp-hash sht2)
	      (eql (machash 'DIR sht1)(machash 'DIR sht2))
	      (mod-compatiblep (machash 'MODAL sht1) (machash 'MODAL sht2))
	      (multiple-value-bind (res1 b1 b2)
		(cat-match (machash 'ARG sht1)(machash 'ARG sht2))
		(and res1 (multiple-value-bind (res2 b12 b22)
			    (cat-match (machash 'RESULT sht1)(machash 'RESULT sht2))
			    (return-from cat-match (values res2 (append b12 b1) (append b22 b2))))))))
	(t (values nil nil nil))))

(defun realize-binds2 (newht binds)
  "we know that binds is non-empty."
  (cond  ((basicp-hash newht)
	  (dolist (fv binds)
	    (let ((shtval (machash (first fv) newht)))
	      (and (var? shtval)
		   (setf (machash (first fv) newht)(second fv))))))
	 (t (progn (realize-binds2 (machash 'RESULT newht) binds)
		   (realize-binds2 (machash 'ARG newht) binds))))
    newht)

(defun realize-binds (sht binds)
  "Returns the syntactic hashtable sht with matching features in it bound to list of feature-values in 
  binds if same local variable is used.
  It is important to call this function with a local binding list, otherwise we might
  create global variables. See comments on cat-match.
  It must do the update on fresh copy of sht to avoid changing constituents of combination!"
  (let ((newht (copy-hashtable sht)))
    (cond ((null binds) newht)
	  (t (realize-binds2 newht binds)))))

(defun substitute-special-cat (spht1 catht2)
  "substitutes all categories in special cat spht1 with normal cat catht2.
  To avoid HPSGisation, we must assume all basic cats in spht1 are special. This way
  we avoid reentrant unification, and this is empirically sound."
  (cond ((null (machash 'DIR spht1)) catht2)
	(t (let ((newsyn (make-complex-cat-hashtable)))
	     (setf (machash 'DIR newsyn) (machash 'DIR spht1))  ; slash projects
	     (setf (machash 'MODAL newsyn) (machash 'MODAL spht1)) 
	     (and (machash 'LEX spht1) (setf (machash 'LEX newsyn) (machash 'LEX spht1)))
	     (setf (machash 'RESULT newsyn)(substitute-special-cat (machash 'RESULT spht1) catht2)) ; arg and res substitute
	     (setf (machash 'ARG newsyn)(substitute-special-cat (machash 'ARG spht1) catht2))
	     newsyn))))


(defun load_bin (binname)
  "loads the grammar generated from intermediate representation of monadic grammar"
  (let* ((gname binname))
    (setf *error* nil)
    (safely_load gname)  ;; sets *current-grammar* variable             
    (cond ((not *error*) (setf *lex-rules-table* nil)
			 (setf *loaded-grammar* gname)
			 (dolist (l *current-grammar*)(and (not (lexp l)) (push-t (hash-lexrule l) *lex-rules-table*))) ; we get reversed list of rules
			 (setf *lex-rules-table* (reverse *lex-rules-table*)) ; it is important that the rules apply in the order specified
			 )
	  (t (setf *error* nil) (format t "Something's wrong with the file ~A~% is it a grammar binary?~%" binname))))
  t) ; do not return hash values to avoid cl4py problems

(defun get-ht (phon ht-list)
  "returns the hashtable in ht-list that has PHON feature same as phon.
  Used for testing purposes only."
  (dolist (ht ht-list)(and (eql phon (machash 'PHON ht)) (return-from get-ht ht))))

(defun cky-pprint ()
  "Tries to pretty print cky table as much as it can. Hashtable and closure prints are
  up to your lisp printer variables and CL implementation, aka insallah printing.
  For testing purposes only."
  (maphash #'(lambda (k v) (format t "~%~A = ~A~%" k v)) *cky-hashtable*))

(defun cky_show_analysis_1 (m &optional (onto nil))
  "tries to print the derivation in CKY cell (n 1 m) as humanly as possible where n is input size. Only final result is
  normalized in its LF. Onto is assumed to be a basic cat, and if supplied only these solutions will be shown"
  (if (machash (list (length *cky-input*) 1 m) *cky-hashtable*)
    (if (or (not onto) (equal (machash 'BCAT 'SYN (nv-list-val 'SOLUTION 
							       (machash (list (length *cky-input*) 1 m) *cky-hashtable*))) onto))
      (progn 
	(format t "~2%Analysis ~A~%--------------" m)
	(format t (cky-thread (list (length *cky-input*) 1 m)))
	(format t "~2&Final l-command, normal-order evaluated: ~2%    ~A =~%    ~A" 
		(beta-normalize-outer (cky-sem (list (length *cky-input*) 1 m)))
		(display-lf (beta-normalize-outer (cky-sem (list (length *cky-input*) 1 m))))))))
  t)

(defun cky-show-der (row col &optional (onto nil))
  "tries to print the derivations ending in CKY cell (row col) as humanly as possible. Only final result is
  normalized in its LF. Onto is assumed to be a basic cat, and if supplied only these solutions will be shown"
  (do ((m 1 (incf m)))
    ((null (machash (list row col m) *cky-hashtable*)))
    (if (or (not onto) (equal (machash 'BCAT 'SYN (nv-list-val 'SOLUTION (machash (list row col m) *cky-hashtable*))) onto))
      (progn 
	(format t "~2%Analysis ~A~%--------------" m)
	(format t (cky-thread (list row col m)))
	(format t "~2&Final l-command, normal-order evaluated: ~2%    ~A =~%    ~A" 
		(beta-normalize-outer (cky-sem (list row col m)))
		(display-lf (beta-normalize-outer (cky-sem (list row col m))))))))
  )

(defun cky-show-normal-forms (row col)
   (do ((m 1 (incf m)))
     ((null (machash (list row col m) *cky-hashtable*)))
     (format t "~2%Analysis ~A~%----------------~%" m)
     (beta-normalize (cky-sem (list row col m)))))

(defun cky_show_analysis_onto (catlist)
  "the answer is in first column of row n, which is the length of the string."
  (dolist (cat catlist)
    (cky-show-der (length *cky-input*) 1 cat))
  t)

(defun cky_show_analysis (&optional (onto nil))
  "the answer is in first column of row n, which is the length of the string."
  (cky-show-der (length *cky-input*) 1 onto)
  t)

(defun cky-show-lf-eqv ()
  "does one check: evaluate results in normal and applicative order, and report differences"
  (cky-show-normal-forms (length *cky-input*) 1))

;;;; =============================================================================
;;;; == Part 2: The CKY parser 
;;;; =============================================================================

;;;; CRITICAL NOTES lambda forms and CL lambda forms:
;;;
;;;; 1) We assume the input functions are curried.
;;;; 2) CL does not like to re-define constants, hence defining LF constants as Lisp
;;;;  constants wouldn't work since it's very likely that they overlap in your lexicon. 
;;;;  (quote sleep) wouldn't work either because it only
;;;;  delays evaluation of sleep by one step, for quote itself is a function. 
;;;;  Therefore since we have many LF constants with overlapping names, we use !c to
;;;;  fake a constant c, which is actually a function that returns c as a string constant.
;;;;  Use !c in LFs wherever you need a true constant (i.e. something that evaluates to itself ALL THE TIME).
;;;; 3) Probabilistic component requires checking for LF equivalence. This is almost impossible if we
;;;;  use native lambdas of Lisp, because internal reductions will be saved by Lisp in a different format 
;;;;  (closures, functions) which we cannot penetrate. If your input sentence does not lead to an LF
;;;;  with no lambdas, the leftover lambdas would be invisible, and we cannot check for equality.
;;;;  So we implement our own lambda language, and use that for combinators and in translating your input.

;;;;  We translate all combinator instructions to lambda terms in our lambda ADT language
;;;;  so that LF normalizer only works with our lambdas.

;; Monad's dependency rule. Succesful combination creates a new cky entry with SYN SEM INDEX PARAM
;;    PARAM is calculated by the caller of caller, because it is a common method for all rules.

(defun a-apply (ht1 ht2 lex2 coord2) 
  "forward application"
  (and (complexp-hash (machash 'SYN ht1))
       (forward-nf)
       (eql (machash 'DIR 'SYN ht1) 'FS) ; no need to check modality, all entries qualify for application.
       (if (machash 'BCONST 'ARG 'SYN ht1) 
	 (return-from a-apply (singleton-match ht1 ht2 lex2 'C1 coord2)) t) ; short-circuit a-apply if arg is singleton
       (multiple-value-bind (match b1) ; b2 is not needed from (values)
	 (cat-match (machash 'ARG 'SYN ht1) (machash 'SYN ht2))
	 (and match 
	      (lex-check (machash 'LEX 'SYN ht1) lex2)  ; if we have X//Y Y , Y must be lex
	      (let ((newht (make-cky-entry-hashtable)))
		(set-nf-tag newht *ot*)
		(setf (machash 'SEM newht) (&a (machash 'SEM ht1) (machash 'SEM ht2)))
		(setf (machash 'INDEX newht) 'C1)
		(and (machash 'LEX 'SYN ht1) (setf (machash 'LEX newht) t)) ; result is lexical too if X//Y Y succeeds--pass on
		(setf (machash 'SYN newht) (realize-binds (machash 'RESULT 'SYN ht1) b1))
		newht)))))

(defun t-apply (ht1 ht2 lex1 coord1) 
  "backward application"
  (and (complexp-hash (machash 'SYN ht2))
       (backward-nf)
       (eql (machash 'DIR 'SYN ht2) 'BS) ; no need to check modality, all entries qualify for application.
       (if (machash 'BCONST 'ARG 'SYN ht2) 
	 (return-from t-apply (singleton-match ht2 ht1 lex1 'C2 coord1)) t) ; short-circuit t-apply if arg is singleton
       (multiple-value-bind (match b1 b2)
	 (cat-match (machash 'SYN ht1) (machash 'ARG 'SYN ht2))
	 (use-value b1) ; dummy use of b1, not needed but cant be skipped in (values)
	 (and match 
	      (lex-check (machash 'LEX 'SYN ht2) lex1)  ; if we have Y X\\Y, Y must be lex
	      (let ((newht (make-cky-entry-hashtable)))
		(set-nf-tag newht *ot*)
		(setf (machash 'SEM newht) (&a (machash 'SEM ht2) (machash 'SEM ht1)))
		(setf (machash 'INDEX newht) 'C2)
		(and (machash 'LEX 'SYN ht2) (setf (machash 'LEX newht) t)) ; result is lexical too if Y X\\Y succeeds--pass on
		(setf (machash 'SYN newht) (realize-binds (machash 'RESULT 'SYN ht2) b2))
		newht)))))

(defun f-comp (ht1 ht2) 
  "forward composition"
  (and (complexp-hash (machash 'SYN ht1))
       (complexp-hash (machash 'SYN ht2))
       (forward-nf)
       (eql (machash 'DIR 'SYN ht1) 'FS)
       (eql (machash 'DIR 'SYN ht2) 'FS)
       (member (machash 'MODAL 'SYN ht1) '(ALL HARMONIC))
       (member (machash 'MODAL 'SYN ht2) '(ALL HARMONIC))
       (multiple-value-bind (match b1 b2)
	 (cat-match (machash 'ARG 'SYN ht1) (machash 'RESULT 'SYN ht2))
	 (and match (let ((newht (make-cky-entry-hashtable))
			  (newsyn (make-complex-cat-hashtable)))
		      (set-nf-tag newht *fc*)
		      (setf (machash 'SEM newht) (&b (machash 'SEM ht1) (machash 'SEM ht2)))
		      (setf (machash 'INDEX newht) 'C3) ; ht2 dir and modality projects
		      (setf (machash 'SYN newht) newsyn)
		      (setf (machash 'DIR 'SYN newht) (machash 'DIR 'SYN ht2))
		      (setf (machash 'MODAL 'SYN newht) (machash 'MODAL 'SYN ht2))
		      (setf (machash 'RESULT 'SYN newht)(realize-binds (machash 'RESULT 'SYN ht1) b1))
		      (setf (machash 'ARG 'SYN newht)(realize-binds (machash 'ARG 'SYN ht2) b2))
		      newht)))))

(defun b-comp (ht1 ht2) 
  "backward composition"
  (and (complexp-hash (machash 'SYN ht1))
       (complexp-hash (machash 'SYN ht2))
       (backward-nf)
       (eql (machash 'DIR 'SYN ht1) 'BS)
       (eql (machash 'DIR 'SYN ht2) 'BS)
       (member (machash 'MODAL 'SYN ht1) '(ALL HARMONIC))
       (member (machash 'MODAL 'SYN ht2) '(ALL HARMONIC))
       (multiple-value-bind (match b1 b2)
	 (cat-match (machash 'RESULT 'SYN ht1) (machash 'ARG 'SYN ht2))
	 (and match (let ((newht (make-cky-entry-hashtable))
			  (newsyn (make-complex-cat-hashtable)))
		      (set-nf-tag newht *bc*)
		      (setf (machash 'SEM newht) (&b (machash 'SEM ht2) (machash 'SEM ht1)))
		      (setf (machash 'INDEX newht) 'C4) ; ht1 dir and modality projects
		      (setf (machash 'SYN newht) newsyn)
		      (setf (machash 'DIR 'SYN newht) (machash 'DIR 'SYN ht1))
		      (setf (machash 'MODAL 'SYN newht) (machash 'MODAL 'SYN ht1))
		      (setf (machash 'RESULT 'SYN newht)(realize-binds (machash 'RESULT 'SYN ht2) b2))
		      (setf (machash 'ARG 'SYN newht)(realize-binds (machash 'ARG 'SYN ht1) b1))
		      newht)))))

(defun fx-comp (ht1 ht2) 
  "forward crossing composition"
  (and (complexp-hash (machash 'SYN ht1))
       (complexp-hash (machash 'SYN ht2))
       (forward-nf)
       (eql (machash 'DIR 'SYN ht1) 'FS)
       (eql (machash 'DIR 'SYN ht2) 'BS)
       (member (machash 'MODAL 'SYN ht1) '(ALL CROSS))
       (member (machash 'MODAL 'SYN ht2) '(ALL CROSS))
       (multiple-value-bind (match b1 b2)
	 (cat-match (machash 'ARG 'SYN ht1) (machash 'RESULT 'SYN ht2))
	 (and match (let ((newht (make-cky-entry-hashtable))
			  (newsyn (make-complex-cat-hashtable)))
		      (set-nf-tag newht *fc*)
		      (setf (machash 'SEM newht) (&b (machash 'SEM ht1) (machash 'SEM ht2)))
		      (setf (machash 'INDEX newht) 'C3) ; ht2 dir and modality projects
		      (setf (machash 'SYN newht) newsyn)
		      (setf (machash 'DIR 'SYN newht) (machash 'DIR 'SYN ht2))
		      (setf (machash 'MODAL 'SYN newht) (machash 'MODAL 'SYN ht2))
		      (setf (machash 'RESULT 'SYN newht)(realize-binds (machash 'RESULT 'SYN ht1) b1))
		      (setf (machash 'ARG 'SYN newht)(realize-binds (machash 'ARG 'SYN ht2) b2))
		      newht)))))

(defun bx-comp (ht1 ht2) 
  "backward crossing composition"
  (and (complexp-hash (machash 'SYN ht1))
       (complexp-hash (machash 'SYN ht2))
       (backward-nf)
       (eql (machash 'DIR 'SYN ht1) 'FS)
       (eql (machash 'DIR 'SYN ht2) 'BS)
       (member (machash 'MODAL 'SYN ht1) '(ALL CROSS))
       (member (machash 'MODAL 'SYN ht2) '(ALL CROSS))
       (multiple-value-bind (match b1 b2)
	 (cat-match (machash 'RESULT 'SYN ht1) (machash 'ARG 'SYN ht2))
	 (and match (let ((newht (make-cky-entry-hashtable))
			  (newsyn (make-complex-cat-hashtable)))
		      (set-nf-tag newht *bc*)
		      (setf (machash 'SEM newht) (&b (machash 'SEM ht2) (machash 'SEM ht1)))
		      (setf (machash 'INDEX newht) 'C4) ; ht1 dir and modality projects
		      (setf (machash 'SYN newht) newsyn)
		      (setf (machash 'DIR 'SYN newht) (machash 'DIR 'SYN ht1))
		      (setf (machash 'MODAL 'SYN newht) (machash 'MODAL 'SYN ht1))
		      (setf (machash 'RESULT 'SYN newht)(realize-binds (machash 'RESULT 'SYN ht2) b2))
		      (setf (machash 'ARG 'SYN newht)(realize-binds (machash 'ARG 'SYN ht1) b1))
		      newht)))))

(defun f2-comp (ht1 ht2) 
  ">B^2"
  (and (complexp-hash (machash 'SYN ht1))
       (complexp-hash (machash 'SYN ht2))
       (forward-nf)
       (eql (machash 'DIR 'SYN ht1) 'FS)
       (machash 'DIR 'RESULT 'SYN ht2) ; ht2 must have complex result
       (eql (machash 'DIR 'RESULT 'SYN ht2) 'FS)
       (member (machash 'MODAL 'SYN ht1) '(ALL HARMONIC))
       (member (machash 'MODAL 'RESULT 'SYN ht2) '(ALL HARMONIC))
       (multiple-value-bind (match b1 b2)
	 (cat-match (machash 'ARG 'SYN ht1) (machash 'RESULT 'RESULT 'SYN ht2))
	 (and match (let ((newht (make-cky-entry-hashtable))
			  (newsynx (make-complex-cat-hashtable))
			  (newsyn (make-complex-cat-hashtable)))
		      (set-nf-tag newht *fc*)
		      (setf (machash 'SEM newht) (&b2 (machash 'SEM ht1) (machash 'SEM ht2)))
		      (setf (machash 'INDEX newht) 'C3) ; ht2 dir and modality projects
		      (setf (machash 'SYN newht) newsyn)
		      (setf (machash 'DIR 'SYN newht) (machash 'DIR 'SYN ht2))
		      (setf (machash 'MODAL 'SYN newht) (machash 'MODAL 'SYN ht2))
		      (setf (machash 'ARG 'SYN newht)
			    (realize-binds (machash 'ARG 'SYN ht2) b2))
		      (setf (machash 'RESULT 'SYN newht) newsynx)
		      (setf (machash 'DIR 'RESULT 'SYN newht) 
			    (machash 'DIR 'RESULT 'SYN ht2))
		      (setf (machash 'MODAL 'RESULT 'SYN newht) 
			    (machash 'MODAL 'RESULT 'SYN ht2))
		      (setf (machash 'RESULT 'RESULT 'SYN newht)
			    (realize-binds (machash 'RESULT 'SYN ht1) b1))
		      (setf (machash 'ARG 'RESULT 'SYN newht)
			    (realize-binds (machash 'ARG 'RESULT 'SYN ht2) b2))
		      newht)))))

(defun b2-comp (ht1 ht2) 
  "<B^2"
  (and (complexp-hash (machash 'SYN ht1))
       (complexp-hash (machash 'SYN ht2))
       (backward-nf)
       (eql (machash 'DIR 'SYN ht2) 'BS)
       (machash 'DIR 'RESULT 'SYN ht1) ; ht1 must have complex result
       (eql (machash 'DIR 'RESULT 'SYN ht1) 'BS)
       (member (machash 'MODAL 'SYN ht2) '(ALL HARMONIC))
       (member (machash 'MODAL 'RESULT 'SYN ht1) '(ALL HARMONIC))
       (multiple-value-bind (match b1 b2)
	 (cat-match (machash 'RESULT 'RESULT 'SYN ht1)
	            (machash 'ARG 'SYN ht2))
	 (and match (let ((newht (make-cky-entry-hashtable))
			  (newsynx (make-complex-cat-hashtable))
			  (newsyn (make-complex-cat-hashtable)))
		      (set-nf-tag newht *bc*)
		      (setf (machash 'SEM newht) (&b2 (machash 'SEM ht2) (machash 'SEM ht1)))
		      (setf (machash 'INDEX newht) 'C4) ; ht1 dir and modality projects
		      (setf (machash 'SYN newht) newsyn)
		      (setf (machash 'DIR 'SYN newht) (machash 'DIR 'SYN ht1))
		      (setf (machash 'MODAL 'SYN newht) (machash 'MODAL 'SYN ht1))
		      (setf (machash 'ARG 'SYN newht)
			    (realize-binds (machash 'ARG 'SYN ht1) b1))
		      (setf (machash 'RESULT 'SYN newht) newsynx)
		      (setf (machash 'DIR 'RESULT 'SYN newht) 
			    (machash 'DIR 'RESULT 'SYN ht1))
		      (setf (machash 'MODAL 'RESULT 'SYN newht) 
			    (machash 'MODAL 'RESULT 'SYN ht1))
		      (setf (machash 'RESULT 'RESULT 'SYN newht)
			    (realize-binds (machash 'RESULT 'SYN ht2) b2))
		      (setf (machash 'ARG 'RESULT 'SYN newht)
			    (realize-binds (machash 'ARG 'RESULT 'SYN ht1) b1))
		      newht)))))

(defun fx2-comp (ht1 ht2) 
  ">Bx^2"
  (and (complexp-hash (machash 'SYN ht1))
       (complexp-hash (machash 'SYN ht2))
       (forward-nf)
       (eql (machash 'DIR 'SYN ht1) 'FS)
       (machash 'DIR 'RESULT 'SYN ht2) ; ht2 must have complex result
       (eql (machash 'DIR 'RESULT 'SYN ht2) 'BS)
       (member (machash 'MODAL 'SYN ht1) '(ALL CROSS))
       (member (machash 'MODAL 'RESULT 'SYN ht2) '(ALL CROSS))
       (multiple-value-bind (match b1 b2)
	 (cat-match (machash 'ARG 'SYN ht1) (machash 'RESULT 'RESULT 'SYN ht2))
	 (and match (let ((newht (make-cky-entry-hashtable))
			  (newsynx (make-complex-cat-hashtable))
			  (newsyn (make-complex-cat-hashtable)))
		      (set-nf-tag newht *fc*)
		      (setf (machash 'SEM newht) (&b2 (machash 'SEM ht1) (machash 'SEM ht2)))
		      (setf (machash 'INDEX newht) 'C3) ; ht2 dir and modality projects
		      (setf (machash 'SYN newht) newsyn)
		      (setf (machash 'DIR 'SYN newht) (machash 'DIR 'SYN ht2))
		      (setf (machash 'MODAL 'SYN newht) (machash 'MODAL 'SYN ht2))
		      (setf (machash 'ARG 'SYN newht)
			    (realize-binds (machash 'ARG 'SYN ht2) b2))
		      (setf (machash 'RESULT 'SYN newht) newsynx)
		      (setf (machash 'DIR 'RESULT 'SYN newht) 
			    (machash 'DIR 'RESULT 'SYN ht2))
		      (setf (machash 'MODAL 'RESULT 'SYN newht) 
			    (machash 'MODAL 'RESULT 'SYN ht2))
		      (setf (machash 'RESULT 'RESULT 'SYN newht)
			    (realize-binds (machash 'RESULT 'SYN ht1) b1))
		      (setf (machash 'ARG 'RESULT 'SYN newht)
			    (realize-binds (machash 'ARG 'RESULT 'SYN ht2) b2))
		      newht)))))

(defun bx2-comp (ht1 ht2) 
  "<Bx^2"
  (and (complexp-hash (machash 'SYN ht1))
       (complexp-hash (machash 'SYN ht2))
       (backward-nf)
       (eql (machash 'DIR 'SYN ht2) 'BS)
       (machash 'DIR 'RESULT 'SYN ht1) ; ht1 must have complex result
       (eql (machash 'DIR 'RESULT 'SYN ht1) 'FS)
       (member (machash 'MODAL 'SYN ht2) '(ALL CROSS))
       (member (machash 'MODAL 'RESULT 'SYN ht1) '(ALL CROSS))
       (multiple-value-bind (match b1 b2)
	 (cat-match (machash 'RESULT 'RESULT 'SYN ht1)
	            (machash 'ARG  'SYN ht2))
	 (and match (let ((newht (make-cky-entry-hashtable))
			  (newsynx (make-complex-cat-hashtable))
			  (newsyn (make-complex-cat-hashtable)))
		      (set-nf-tag newht *bc*)
		      (setf (machash 'SEM newht) (&b2 (machash 'SEM ht2) (machash 'SEM ht1)))
		      (setf (machash 'INDEX newht) 'C4) ; ht1 dir and modality projects
		      (setf (machash 'SYN newht) newsyn)
		      (setf (machash 'DIR 'SYN newht) (machash 'DIR 'SYN ht1))
		      (setf (machash 'MODAL 'SYN newht) (machash 'MODAL 'SYN ht1))
		      (setf (machash 'ARG 'SYN newht)
			    (realize-binds (machash 'ARG 'SYN ht1) b1))
		      (setf (machash 'RESULT 'SYN newht) newsynx)
		      (setf (machash 'DIR 'RESULT 'SYN newht) 
			    (machash 'DIR 'RESULT 'SYN ht1))
		      (setf (machash 'MODAL  'RESULT  'SYN newht) 
			    (machash 'MODAL 'RESULT 'SYN ht1))
		      (setf (machash 'RESULT 'RESULT 'SYN newht)
			    (realize-binds (machash 'RESULT 'SYN ht2) b2))
		      (setf (machash 'ARG 'RESULT 'SYN newht)
			    (realize-binds (machash 'ARG 'RESULT 'SYN ht1) b1))
		      newht)))))

(defun f3-comp (ht1 ht2) 
  ">B^3"
  (and (complexp-hash (machash 'SYN ht1))
       (complexp-hash (machash 'SYN ht2))
       (forward-nf)
       (eql (machash 'DIR 'SYN ht1) 'FS)
       (member (machash 'MODAL 'SYN ht1) '(ALL HARMONIC))
       (machash 'DIR 'RESULT 'SYN ht2) ; ht2 must have a really complex result
       (machash 'DIR 'RESULT 'RESULT 'SYN ht2)
       (eql (machash 'DIR 'RESULT 'RESULT 'SYN ht2) 'FS)
       (member (machash 'MODAL 'RESULT 'RESULT 'SYN ht2) '(ALL HARMONIC))
       (multiple-value-bind (match b1 b2)
	 (cat-match (machash 'ARG 'SYN ht1) 
		    (machash 'RESULT 'RESULT 'RESULT 'SYN ht2))
	 (and match (let ((newht (make-cky-entry-hashtable))
			  (newsyn1 (make-complex-cat-hashtable))
			  (newsyn2 (make-complex-cat-hashtable))
			  (newsyn3 (make-complex-cat-hashtable)))
		      (set-nf-tag newht *fc*)
		      (setf (machash 'SEM newht) (&b3 (machash 'SEM ht1) (machash 'SEM ht2)))
		      (setf (machash 'INDEX newht) 'C3) ; ht2 dir and modality projects
		      (setf (machash 'SYN newht) newsyn1)
		      (setf (machash 'DIR 'SYN newht) (machash 'DIR 'SYN ht2))
		      (setf (machash 'MODAL 'SYN newht) (machash 'MODAL 'SYN ht2))
		      (setf (machash 'ARG 'SYN newht)
			    (realize-binds (machash 'ARG 'SYN ht2) b2))
		      (setf (machash 'RESULT 'SYN newht) newsyn2)
		      (setf (machash 'DIR 'RESULT 'SYN newht) 
			    (machash 'DIR 'RESULT 'SYN ht2))
		      (setf (machash 'MODAL 'RESULT 'SYN newht) 
			    (machash 'MODAL 'RESULT 'SYN ht2))
		      (setf (machash 'ARG 'RESULT 'SYN newht)
			    (realize-binds (machash 'ARG 'RESULT 'SYN ht2) b2))
		      (setf (machash 'RESULT 'RESULT 'SYN newht) newsyn3)
		      (setf (machash 'RESULT 'RESULT 'RESULT 'SYN newht)
			    (realize-binds (machash 'RESULT 'SYN ht1) b1))
		      (setf (machash 'ARG 'RESULT 'RESULT 'SYN newht)
			    (realize-binds (machash 'ARG 'RESULT 'RESULT 'SYN ht2) b2))
		      (setf (machash 'DIR 'RESULT 'RESULT 'SYN newht)
			    (machash 'DIR 'RESULT 'RESULT 'SYN ht2))
		      (setf (machash 'MODAL 'RESULT 'RESULT 'SYN newht)
			    (machash 'MODAL 'RESULT 'RESULT 'SYN ht2))
		      newht)))))

(defun fx3-comp (ht1 ht2) 
  ">Bx^3"
  (and (complexp-hash (machash 'SYN ht1))
       (complexp-hash (machash 'SYN ht2))
       (forward-nf)
       (eql (machash 'DIR 'SYN ht1) 'FS)
       (member (machash 'MODAL 'SYN ht1) '(ALL CROSS))
       (machash 'DIR 'RESULT 'SYN ht2) ; ht2 must have a really complex result
       (machash 'DIR 'RESULT 'RESULT 'SYN ht2)
       (eql (machash 'DIR 'RESULT 'RESULT 'SYN ht2) 'BS)
       (member (machash 'MODAL 'RESULT 'RESULT 'SYN ht2) '(ALL CROSS))
       (multiple-value-bind (match b1 b2)
	 (cat-match (machash 'ARG 'SYN ht1) 
		    (machash 'RESULT 'RESULT 'RESULT 'SYN ht2))
	 (and match (let ((newht (make-cky-entry-hashtable))
			  (newsyn1 (make-complex-cat-hashtable))
			  (newsyn2 (make-complex-cat-hashtable))
			  (newsyn3 (make-complex-cat-hashtable)))
		      (set-nf-tag newht *fc*)
		      (setf (machash 'SEM newht) (&b3 (machash 'SEM ht1) (machash 'SEM ht2)))
		      (setf (machash 'INDEX newht) 'C3) ; ht2 dir and modality projects
		      (setf (machash 'SYN newht) newsyn1)
		      (setf (machash 'DIR 'SYN newht) (machash 'DIR 'SYN ht2))
		      (setf (machash 'MODAL 'SYN newht) (machash 'MODAL 'SYN ht2))
		      (setf (machash 'ARG 'SYN newht)
			    (realize-binds (machash 'ARG 'SYN ht2) b2))
		      (setf (machash 'RESULT 'SYN newht) newsyn2)
		      (setf (machash 'DIR 'RESULT 'SYN newht) 
			    (machash 'DIR 'RESULT 'SYN ht2))
		      (setf (machash 'MODAL 'RESULT 'SYN newht) 
			    (machash 'MODAL 'RESULT 'SYN ht2))
		      (setf (machash 'ARG 'RESULT 'SYN newht)
			    (realize-binds (machash 'ARG 'RESULT 'SYN ht2) b2))
		      (setf (machash 'RESULT 'RESULT 'SYN newht) newsyn3)
		      (setf (machash 'RESULT 'RESULT 'RESULT 'SYN newht)
			    (realize-binds (machash 'RESULT 'SYN ht1) b1))
		      (setf (machash 'ARG 'RESULT 'RESULT 'SYN newht)
			    (realize-binds (machash 'ARG 'RESULT 'RESULT 'SYN ht2) b2))
		      (setf (machash 'DIR 'RESULT 'RESULT 'SYN newht)
			    (machash 'DIR 'RESULT 'RESULT 'SYN ht2))
		      (setf (machash 'MODAL 'RESULT 'RESULT 'SYN newht)
			    (machash 'MODAL 'RESULT 'RESULT 'SYN ht2))
		      newht)))))

(defun b3-comp (ht1 ht2) 
  "<B^3"
  (and (complexp-hash (machash 'SYN ht1))
       (complexp-hash (machash 'SYN ht2))
       (backward-nf)
       (eql (machash 'DIR 'SYN ht2) 'BS)
       (member (machash 'MODAL 'SYN ht2) '(ALL HARMONIC))
       (machash 'DIR 'RESULT 'SYN ht1) ; ht1 must have a really complex result
       (machash 'DIR 'RESULT 'RESULT 'SYN ht1)
       (eql (machash 'DIR 'RESULT 'RESULT 'SYN ht1) 'BS)
       (member (machash 'MODAL 'RESULT 'RESULT 'SYN ht1) '(ALL HARMONIC))
       (multiple-value-bind (match b1 b2)
	 (cat-match (machash 'RESULT 'RESULT 'RESULT 'SYN ht1)
		    (machash 'ARG 'SYN ht2)) 
	 (and match (let ((newht (make-cky-entry-hashtable))
			  (newsyn1 (make-complex-cat-hashtable))
			  (newsyn2 (make-complex-cat-hashtable))
			  (newsyn3 (make-complex-cat-hashtable)))
		      (set-nf-tag newht *bc*)
		      (setf (machash 'SEM newht) (&b3 (machash 'SEM ht2) (machash 'SEM ht1)))
		      (setf (machash 'INDEX newht) 'C4) ; ht1 dir and modality projects
		      (setf (machash 'SYN newht) newsyn1)
		      (setf (machash 'DIR 'SYN newht) (machash 'DIR 'SYN ht1))
		      (setf (machash 'MODAL 'SYN newht) (machash 'MODAL 'SYN ht1))
		      (setf (machash 'ARG 'SYN newht)
			    (realize-binds (machash 'ARG 'SYN ht1) b1))
		      (setf (machash 'RESULT 'SYN newht) newsyn2)
		      (setf (machash 'DIR 'RESULT 'SYN newht) 
			    (machash 'DIR 'RESULT 'SYN ht1))
		      (setf (machash 'MODAL 'RESULT 'SYN newht) 
			    (machash 'MODAL 'RESULT 'SYN ht1))
		      (setf (machash 'ARG 'RESULT 'SYN newht)
			    (realize-binds (machash 'ARG 'RESULT 'SYN ht1) b1))
		      (setf (machash 'RESULT 'RESULT 'SYN newht) newsyn3)
		      (setf (machash 'RESULT 'RESULT 'RESULT 'SYN newht)
			    (realize-binds (machash 'RESULT 'SYN ht2) b2))
		      (setf (machash 'ARG 'RESULT 'RESULT 'SYN newht)
			    (realize-binds (machash 'ARG 'RESULT 'RESULT 'SYN ht1) b1))
		      (setf (machash 'DIR 'RESULT 'RESULT 'SYN newht)
			    (machash 'DIR 'RESULT 'RESULT 'SYN ht1))
		      (setf (machash 'MODAL 'RESULT 'RESULT 'SYN newht)
			    (machash 'MODAL 'RESULT 'RESULT 'SYN ht1))
		      newht)))))

(defun bx3-comp (ht1 ht2) 
  "<Bx^3"
  (and (complexp-hash (machash 'SYN ht1))
       (complexp-hash (machash 'SYN ht2))
       (backward-nf)
       (eql (machash 'DIR 'SYN ht2) 'BS)
       (member (machash 'MODAL 'SYN ht2) '(ALL CROSS))
       (machash 'DIR 'RESULT 'SYN ht1) ; ht1 must have a really complex result
       (machash 'DIR 'RESULT 'RESULT 'SYN ht1)
       (eql (machash 'DIR 'RESULT 'RESULT 'SYN ht1) 'FS)
       (member (machash 'MODAL 'RESULT 'RESULT 'SYN ht1) '(ALL CROSS))
       (multiple-value-bind (match b1 b2)
	 (cat-match (machash 'RESULT 'RESULT 'RESULT 'SYN ht1)
		    (machash 'ARG 'SYN ht2)) 
	 (and match (let ((newht (make-cky-entry-hashtable))
			  (newsyn1 (make-complex-cat-hashtable))
			  (newsyn2 (make-complex-cat-hashtable))
			  (newsyn3 (make-complex-cat-hashtable)))
		      (set-nf-tag newht *bc*)
		      (setf (machash 'SEM newht) (&b3 (machash 'SEM ht2) (machash 'SEM ht1)))
		      (setf (machash 'INDEX newht) 'C4) ; ht1 dir and modality projects
		      (setf (machash 'SYN newht) newsyn1)
		      (setf (machash 'DIR 'SYN newht) (machash 'DIR 'SYN ht1))
		      (setf (machash 'MODAL 'SYN newht) (machash 'MODAL 'SYN ht1))
		      (setf (machash 'ARG 'SYN newht)
			    (realize-binds (machash 'ARG 'SYN ht1) b1))
		      (setf (machash 'RESULT 'SYN newht) newsyn2)
		      (setf (machash 'DIR 'RESULT 'SYN newht) 
			    (machash 'DIR 'RESULT 'SYN ht1))
		      (setf (machash 'MODAL 'RESULT 'SYN newht) 
			    (machash 'MODAL 'RESULT 'SYN ht1))
		      (setf (machash 'ARG 'RESULT 'SYN newht)
			    (realize-binds (machash 'ARG 'RESULT 'SYN ht1) b1))
		      (setf (machash 'RESULT 'RESULT 'SYN newht) newsyn3)
		      (setf (machash 'RESULT 'RESULT 'RESULT 'SYN newht)
			    (realize-binds (machash 'RESULT 'SYN ht2) b2))
		      (setf (machash 'ARG 'RESULT 'RESULT 'SYN newht)
			    (realize-binds (machash 'ARG 'RESULT 'RESULT 'SYN ht1) b1))
		      (setf (machash 'DIR 'RESULT 'RESULT 'SYN newht)
			    (machash 'DIR 'RESULT 'RESULT 'SYN ht1))
		      (setf (machash 'MODAL 'RESULT 'RESULT 'SYN newht)
			    (machash 'MODAL 'RESULT 'RESULT 'SYN ht1))
		      newht)))))

(defun f-special (ht1 ht2)
  "@.. cats can only apply. We assume there is one unknown in such cats, and that all such cats are functors."
  (and (specialp-hash (machash 'SYN ht1))
       (forward-nf)
       (eql (machash 'DIR 'SYN ht1) 'FS)
       (not (specialp-hash (machash 'SYN ht2)))
       (let ((newht (make-cky-entry-hashtable)))
	 (set-nf-tag newht *ot*)
	 (setf (machash 'SEM newht) (&a (machash 'SEM ht1) (machash 'SEM ht2)))
	 (setf (machash 'INDEX newht) 'C1)
	 (setf (machash 'SYN newht)(substitute-special-cat   ; pass on a fresh copy for substtn
				     (machash 'RESULT 'SYN ht1)
				     (copy-hashtable (machash 'SYN ht2))))
         newht)))

(defun b-special (ht1 ht2)
  "@.. cats can only apply. We assume there is one unknown in such cats, and that all such cats are functors."
  (and (specialp-hash (machash 'SYN ht2))
       (backward-nf)
       (eql (machash 'DIR 'SYN ht2) 'BS)
       (not (specialp-hash (machash 'SYN ht1)))
       (let ((newht (make-cky-entry-hashtable)))
	 (set-nf-tag newht *ot*)
	 (setf (machash 'SEM newht) (&a (machash 'SEM ht2) (machash 'SEM ht1)))
	 (setf (machash 'INDEX newht) 'C2)
	 (setf (machash 'SYN newht)(substitute-special-cat   ; pass on a fresh copy for substtn
				     (machash 'RESULT 'SYN ht2)
				     (copy-hashtable (machash 'SYN ht1))))
         newht)))

(defun monad-combine (ht1 ht2 lex1 lex2 coord1 coord2)
  "Short-circuit evaluates rules one by one, to left term (ht1) and right term (ht2), which are hashtables.
  Returns the result as a hashtable.
  Note: we are procedurally neutral, i.e. given two cats, the other is uniquely determined
  if combinable (see Pareschi & steedman 1987). Therefore only one rule can succeed if
  lexical cats never use category variables (we don't do that). Eat your heart out, unifiers!!
  So we return immediately once a rule succeeds, because of this paradeterminism.
  The universal list of rules is from Bozsahin (2012) CL book, p117.
  NB: No type-raising or unary rule! They do not combine.
  Global switches give the model developer complete control over rule application.
  Set its switch to nil if you dont want that rule.  By default all rules are on.
  x-special are for application only. So they use their switches.
  Coord1 and coord2 are string coordinates of ht1 and ht2, which are only relevant for singletons and x-apply.
  They are (x y) pairs where x is length and y is starting position in string.
  The input is available globally, in *cky-input*.
  Reminder to code developers: every combination creates a new CKY hashtable entry, and as many
  complex result hashtables as there are slashes in the result."
  (cond ((and (basicp-hash (machash 'SYN ht1))
	      (basicp-hash (machash 'SYN ht2)))  ; both are basic cats, a non-combinable case
	 (return-from monad-combine nil))
	((and (complexp-hash ht1)
	      (complexp-hash ht2)
	      (eql (machash 'DIR 'SYN ht1) 'BS)
	      (eql (machash 'DIR 'SYN ht2) 'FS)) ; the only functional case which no rule can combine 
	 (return-from monad-combine nil))
	)
  (or (and *a-apply* (a-apply ht1 ht2 lex2 coord2)) ; application -- the only relevant case for lex slash
      (and *t-apply* (t-apply ht1 ht2 lex1 coord1))
      (and *f-comp* (f-comp ht1 ht2))           ; composition
      (and *b-comp* (b-comp ht1 ht2))
                                                ; <Bx and >Bx cannot be short-circuited if X=Z in X/Y Y\Z
      (and (or *fx-comp* *bx-comp*) (multiple-value-bind (s1 s2) (values (and *fx-comp* (fx-comp ht1 ht2))
									 (and *bx-comp* (bx-comp ht1 ht2)))
				      (if s1    ; short-circuit if at least one succeeds -- pass the succesful one first for 'and'
					(return-from monad-combine (values s1 s2))
					(if s2 
					  (return-from monad-combine (values s2 s1))
					  nil))))

      (and *f2-comp* (f2-comp ht1 ht2))         ; B^2
      (and *b2-comp* (b2-comp ht1 ht2))
      (and *fx2-comp* (fx2-comp ht1 ht2))
      (and *bx2-comp* (bx2-comp ht1 ht2))
      (and *f3-comp* (f3-comp ht1 ht2))         ; B^3
      (and *b3-comp* (b3-comp ht1 ht2))
      (and *fx3-comp* (fx3-comp ht1 ht2))
      (and *bx3-comp* (bx3-comp ht1 ht2))
      (and *a-apply* (f-special ht1 ht2))       ; application only special cats @X, @Y ...
      (and *t-apply* (b-special ht1 ht2))))

(defun apply-unary-rules (i j m lexp)
  "applies all the unary rules to the result in CKY cell i j k, where k=1,...m.
  Creates more types of same length in the cell i j starting with m+1.
  NB. A later rule can see results of earlier rules; the loop goes up to r, not m.
  The semantics of lexical rule is application of its 'outsem to lf of current cell.
  Hence lf 'insem is syntactic sugar, a recipe to write lfs of lexical rules compositionally."
  (cond ((or (null (machash (list i j 1) *cky-hashtable*)) (null *lex-rules-table*))
	 (return-from apply-unary-rules nil))
	(t (let ((r m))
	     (dolist (lr *lex-rules-table*) ; i use lexical rules as synonymous with unary rules
	       (loop for k from 1 to r do
		     (multiple-value-bind (match b1 b2)
		       (cat-match (machash 'SYN (nv-list-val 'SOLUTION (machash (list i j k) *cky-hashtable*)))
				  (machash 'INSYN lr))
		       (use-value b1) ; dummy use of b1; cannot be skipped because of (values)
		       (and match	   
			    (setf r (+ r 1))
			    (let ((newht (make-cky-entry-hashtable))
				  (nlr (copy-hashtable (machash 'OUTSYN lr))))
			      (set-nf-tag newht *ot*)
			      (setf (machash 'SEM newht)      
				    (&a (machash 'OUTSEM lr)
					(machash 'SEM (nv-list-val 'SOLUTION 
								   (machash (list i j k) *cky-hashtable*)))))
			      (setf (machash 'PARAM newht) (f-param-inner-prod 
							     (machash 'PARAM lr)
							     (machash 'PARAM (nv-list-val 'SOLUTION
							       (machash (list i j k) *cky-hashtable*)))))
			      (setf (machash 'INDEX newht) (machash 'INDEX lr))
			      (setf (machash 'KEY newht) (machash 'KEY lr))
			      (setf (machash 'SYN newht) (realize-binds nlr b2))
			      (if lexp   ; slightly less consing this way -- lexical rules on lex item is also lexical, otherwise not
                                  (setf (machash (list i j r) *cky-hashtable*)
					(list 
					  (list 'LEFT (list i j k))
					  (list 'RIGHT (list i j k))
					  (list 'SOLUTION newht)
					  (list 'LEX t)))
			          (setf (machash (list i j r) *cky-hashtable*)
					(list 
					  (list 'LEFT (list i j k))
					  (list 'RIGHT (list i j k))
					  (list 'SOLUTION newht))))))))))))
  t)

(defun cky_analyze0 (itemslist)
  "CKY-parses the items in the input list.
  The lower-triangular matrix of CKY is built as a hashtable
  where keys are triplets (i j k), meaning combinations of length i,
  starting with position j, yielding reading k."
  (cond ((listp itemslist)
	 ;(format t "Input: ~{~A~^ ~}~%" itemslist)
	 (clrhash *cky-hashtable*)
	 (clrhash *cky-lf-hashtable*)
	 (setf *cky-lf* nil)(setf *cky-argmax-lf* nil)
	 (setf *cky-argmax-lf-max* nil)(setf *cky-max* nil)
	 (let ((n (length itemslist))
	       (a 0))  ; number of readings per CKY cell
	   (loop for i from 1 to n do  ; lexical loop for picking all eligible lex items
		 (let* ((matches (get-gram-items (nth (- i 1) itemslist)))
			(n2 (length matches)))
		   (cond  ((eql n2 0)
			   (if *oovp* 
			     (progn
			       (setf matches (make-dummy-lex-entries (nth (- i 1) itemslist)))
			       (dolist (entry matches) (push entry *current-grammar*))
			       (setf n2 (length matches)))
			     (progn 
			       (format t "~%OOV error: no grammar entry for ~A! Exiting without analysis.~%" (nth (- i 1) itemslist))
			       (return-from cky_analyze0 nil)))))
		   (loop for i2 from 1 to n2 do
			 (setf (machash (list 1 i i2) *cky-hashtable*) 
			       (list (list 'LEFT (list 1 i i2))
				     (list 'RIGHT (list 1 i i2))
				     (list 'SOLUTION (hash-lex (nth (- i2 1) matches)))
				     (list 'LEX t))))
                   (apply-unary-rules 1 i n2 t))) 
	   (setf *cky-input* itemslist)
	   (loop for i from 2 to n do ; i j k are CKY loops
             (loop for j from 1 to (+ (- n i) 1) do
	       (setf a 0) 
	       (loop for k from 1 to (- i 1) do
	         (do ((p 1 (+ p 1)))  ; p q loop over multiple readings in cky slots
		     ((not (machash (list k j p) *cky-hashtable*)))
		     (do ((q 1 (+ q 1)))
		         ((not (machash (list (- i k) (+ j k) q) *cky-hashtable*)))
                         (multiple-value-bind (r1 r2) (monad-combine 
                                 (nv-list-val 'SOLUTION (machash (list k j p) *cky-hashtable*))
				 (nv-list-val 'SOLUTION (machash (list (- i k) (+ j k) q) *cky-hashtable*))
				 (nv-list-val 'LEX (machash (list k j p) *cky-hashtable*))
				 (nv-list-val 'LEX (machash (list (- i k) (+ j k) q) *cky-hashtable*))
				 (list k j)             ; pass the string coordinates too, for singletons
				 (list (- i k) (+ j k))) ;  length and position only
			   (dolist (result (list r1 r2)) ; multiple solutions may come from <Bx/>Bx and <S2x/>S2x pairs
			     (and result 
				  (setf (machash 'PARAM result)  ; calculate inner product on the fly
					(f-param-inner-prod 
					  (machash 'PARAM 
						   (nv-list-val 'SOLUTION 
								(machash (list k j p) *cky-hashtable*)))
					  (machash 'PARAM 
						   (nv-list-val 'SOLUTION (machash (list (- i k) (+ j k) q)
										   *cky-hashtable*)))))
				  (setf a (+ a 1))
				  (setf (machash (list i j a) *cky-hashtable*)
					(if (machash 'LEX result)  ; if result is lexical, this is marked in its hashtable, pass it on to cky
					  (list (list 'LEFT (list k j p))
						(list 'RIGHT (list (- i k) (+ j k) q))
						(list 'LEX t)
						(list 'SOLUTION result))
					  (list (list 'LEFT (list k j p))
						(list 'RIGHT (list (- i k) (+ j k) q))
						(list 'SOLUTION result))))) ; first result's code ends
			     ))   
			 )))
	       (apply-unary-rules i j a nil)))
	   (and (machash (list n 1 1) *cky-hashtable*) t)))  ; if a rule applied, result would be in n 1 1 
	(t (format t "Error: expected a list of items.~%"))))

(defun cky_analyze (itemslist)
  "the python interface. Input length will be saved in *cky-input* for d command."
  (cky_analyze0 itemslist)
  (format t "~%Number of analyses: ~A~%"
	  (do ((m 1 (incf m))
	       (row (length itemslist)))
	    ((null (machash (list row 1 m) *cky-hashtable*)) (- m 1))))
  t)
   

;;;; =============================================================================
;;;; == Part 3: The CKY parse ranker -- the inductive component         ==
;;;; =============================================================================


(defun cky-find-argmax-lf ()
  "finds the most likely LF for the currently parsed input, and its most probable derivation.
   NB. LF equivalence is checked by Lisp's #'equal predicate for the hashtable.
   We don't use exp function because the denominator in formula (2) of the manual is same,
   we are maximizing, and e^x > e^y iff x > y."
   (setf *cky-lf* nil)
   (setf *cky-argmax-lf* nil)
   (setf *cky-argmax-lf-max* nil)
   (setf *cky-lf-hashtable-sum* 0.0)
   (let ((lfmax most-negative-single-float))
     (maphash #'(lambda (lf info)
	      (progn
	        (setf *cky-lf-hashtable-sum* (+ *cky-lf-hashtable-sum* (first info)))
		(cond ((>= (first info) lfmax)
		       (setf lfmax (first info))
		       (setf *cky-lf* (list (first info) lf))
		       (setf *cky-argmax-lf* (second info)))))) ; keep first as list, then find max. prob in it
	      *cky-lf-hashtable*))
   (let ((lfmax most-negative-single-float)
         (maxcell nil))
     (dolist (cell *cky-argmax-lf*)
       (cond ((> (machash 'PARAM (nv-list-val 'SOLUTION (machash cell *cky-hashtable*))) lfmax)
              (setf lfmax (machash 'PARAM (nv-list-val 'SOLUTION (machash cell *cky-hashtable*))))
	      (setf maxcell cell))))
     (setf *cky-argmax-lf-max* maxcell)))

(defun add-to-cky-lf-sum (cell)
  "adds the inner product for LF in cell to the lf hashtable."
  (let ((lf (beta-normalize-outer (cky-sem cell))) 
	(flag t)) ; to avoid double counts because of non-equalp but beta-equalp terms 
    (maphash #'(lambda (savedlf val)  ; savedlf s are beta-normalized
		 (declare (ignore val))
		 (cond ((alpha-equivalent lf savedlf)
			(setf flag nil)
			(setf (machash savedlf *cky-lf-hashtable*)
			      (list (+ (first (machash savedlf *cky-lf-hashtable*))
				       (machash 'PARAM (nv-list-val 'SOLUTION (machash cell *cky-hashtable*))))
				    (cons cell (second (machash savedlf *cky-lf-hashtable*))))))))
	     *cky-lf-hashtable*)
    (and flag (setf (machash lf *cky-lf-hashtable*)
		    (list (machash 'PARAM (nv-list-val 'SOLUTION (machash cell *cky-hashtable*)))
			  (list cell))))))

(defun cky-show-probs (cell)
  "to show a derivation with its counts"
  (cond ((null (machash cell *cky-hashtable*)) 
	 (format t "~%No such parse! (cky-show-probs)")
	 (return-from cky-show-probs ""))
	(t (let* ((solution (nv-list-val 'SOLUTION (machash cell *cky-hashtable*)))
		  (l (nv-list-val 'LEFT (machash cell *cky-hashtable*)))
		  (r (nv-list-val 'RIGHT (machash cell *cky-hashtable*)))
		  (lf (machash 'SEM solution))
		  (pr (machash 'PARAM solution))
		  (ix (machash 'INDEX solution))
	          (inputs (concatenate 'string
			      (write-to-string (input-range (cell-len l)(cell-pos l)))
			      (write-to-string (input-range (cell-len r)(cell-pos r)))))
	          (syn (linearize-syn (machash 'SYN solution))))
	     (cond ((equal l r)   ; we've reached a lexical cell 
		    (cond ((> (cell-len l) 1)
			   (format t (cky-show-probs l)))) ; it may be a lex rule applying to a phrase
		    (if *lambdaflag* 
		      (format nil "~%~5,,,a~7,,,F~14T~A :: ~A~%        : ~A" ix pr (input-range (cell-len l)(cell-pos l)) syn lf)
		      (format nil "~%~5,,,a~7,,,F~14T~A :: ~A" ix pr (input-range (cell-len l)(cell-pos l)) syn)))
		   (t (concatenate 'string 
				   (cky-show-probs l)
				   (cky-show-probs r)
				   (if *lambdaflag* 
				     (format nil "~%~5,,,a~7,,,F~14T~A :: ~A~%        : ~A" ix pr inputs syn lf)
				     (format nil "~%~5,,,a~7,,,F~14T~A :: ~A" ix pr inputs syn)))))))))

(defun lex-rule-param (key)
  "return the parameter of the lex rule with <key>"
  (dolist (lr *lex-rules-table*)
    (cond ((equal key (machash 'KEY lr))
	   (return-from lex-rule-param (machash 'PARAM lr)))))
  (format t "~%Error! no such relational rule: ~A" key))

(defun lex-rule-p (key)
  "returns true if key is the key of a lex rule, nil otherwise."
  (and key (dolist (lr *lex-rules-table*)
	     (cond ((eql key (machash 'KEY lr))
		    (return-from lex-rule-p t)))))
  nil)

(defun approximate-lr-use (cell in-cell subtotal lr-param)
  "since we don't have access to lex items fed into lr rule in dynamic programming, we approximate
  relative to their weighted sum by looking at finite history of cell."
  (cond ((eql (cell-len cell) 1)(+ subtotal lr-param))
	;; if cell is larger than lex cell, check the child cells only but not grandchildren
	(t (let ((lchild-par 
		   (machash 'PARAM (nv-list-val 'SOLUTION (machash (nv-list-val 'LEFT (machash in-cell *cky-hashtable*))
				                           *cky-hashtable*))))
                 (rchild-par 
		   (machash 'PARAM (nv-list-val 'SOLUTION (machash (nv-list-val 'RIGHT (machash in-cell *cky-hashtable*))
				                           *cky-hashtable*)))))
	     (+ subtotal lr-param (* (cell-len cell)(/ (+ (max lchild-par rchild-par) 
							  (/ subtotal (cell-len cell))) 
						       subtotal)))))))

(defun sum-inner-product (cell &optional (sum 0.0))
  "local counts are in constituents cells leading to the derivation in <cell>"
  (cond ((null (machash cell *cky-hashtable*)) 
	 (format t "~%No such parse! (sum-inner-product)")
	 (return-from sum-inner-product sum))
	(t (let  ((l (nv-list-val 'LEFT (machash cell *cky-hashtable*)))
		  (r (nv-list-val 'RIGHT (machash cell *cky-hashtable*)))
		  (cell-key (machash 'KEY (nv-list-val 'SOLUTION (machash cell *cky-hashtable*)))))
	     (cond ((equal l r) 
	            (cond ((lex-rule-p cell-key)  
			   (approximate-lr-use cell l (machash 'PARAM (nv-list-val 'SOLUTION (machash l *cky-hashtable*)))
					       (lex-rule-param cell-key)))
			  (t (+ sum (machash 'PARAM (nv-list-val 'SOLUTION 
		                        (machash l *cky-hashtable*)))))))   ; we've reached a lexical cell 
		   (t (+ sum (sum-inner-product l (machash 'PARAM 
				        (nv-list-val 'SOLUTION (machash l *cky-hashtable*))))
                             (sum-inner-product r (machash 'PARAM 
				        (nv-list-val 'SOLUTION (machash r *cky-hashtable*)))))))))))

(defun cky-pprint-probs (cell)
  (format t (cky-show-probs cell)))

(defun cky_show_ranking ()
  (format t "~%Most likely l-command for the input: ~A~2%  ~A =~%  ~A~2%Cumulative weight:  ~A" *cky-input* 
	  (second *cky-lf*)(display-lf (beta-normalize-outer (second *cky-lf*)))
	  (first *cky-lf*))
  (format t "~2%Most probable analysis for it: ~A~%--------------------------------" *cky-argmax-lf-max*)
  (format t (cky-show-probs *cky-argmax-lf-max*))
  (format t "~2%Final l-command, normal-order evaluated: ~2%    ~A =~%    ~A~%" (beta-normalize-outer (cky-sem *cky-argmax-lf-max*))
	  (display-lf (beta-normalize-outer (cky-sem *cky-argmax-lf-max*))))
  (format t "~2%Most weighted analysis : ~A" *cky-max*)
  (format t  "~%--------------------------")
  (format t (cky-show-probs *cky-max*))
  (format t "~2&Final l-command, normal-order evaluated: ~2%    ~A =~%    ~A" 
	  (beta-normalize-outer (cky-sem *cky-max*))
	  (display-lf (beta-normalize-outer (cky-sem *cky-max*))))
  t)

(defun cky_show_ranking_bare ()
  "useful if you are going to compare it with gold pairings. Square brackets are there to avoid excessive Lisp parenths."
  (format t "[ ~A ~A ]~%" *cky-input* (second *cky-lf*))
  t)

;;;; =============================================================================
;;;; == Part 4: the modeling component                                          ==
;;;; =============================================================================

;; Please read the opening comments in the beginning of this file and the manual about this component.
;; Standard workflow is that of section 2 of Z&C'05.
;; We recommend you write modeling code as add-on, rather than plugging it in here.
;; NB the manual for a suggested workflow.

(mydef *bign* 0) ; N in Z&C05 -- number of iterations over training data
(mydef *supervision-pairs-list* nil) ; set of (Si Li) pairs
(mydef *smalln* 0) ; size of (Si,Li).  n in Z&C05 -- number of supervision data
(mydef *n-paramaters* 0) ; size of training grammar (which is the number of parameters)
(mydef *alpha0* 1.0)       ; alpha_0 of Z&C05 - learning rate parameter
(mydef *c* 1.0)            ; c of Z&C05       - learning rate parameter
(mydef *training-hashtable* nil); parameter vector x partial derivative hash table, for training
(mydef *training-hashtable-x4* nil); for extrapolation from 4 runs over training data
(mydef *training-non0-hashtable* nil); parameter vector and current nonzero counts

(defun extrapolate-parameters ()
  "runs over every parameter trained 4 times---input val is a 4-item dotted lists of (param . derivative), 
  and extrapolates a limit in the fifth column."
  (maphash #'(lambda (key val)
	       (let ((p1 (first val))
		     (p2 (second val))
		     (p3 (third val))
		     (p4 (fourth val)))
		 (setf (machash key *training-hashtable-x4*) (append val (list (cabay-jackson p1 p2 p3 p4))))))
	   *training-hashtable-x4*))

(defun load-supervision (sname)
  (let ((supname sname))
    (with-open-file (s supname  :direction :input :if-does-not-exist :error) 
      (setf *supervision-pairs-list* (read s)))
    (format t "~%Supervision file loaded: ~A~%" supname))
  (dolist (s-lf *supervision-pairs-list*)
    (cond ((not (beta-normalize-outer (sup-lf s-lf))) 
	   (format t "~%Warning! This expression/l-command pair has unnormalizable l-command, and may give unexpected stats :~% ~a"
		   s-lf)))))

(defun count-local-structure (resultcell)
  "using the lexical counts, it does the (counts x parameters) scalar multiplication dynamic programming style.
  If you override this definition too, make sure you return non-nil."
  (setf (machash 'PARAM (nv-list-val 'SOLUTION (machash resultcell *cky-hashtable*)))
	 (sum-inner-product resultcell))
  t)

(defun plugin-count-more-substructure (&optional resultcell)
  "Override this definition if you want to count more substructure in a derivational
  history recorded in the result CKY cell <resultcell>. It must return non-nil.
  Currently it does nothing.
  Suggestion: do the override by defining function of same name in your lisp code.
  Suggestion 2: make it additive so that you dont lose lexical weighted counts in resultcell."
  t)

(defun count-feature (key cell &optional (sum 0.0) (flag nil) (lc 0))
  "if the feature/lex item with key is used, return the total count in the derivation, dynamic programming style.
  We cannot use string identity of lex items here because of ambiguity--we need the key of lex item, which is unique.
  The flag is to count multiple occurences of lex rules."
  (cond ((null (machash cell *cky-hashtable*)) 
	 (format t "~%No such parse! count-feature")
	 (return-from count-feature 0.0))
	(t (let  ((l (nv-list-val 'LEFT (machash cell *cky-hashtable*)))
		  (r (nv-list-val 'RIGHT (machash cell *cky-hashtable*))))
	     (cond ((equal l r)   ; we've reached a lexical cell. NB: lex rules' keys are saved in hashtable
		    (cond ((lex-rule-p (machash 'KEY (nv-list-val 'SOLUTION (machash cell *cky-hashtable*))))
			   (if (equal key (machash 'KEY (nv-list-val 'SOLUTION (machash cell *cky-hashtable*))))
			     (count-feature key l sum t (+ lc 1)) 
			     (count-feature key l (+ 1 sum) flag lc)))
			  (t (cond ((equal key (machash 'KEY (nv-list-val 'SOLUTION (machash l *cky-hashtable*))))
				    (+ 1 sum))
				   (flag (/ lc 2.0))  ; counted twice because l and r are same
				   (t 0.0)))))
		   (t (+ (count-feature key l (+ 1 sum) flag lc)
                         (count-feature key r (+ 1 sum) flag lc))))))))

(defun cky_rank (itemslist)
  "Computes formulas (1) and argmax_L of Zettlemoyer & Collins (2005).
  We don't exponentiate (1) to avoid overflows, since sum is the same for argmax_L.
  cky_analyze0 calculates local sums using CKY. This function simply sums them."
  (and (not (listp itemslist))(format t "Expected a list!")(return-from cky_rank nil))
  (let ((n (length itemslist)))
    (and (cky_analyze0 itemslist) ; this creates the CKY table with its local counts
	 (do ((maxprob most-negative-single-float)
	      (minprob most-positive-single-float)
	      (cmax 0)
	      (k 1 (+ k 1)))
	   ((null (machash (list n 1 k) *cky-hashtable*))
	    (setf *cky-max* (list n 1 cmax)) ; we will use next 4 information to set the beam later
	    (setf *cky-nparses* (- k 1))
	    t)
	   (count-local-structure (list n 1 k)) ;update sum for results only
	   (plugin-count-more-substructure (list n 1 k))      ; this is a plug-in to count more substructure
	   (add-to-cky-lf-sum (list n 1 k))
	   (let ((param (machash 'PARAM (nv-list-val 'SOLUTION (machash (list n 1 k) *cky-hashtable*)))))
	     (if (> param maxprob)
	       (progn 
		 (setf maxprob param)
		 (setf cmax k)))
	     (if (< param minprob)
	       (setf minprob param))))
	 (cky-find-argmax-lf)
	 ))
  t)

(defun set-training-parameters (bign smalln nparams alpha0 c &optional (x4 nil)) 
  "The parameters of the workflow of Z&C 05 for model parameter estimation. 
  Also initializes the paramaters from .ind, and the derivative."
  (setf *bign* bign)
  (setf *smalln* smalln)
  (setf *n-paramaters* nparams)
  (setf *alpha0* alpha0)     
  (setf *c* c)
  (setf *training-hashtable* (make-training-hashtable nparams))
  (if x4 (setf *training-hashtable-x4* (make-training-hashtable nparams))) ; this one needed if we extrapolate
  (setf *training-non0-hashtable* (make-training-hashtable smalln)) ; for inside-outside
  (dolist (l *current-grammar*)(mk-train-entry (nv-list-val 'KEY l) (nv-list-val 'PARAM l) 0.0))
  t)

(defun estimate-parameters (k i)
  "the inner loop of Z&C's gradient ascent after the derivative is calculated."
  (maphash #'(lambda (key val)
	       (declare (ignore key))
	       (put-param val (+ (get-param val)
				 (/ (* *alpha0* (get-derivative val))
				       (+ 1 (* *c* (+ i (* k *smalln*))))))))
	   *training-hashtable*))

(defun pprint-hashtable (ht)
  (format t "~%=========~%Hash Table: key val")
  (maphash #'(lambda (k v)(format t "~%~a  ~a" k v)) ht))

(defun update-derivative (key in-sum all-sum li-sum all-li-sum verbose debug)
  (and debug (format t "~%Update derivative: ~A~%" (list key in-sum all-sum li-sum all-li-sum)))
  (cond ((eql in-sum 0.0) (setf in-sum 1.0))) ; penalize badly if no corr soln but avoid DBZ.(li-sum==0 anyway)
  (cond ((eql all-sum 0.0) (setf all-sum 1.0))) ; penalize badly if no corr soln but avoid DBZ.(all-li-sum==0 anyway)
  (put-derivative key (- (/ li-sum in-sum)  ; li-sums are f_je^p+... , in-sums are e^p+... 
			                    ; we get probabilities by dividing, formula (2) style
					    ; and gradient by difference, as in formula (5) in the manual.
			 (/ all-li-sum all-sum)))
  (and verbose (pprint-hashtable *training-hashtable*)))

(defun make-sorted-solutions (r1 r2)
  "Creates a list of lists whose first el is analysis no  (3rd item of result cell r1 r2 r3) and second el is cell parameter; 
  returns sorted list"
  (let ((solutions nil))
    (do* ((r3 1 (+ r3 1)))
      ((null (machash (list r1 r2 r3) *cky-hashtable*))) ; loop for every solution 
      (push (list  r3 (get-cell-param (list r1 r2 r3))) solutions))
    (if t (sort solutions #'> :key #'second) solutions)))

(defun inside-outside ()
  "inside-outside algorithm to find non zero counts--all others considered 0. Go as much as beam"
  (clrhash *training-non0-hashtable*) ; clear counts
  (let ((pairindex 0))
    (dolist (s-lf *supervision-pairs-list*)
      (incf pairindex)
      (let* ((s (cky_rank (sup-sentence s-lf)))
	     (b (and s *beamp* (beamer))) ;sets  beam parameter -- reduce more for more parses
	     (r1 (cell-len *cky-max*))
	     (r2 (cell-pos *cky-max*))
	     (solutions (make-sorted-solutions r1 r2)) 
	     (keylist nil))
	(declare (ignore b))
	(block analyses
	       (maphash #'(lambda (key val) ; the table was prepared by set-training-parameters
			    (declare (ignore val))
			    (block analyses2
				   (let ((cnt 1))
				     (dolist 
				       (solution solutions)
				       (and *beamp* (> cnt *beam*) (return-from analyses)) ; stop
				       (incf cnt)
				       (if (> (count-feature key (list r1 r2 (first solution))) 0.0) 
					 (progn 
					   (push key keylist)
					   (return-from analyses2)))))))  ; finding the item in one result is enough; derivative will calculate sums
			*training-hashtable*))
	(setf (machash pairindex *training-non0-hashtable*) keylist)))))

(defun prepare-solutions (debug)
  "after parses for current training pair are found, this function finds the nonzero counts in them,
  and places only those in the non0 training table. If beam is on, it creates a sorted list of solutions"
  (and *beamp* (beamer)) ;sets  beam parameter -- reduce more for more parses
  (let ((r1 (cell-len *cky-max*))
	(r2 (cell-pos *cky-max*)))
    (setf *training-sorted-solutions-list* (make-sorted-solutions r1 r2)) ;do before in-out for beam effect on both find-derivative and in-out
    (and debug (format t "~%Number of sorted solutions = ~A" (length *training-sorted-solutions-list*)))))

(defun find-derivative-of-log-likelihood (s-lf pairindex verbose debug)
  "given (Si Li) pair find the partial derivative of log likelihood.
  This is the probabilistic variant of the inside-outside algorithm, where training-hashtable keeps all weights.
  What we get is f_je^param1+f_j^param2...-f_je^param+f_je^param counts first.
  Then update-derivative turns them into probabilities by dividing into sums."
  (let* ((result (cky_rank (sup-sentence s-lf)))   ; get all analyses. we will filter later (ie No Normal form parsing)
	 (lf (and result (beta-normalize-outer (sup-lf s-lf))))
	 (s (and result (prepare-solutions debug))) ; sets beam, and produces *training-sorted-solutions-list*
	 (nonzerokeys (machash pairindex *training-non0-hashtable*)) ; table was set by inside-outside
	 (r1 (cell-len *cky-max*))
	 (r2 (cell-pos *cky-max*)))
    (declare (ignore s))
    (cond (result
	    (dolist (key nonzerokeys)
	      (let ((in-sum 0.0)
		    (all-sum 0.0)
		    (li-sum 0.0)
		    (all-li-sum 0.0)
		    (cnt 1))
		(block analyses
		       (dolist 
			 (analysis-param *training-sorted-solutions-list*)
			 (and *beamp* (> cnt *beam*) (return-from analyses)) ; stop
			 (incf cnt)
			 (let* ((term-cell (second analysis-param)) ; already fetched by make-sorted-solutions
				(term-c (count-feature key (list r1 r2 (first analysis-param)))) ; this one needs CKY access
				(term-e (exp term-cell)) ; get e^param but not divide by sum until found-- see update-derivative
				(term (* term-c term-e))
				(cell-lf (beta-normalize-outer (cky-sem (list r1 r2 (first analysis-param)))))) ; this needs CKY access too
			   (and debug (format t "~&Find derivative: ~A~%" 
					      (list key term-c term-e term r1 r2 (first analysis-param) *cky-nparses*)))
			   (cond ((alpha-equivalent lf cell-lf)
				  (setf in-sum (+ in-sum term-e))
				  (setf all-sum (+ all-sum term-e))
				  (setf li-sum (+ li-sum term))
				  (setf all-li-sum (+ all-li-sum term)))
				 (t 
				   (setf all-sum (+ all-sum term-e))
				   (setf all-li-sum (+ all-li-sum term)))))))
		(update-derivative key in-sum all-sum li-sum all-li-sum verbose debug))))
	  (t (format t "~%*** Unparsable training data! ~A~%Either fix or eliminate the pair from training set~%" s-lf)))))

(defun record-pass ()
  "current value of the parameters in training is attached as the end value of the same key in the list for extrapolation."
  (maphash #'(lambda (key val)
	       (setf (machash key *training-hashtable-x4*)
		     (append (machash key *training-hashtable-x4*) (list (get-param val)))))
	   *training-hashtable*))

(defun stochastic-gradient-ascent (verbose debug &optional (x4 nil)) ; this is done per Li, Si, hence it is stochastic
  "record the pass if extrapolation method is used. This argument is new and assumed false for old methods."
  (loop for k from 0 to (- *bign* 1) do 
	(loop for i from 1 to *smalln* do
	      (and debug (format t "~%---------------------------------~%Iteration k i= ~A  ~A~%" k i))
	      (find-derivative-of-log-likelihood (elt *supervision-pairs-list* (- i 1)) i verbose debug)
	      (estimate-parameters k i))
	(if x4 (record-pass))))

(defun update-model (pname sname iterations alpha0 c &key (verbose nil)(load t) (debug nil))
  "default workflow for updating model parameters of a project. Compare and save are separate."
  (beam-value) ;; in case you want to abort a misguided looong training asap
  (and load (load_bin pname)) ; loads directly into *current-grammar*
  (and load (load-supervision sname)) ; (Si Li) pairs loaded into *supervision-pairs-list*
  (set-training-parameters iterations (length *supervision-pairs-list*)(length *current-grammar*) alpha0 c)
  (inside-outside) ; redundantly parse all sup pairs once to create hash table of nonzero counts for every pair
                   ; we're trying to avoid recalculating counts since they dont change over iterations
  (stochastic-gradient-ascent verbose debug)
  (format t "~%update-model Done."))

(defun update-model-xp (pname sname alpha0 c &key (load nil)(verbose nil)(debug nil))
  "This version runs over supervision data 4 times,  then extrapolates. 
  It finds 4 stages of the gradient, setting its direction and first 4 magnitudes.
  Because of inside-outside count estimation, it is actually 5 passes over supervision data.
  Then it runs Cabay & Jackson algorithm to find the gradient's limit for each parameter by
  minimum polynomial extrapolation (MPE). It can be erroneous if stages fluctuate."
  (beam-value) ;; in case you want to abort 
  (and load (load_bin pname)) ; loads directly into *current-grammar*
  (and load (load-supervision sname)) ; (Si Li) pairs loaded into *supervision-pairs-list*
  (set-training-parameters 4 (length *supervision-pairs-list*)(length *current-grammar*) alpha0 c 'x4) ; fixed iteration 
  (inside-outside) ; redundantly parse all sup pairs once to create hash table of nonzero counts for every pair
  ; we're trying to avoid recalculating counts since they dont change over iterations
  (stochastic-gradient-ascent verbose debug 'x4)
  (extrapolate-parameters)
  (format t "~%update-model-xp done."))

(defun show-training ()
  "show the values of parameters per key before and after training"
  (show-config)
  (format t "~%Training parameters: N = ~a alpha0 = ~a c = ~a n = ~a  " 
	  *bign*  *alpha0* *c* *smalln*)
  (format t "~%Model parameters before and after training~%================================================")
  (format t "~%key   elm             initial  final    diff ~%------------------------------------------------")
  (dolist (l *current-grammar*)
    (let ((feat (if (lex-rule-p (nv-list-val 'KEY l)) 'INDEX 'PHON)))
      (format t "~%~5,,,A ~12,,,A ~8,,,F ~8,,,F  (~8,,,F)"
	      (nv-list-val 'KEY l) (nv-list-val feat l) (nv-list-val 'PARAM l) (get-key-param (nv-list-val 'KEY l))
	      (- (get-key-param (nv-list-val 'KEY l)) (nv-list-val 'PARAM l)))))
  (format t "~%================================================"))

(defun show-training-xp ()
  "show the values of parameters per key before and after training"
  (show-config)
  (format t "~%Training parameters: N = ~a alpha0 = ~a c = ~a n = ~a  " 
	  *bign*  *alpha0* *c* *smalln*)
  (format t "~%Model parameters before and after training and extrapolation~%================================================")
  (format t "~%key   elm             initial  final    diff ~%------------------------------------------------")
  (dolist (l *current-grammar*)
    (let ((feat (if (lex-rule-p (nv-list-val 'KEY l)) 'INDEX 'PHON)))
      (format t "~%~5,,,A ~12,,,A ~8,,,F ~8,,,F  (~8,,,F)"
	      (nv-list-val 'KEY l) (nv-list-val feat l) (nv-list-val 'PARAM l) (get-key-param-xp (nv-list-val 'KEY l))
	      (- (get-key-param-xp (nv-list-val 'KEY l)) (nv-list-val 'PARAM l)))))
  (format t "~%================================================"))

(defun save_grammar (gname &key (force t))
  "this save is baroque to make it lisp reload-able"
  (with-open-file (s gname 
		     :direction :output :if-exists (if force :supersede :error))  ; we put the default extension
    (format s "(defparameter *current-grammar*~%")
    (format s "'")
    (prin1 *current-grammar* s)
    (format s ")~%"))
  t)                  ; to make it cl4py friendly. All interfaces return T to avoid data trouble

(defun save-training (out)
  (or out (format t "please specify an output grammar name to avoid unintentional overrides") 
      (return-from save-training))
  (dolist (l *current-grammar*)
    (setf (nv-list-val 'PARAM l) (get-key-param (nv-list-val 'KEY l))))
  (save_grammar out))

(defun save-training-xp (out)
  (or out (format t "please specify an output grammar name to avoid unintentional overrides") 
      (return-from save-training-xp))
  (dolist (l *current-grammar*)
    (setf (nv-list-val 'PARAM l) (get-key-param-xp (nv-list-val 'KEY l))))
  (save_grammar out))

(defun z-score-grammar ()
  "This version assumes all entries to be from one distribution.
  turns current parameter values to z-scores with normal distribution N(0,1).
  Now all parameters are factors apart from population standard deviation with same variance as original sample.
  Useful for avoiding over/underflow as your model develops.
  Assuming population mean & std deviation to avoid dbz check."
  (if (< (length *current-grammar*) 2)
    (format t "~%Nothing to z-score!")
    (let ((sumsq 0.0) ; find standard deviation and mean in one pass
	  (sum  0.0)
	  (std  0.0)
	  (mean 0.0)
	  (n (length *current-grammar*)))
      (dolist (item *current-grammar*)
	(setf sumsq (+ sumsq (expt (nv-list-val 'PARAM item) 2)))
	(setf sum (+ sum (nv-list-val 'PARAM item))))
      (setf std (mysqrt (- (/ sumsq n)  (expt (/ sum n) 2))))
      (if (< std least-positive-short-float) 
	(format t "~%No variation, no change")
	(let ((minw most-positive-single-float)
	      (maxw most-negative-single-float))
	  (setf mean (/ sum n))
	  (dolist (item *current-grammar*)
	    (setf (nv-list-val 'PARAM item) (/ (- (nv-list-val 'PARAM item) mean) std))
	    (if (> (nv-list-val 'PARAM item) maxw) (setf maxw (nv-list-val 'PARAM item)))
	    (if (< (nv-list-val 'PARAM item) minw) (setf minw (nv-list-val 'PARAM item))))
	  (format t "~%Currently loaded grammar is z-scored to N(0,1).")
	  (format t "~%Max z-scored = ~A, Min z-scored = ~A" maxw minw)
	  (list minw maxw))))))

(defun max-lf-span ()
  "find the spanned elements of the currently loaded grammar, 
  i.e. those with same LF but weaker one is string-covered by the stronger."
  (let ((sp nil)
	(g (copy-seq *current-grammar*)))  ; we will delete from g destructively 
    (dolist (l1 g (values g (reverse sp)))
      (dolist (l2 g)
	(if (and (not (equal (nv-get-v 'KEY l1) (nv-get-v 'KEY l2)))
		 (alpha-equivalent (nv-get-v 'SEM l1) (nv-get-v 'SEM l2))
		 (search (string (nv-get-v 'PHON l2)) (string (nv-get-v 'PHON l1)))
		 (< (length (string (nv-get-v 'PHON l2))) (length (string (nv-get-v 'PHON l1))))
		 (<= (nv-get-v 'PARAM l2) (nv-get-v 'PARAM l1)))
	  (progn (push l2 sp)
		 (delete l2 g)))))))

(defmacro subset-principle-lf (gn)
  "saves result of max-lf-span as current grammar. Call it if you want to see both survived and deleted entries"
  `(progn 
     (format t "~%Size of current grammar before update: ~A" (length *current-grammar*))
     (multiple-value-bind (g d)
       (max-lf-span) ; applies SP to currently loaded grammar wrt identical LFs
       (format t "~%Size of updated grammar= ~A~%Size of deletion list (with overlaps)= ~A~%" (length g) (length d))
       (setf *current-grammar* g))
     (save_grammar ,gn))) ; then saves the updated current grammar

(defun filter (&key (metod '>=) (threshold 0.0))
  "filters out grammar entries in current grammar by PARAM; metod is survival criteria"
  (let* ((fg nil) ; filtered grammar
	 (fn (progn (format t "~%Enter a grammar name (without file extension) for saving survivors")
		    (format t "~%put in double quotes if you want to preserve case~%") 
		    (string (read)))))
    (dolist (item *current-grammar*)
      (if (funcall metod (nv-list-val 'PARAM item) threshold) (push item fg)))
    (setf *current-grammar* (reverse fg))
    (save_grammar fn)))

(defun z-score-grammar-per-form ()
  "calculates z values for each lexical form separately, because they are the ones 
  in competition with each other in parsing and ranking. Assumes a loaded grammar.
  Assuming population mean & std deviation to avoid dbz check."
  (if (< (length *current-grammar*) 2)
    (format t "~%Nothing to z-score!")
    (let* ((n (length *current-grammar*))
	   (ht (make-hash-table :test #'equal :size n)))
      (dolist (item *current-grammar*)  ; initialize sums per form --collisions override same form
	(setf (machash (nv-list-val 'PHON item) ht) '((SUMSQ 0.0)
						      (SUM 0.0)
						      (N 0))))
      (dolist (item *current-grammar*)  ; another pass to fill in data
	(setf (machash (nv-list-val 'PHON item) ht)
	      (list
		(list 'SUMSQ 
		      (+ (nv-list-val 'SUMSQ (machash (nv-list-val 'PHON item) ht))
			 (expt (nv-list-val 'PARAM item) 2)))
		(list 'SUM 
		      (+ (nv-list-val 'SUM (machash (nv-list-val 'PHON item) ht))
			 (nv-list-val 'PARAM item)))
		(list 'N 
		      (+ (nv-list-val 'N (machash (nv-list-val 'PHON item) ht)) 1)))))
      (let ((ht2 (make-hash-table :test #'equal :size (hash-table-count ht))))
	(maphash #'(lambda (k v)  ; fix mean and  std deviation over unique forms
		     (setf (machash k ht2)
			   (list 
			     (list 'MEAN (/ (nv-list-val 'SUM v) (nv-list-val 'N v)))
			     (list 'STD (mysqrt (- (/ (nv-list-val 'SUMSQ v) (nv-list-val 'N v))
						   (expt (/ (nv-list-val 'SUM v) 
							    (nv-list-val 'N v)) 2)))))))

		 ht)
	(dolist (item *current-grammar*) ; now update parameters per form in currently loaded grammar
	  (setf (nv-list-val 'PARAM item) 
		(setf (nv-list-val 'PARAM item) 
		      (if (/= (nv-list-val 'STD (machash (nv-list-val 'PHON item) ht2)) 0.0)
			(/ (- (nv-list-val 'PARAM item)
			      (nv-list-val 'MEAN (machash (nv-list-val 'PHON item) ht2)))		      
			   (nv-list-val 'STD (machash (nv-list-val 'PHON item) ht2)))
			0.0)))))
      (format t "~%Currently loaded grammar is z-scored PER FORM."))))

(defun mklist (obj)
  (if (listp obj) obj (list obj)))


(defun almost-eq (x y)
  (<= (abs (- x y)) *epsilon*))
  "writes one lisp object to file fn in one fell swoop"

(defun read1 (fn)
  "reads one lisp object from file fn in one fell swoop"
  (with-open-file (s fn :direction :input :if-does-not-exist :error) (read s)))

(defun write1 (fn obj)
  "writes one lisp object to file fn in one fell swoop"
  (with-open-file (s fn :direction :output :if-exists :error) (format  s "~A~%" obj)))

(defun write1f (fn obj)
  "force writes one lisp object to file fn in one fell swoop"
  (with-open-file (s fn :direction :output :if-exists :supersede) (pprint-linear s obj)))

(defun write1fperline (fn obj)
  "force writes the list in obj one element per line"
  (with-open-file (s fn :direction :output :if-exists :supersede)
    (format s "(~%~{~A~%~})" obj)))

(defun gradient-profile (&rest models)
  "lists pairwise gradient difference in a sequence of models in files. 
  Assumes models are parallel; i.e. keys in same order."
  (map 'list 
       #'identity
       (mapcar ; filters one feature from each entry
	 #'(lambda (x)(second (assoc 'PARAM x))) 
	 (mapcar 
	   #'car
	   (mapcar  ;returns list of grammars
	     ; 1st: defparameter 2nd:grammar name 3rd: (quote grammar)
	     #'(lambda (m) (second (third (read1 m)))) 
	     models)))))

(defconstant +sqrt-of-two-pi+ (sqrt (* 2.0 pi)))

(defun standard-normal-pdf (z)
  "given zscore z, returns value of standard normal pdf N(0,1) at z"
  (/ (exp (/ (* z z) -2.0)) +sqrt-of-two-pi+))

(defun kl-prepare (g)
  "z score grammar g, then hash item key to (param z-score prob)"
  (load_bin g)
  (let ((ght (make-training-hashtable (length *current-grammar*)))
	(errlog nil))
    (dolist (el *current-grammar*)
      (setf (machash (nv-list-val 'KEY el) ght) (nv-list-val 'PARAM el)))
    (z-score-grammar) ; z-scoring changes values of currently loaded parameters to z scores
    (dolist (el *current-grammar*)
      (setf (machash (nv-list-val 'KEY el) ght) (list (machash (nv-list-val 'KEY el) ght)
						      (nv-list-val 'PARAM el)
						      (standard-normal-pdf (nv-list-val 'PARAM el)))))
    (maphash #'(lambda (k v) (if (or (> (third v) 1.0) (< (third v) 0.0)) (push (list k v) errlog)))
	     ght)
    (values ght (reverse errlog))
    ))

(defun klz (g keypairs)
  "KL divergence from N(0,1) probs for pairs of keys in grammar.
  Return KL value"
  (multiple-value-bind (h err) (kl-prepare g)
    (cond (err (format t "~%Out of range probabilities for keys ~A" err)
	       (pprint-hashtable h)
	       (return-from klz nil))
	  (t (let ((total 0.0))
	       (dolist (pair keypairs)
		 (let  
		   ((pv2 (third (machash (second pair) h))) ; probability values
		    (pv1 (third (machash (first pair) h))))
		   (cond ((and pv1 pv2)
			  (if (/= pv2 0.0) 
			    (setf total (+ total (* pv1 (log (/ pv1 pv2)))))))
			 (t (format t "~%Invalid index pair: ~A  values: ~A" pair (list pv1 pv2))
			    (return-from klz)))))
	       (format t "~%Valid pairs: ~A (total)~%" (length keypairs))
	       total)))))


;; ======================================
;; some shortcuts for top-level functions
;; ======================================

;; macros from Graham 94 OL

(defun group (source n)
  (if (endp source)
    nil
    (let ((rest (nthcdr n source)))
      (cons (if (consp rest) (subseq source 0 n) source)
	    (group rest n)))))

;; shortcuts for common functions. they become macros.

(defun ab ()
  (dolist (a *abv*) (format t "~5A ~A~%" (first a) (second a))))

;;; ------------------------------------------
;;; A compiler for synthetic case, 2022 Datca, Ankara
;;; -- Cem Bozsahin
;;; ------------------------------------------

(mydef *ht-tr* nil) ; hash table for derived tr rules--for subsumption check after compile
                        ; key : lex rule key value: lex rule including key as hashtable
(mydef *VERBS-IN-GRAMMAR* NIL)

(defmacro mk-tr-rule (key index insyn outsyn)
  "semantics is fixed, rest is varying, parameter is just initialized"
  `(list (list 'KEY ,key) (list 'INSYN ,insyn) (list 'INSEM 'LCOM)
	 (list 'OUTSYN ,outsyn)
	 (list 'OUTSEM '(LAM LCOM (LAM P (P LCOM))))  
	 (list 'INDEX ,index)
	 (list 'PARAM 1.0)))  

(mydef *TR-RANGE* NIL)
(mydef *DOMAIN* NIL)
(mydef *LAST-KEY-ID* NIL)
(mydef *tr-error-file* "")  ; filename for error log 
(mydef *tr-error-log* nil)  ; list of errors/warnings
(mydef *RAISED-LEX-RULES* NIL)
(mydef *SC-RULES* NIL)
(mydef *RAISED-LEX-ITEMS* NIL)

;--------get methods----------;

(defun get-morph (v)
  (nv-get-v 'MORPH v))

(defun get-phon (v)
  (nv-get-v 'PHON v))

(defun get-modal-of-dir (l)
  "if it is a complex cat, return the direction's modal if there is any"
  (assoc 'MODAL l))

(defun get-dir (l)
  "get the direction if it is a complex cat"
  (assoc 'DIR l))

(defun get-last-key-id (l)
  "latest key id in the structure---no guarantee that the grammarfile is ordered by key; find the max"
  (setf *LAST-KEY-ID* -1) ; no negatives in translation 
  (dolist (e l)
    (if (< *LAST-KEY-ID* (nv-get-v 'KEY e))
      (setf *LAST-KEY-ID* (nv-get-v 'KEY e)))))

(defun get-next-key-id ()
  "increment the last id in the structure and return it"
  (setf *LAST-KEY-ID* (+ 1 *LAST-KEY-ID*))
  *LAST-KEY-ID*)
	
(defun find-morph-v (grammar morphs)
  "find verb morphemes"
  (dolist (entry grammar)
    (dolist (morph morphs)
      (if (equal morph (get-morph entry))
	(push entry *VERBS-IN-GRAMMAR*)))))

(defun wrap (x)
  "wrap code in parentheses"
  (list x))

(defun is-complex-cat (cat)
  "decide if it's a complex cat"
  (assoc 'DIR cat))
	
(defun tr-from-lexical-function (cat)
  "Isolate domain and range of the lexical function for input and output
  of a unary rule for TR, as resp. *DOMAIN* and *TR-RANGE*.
  We do not iterate over every argument of a lexical function in cat"
  (setf *DOMAIN* nil)
  (setf *TR-RANGE* nil)
  (if (not (is-complex-cat cat)) 
    (return-from tr-from-lexical-function))
  (let ((dir-of-cat (get-dir cat))
	(modal-of-dir (get-modal-of-dir cat)))
    (if (equal '(DIR BS) dir-of-cat) ;; assumes double slashed functions are not raised
      (setf *TR-RANGE* (append (wrap (car cat)) (wrap '(DIR FS)) (wrap modal-of-dir) (wrap cat))) 
      (setf *TR-RANGE* (append (wrap (car cat)) (wrap '(DIR BS)) (wrap modal-of-dir) (wrap cat))))
    (setf *DOMAIN* (car (reverse cat))) 
    ))

(defun mk_lfeats (ht)
  (let ((feats nil))
    (maphash #'(lambda (k v)
		(if (and (not (eql k 'BCAT)) (not (eql k 'CONST))) 
		  (setf feats (append feats (list k v)))))
	     ht)
    (if feats
      (list 'FEATS (list feats))
      (list 'FEATS feats))))

(defun mk_lbcat (bcat bconst feats)
  (if bconst
    (list  (list 'BCAT bcat) (list 'BCONST bconst) feats)
    (list  (list 'BCAT bcat)  feats)))

(defun mk_lccat (result dir modal lex arg)
  (if lex
    (list result (list 'DIR dir) (list 'MODAL modal) (list 'LEX lex) arg)
    (list result (list 'DIR dir) (list 'MODAL modal) arg)))

(defun synht2list (ht &optional (syn nil))
  "converts the syn category in hashtable ht to MG lisp code"
  (if (machash 'BCAT ht) ; basic
      (append syn (mk_lbcat (machash 'BCAT ht) (machash 'BCONST ht) (mk_lfeats ht)))
    (append syn
	    (mk_lccat 
	      (synht2list (machash 'RESULT ht) syn)
	      (machash 'DIR ht) (machash 'MODAL ht) (machash 'LEX ht)
	      (synht2list (machash 'ARG ht) syn)))))
      
(defun httr2list ()
  "converts the entries in *ht-tr* to list notation for MG entries"
  (setf *SC-RULES* nil)
  (maphash #'(lambda (kr vr) ; arule keys and values
	       (let ((arule nil))  ;; order of push is to hack sc_rules2mg sequencing easier
		 (push (list 'PARAM (machash 'PARAM vr)) arule)
		 (push (list 'INDEX (machash 'INDEX vr)) arule)
		 (push (list 'OUTSEM (machash 'OUTSEM vr)) arule)
		 (push (list 'OUTSYN (synht2list (machash 'OUTSYN vr))) arule)
		 (push (list 'INSEM (machash 'INSEM vr)) arule)
		 (push (list 'INSYN (synht2list (machash 'INSYN vr))) arule)
		 (push (list 'KEY kr) arule)
		 (push arule *SC-RULES*)
		 ))
	   *ht-tr*)
  t)

(defun add-tr-to-grammar ()
  "add rules to the currently loaded grammar and refreshes the hash table for rules"
  (httr2list)
  (setf *current-grammar* (append *current-grammar* *SC-RULES*))
  (setf *lex-rules-table* nil)
  (dolist (l *current-grammar*)(and (not (lexp l)) (push-t (hash-lexrule l) *lex-rules-table*))) ; we get reversed list of rules
  (setf *lex-rules-table* (reverse *lex-rules-table*)) ; it is important that the rules apply in the order specified
  t)

(defun mk-bcat (bcatht)
  (let ((feats nil)
	(bcat nil))
    (maphash #'(lambda (k v) (if (equal k 'BCAT)
			       (push (list k v) bcat)
			       (push (list k v) feats)))
	     bcatht)
    (append bcat (list (list 'FEATS feats)))))

(defun mk-nonht (ht)
  "return a list of non-hash-valued name-value pairs"
  (let ((feats nil))
    (maphash #'(lambda (k v) (if (not (hash-table-p v)) (push (list k v) feats)))
	     ht)
    (reverse feats)))

(defun mk-cat (synht &optional (res nil))
  (cond ((null synht) res)
	((basicp-hash synht) (append (mk-bcat synht) res)) ; only BCAT and other feats in same synht
	(t (append (list (mk-cat (machash 'RESULT synht)))
		   (mk-nonht synht)
		   (list (mk-cat (machash 'ARG synht)))
		   res))))

(defun mk-rule (key val)
  "turn  hashtable val back to list; for saving. INSYN and OUTSYN are hash values in val"
  (list (list 'INDEX (machash 'INDEX val))
	(list 'KEY key)
	(list 'PARAM (machash 'PARAM val))
	(list 'INSEM (machash 'INSEM val))
	(list 'OUTSEM (machash 'OUTSEM val))
	(list 'INSYN (mk-cat (machash 'INSYN val)))
	(list 'OUTSYN (mk-cat (machash 'OUTSYN val)))))

;;; ------------------------
;;; Most local unifier (MLU) for subsumption
;;; in rule subsumption, unlike in projection, we must pass on all local (i.e. basic cat-specific) unifiable features, rather than just check them.
;;; This means in projection we compute MGU, in rule subsumption we compute Most Local Unifier (MLU) to avoid
;;;   global variable generation and general unification.
;;; -hhcb
;;; ------------------------

(defun cat-match-mlu (sht1 sht2)
  (cond ((and (basicp-hash sht1) (basicp-hash sht2))
	 (maphash #'(lambda (feat1 v1)
		      (let ((v2 (machash feat1 sht2)))
			(and v1 v2 (not (var? v1)) (not (var? v2)) (not (equal v1 v2))
			     (return-from cat-match-mlu (values nil)))
			(cond ((var? v1) (remhash feat1 sht1))          ; delete uncommmon or var valued features after unif success
			      ((null v2) (remhash feat1 sht1)))))
		  sht1)
	 (values t))
	((and (complexp-hash sht1) (complexp-hash sht2)
	      (eql (machash 'DIR sht1)(machash 'DIR sht2))
	      (mod-compatiblep (machash 'MODAL sht1) (machash 'MODAL sht2)))
	 (let ((arg1 (copy-hashtable (machash 'ARG sht1)))) 
	   (multiple-value-bind (res1)
	     (cat-match-mlu arg1 (machash 'ARG sht2))  ; arg1 is modified
	     (and res1 (let ((res1 (copy-hashtable (machash 'RESULT sht1)))) 
			 (multiple-value-bind (res2)
			   (cat-match-mlu res1 (machash 'RESULT sht2)) ; arg1 is modified
			   (return-from cat-match-mlu (values res2))))))))
	(t (values nil))))

;---------------------------------------------------------------
;------------to create lex-rule entries-------------------------
;---------------------------------------------------------------

(defun compile_v (morphs &optional (e-log "case-compile-error.log")) 
  "identify lexical functions from morphs tag and generate 2nd order case function for their outermost argument"
  ;; assumes that a grammar is loaded before called
  (if *error* (progn (format t "~%aborting compile; currently loaded grammar is unchanged")
		     (return-from compile_v)))
  (setf *RAISED-LEX-RULES* NIL) ;set to default
  (setf *VERBS-IN-GRAMMAR* NIL)
  (setf *tr-error-file* e-log)
  (setf *tr-error-log* nil)
  (find-morph-v *current-grammar* morphs)
  (get-last-key-id *current-grammar*)
  (dolist (v-entry *VERBS-IN-GRAMMAR*)
    (tr-from-lexical-function (nv-get-v 'SYN v-entry))  ; sets *TR-RANGE* and *DOMAIN* 
    (if (and *DOMAIN* *TR-RANGE*)
      (progn
	(if  (is-complex-cat *DOMAIN*)
	  (push (list 'WARNING 'COMPLEX-ARG 'KEY (nv-get-v 'KEY v-entry)) *tr-error-log*))
	(push (mk-tr-rule (get-next-key-id) (gensym "_G2_") 
			  *DOMAIN* *TR-RANGE*) *RAISED-LEX-RULES*))
      (push (list 'WARNING 'NO-OUTERMOST-ARG 'KEY (nv-get-v 'KEY v-entry)) *tr-error-log*)))
  (if *tr-error-log* (write1f *tr-error-file* *tr-error-log*))
  t)

(defun hash-tr ()
  "creates the hash table for inferred rules"
  (setf *ht-tr* (make-hash-table :test #'equal :size (+ (length *RAISED-LEX-RULES*) 10)))
  (dolist (lexr (reverse *RAISED-LEX-RULES*))
    (setf (machash (nv-list-val 'KEY lexr) *ht-tr*) (hash-lexrule lexr))))

(defun generate_paradigms ()
  "It uses a hash-table of rules as input, so don't call it standalone.
   v1 and v2 are hash values. INSYN and OUTSYN are hash-valued SYNs due to hash-tr; cat-match needs this."
  (let ((nochange nil))
    (loop  until nochange
	   do
	   (setf nochange t)
	   (maphash 
	     #'(lambda (k1 v1)
		 (maphash 
		   #'(lambda (k2 v2)
		       (if (not (equal k1 k2))
			 (let ((in1 (copy-hashtable (machash 'INSYN v1)))) ; matching changes input, work on copy in case of failure
			   (multiple-value-bind (match1)
			     (cat-match-mlu in1 (machash 'INSYN v2))   ; arg2 is not modified 
			     (and match1
				  (let ((out1 (copy-hashtable (machash 'OUTSYN v1))))
				    (multiple-value-bind (match2)
				      (cat-match-mlu out1 (machash 'OUTSYN v2))  ; arg2 is not modified
				      (and match2     ; if both in and out do not match, they are different rules
					   (let 
					     ((newht (make-lrule-hashtable))
					      (key (get-next-key-id)))  ; keeping keys numeral to be consistent with the auto numbering system
					     (setf (machash 'KEY newht) key)
					     (setf (machash 'INDEX newht) (gensym "_P2_"))  ; P2 derived the rule
					     (setf (machash 'PARAM newht) 1.0)  ; uniform prior for inferred rules
					     (setf (machash 'INSEM newht) 'LCOM)  ; always the same input abstraction by convention 
					     (setf (machash 'OUTSEM newht) '(LAM LCOM (LAM P (P LCOM)))) ; this is universal
					     (setf (machash 'INSYN newht) in1)   ; MGU of input (1st arg modified in basic cats during match)
					     (setf (machash 'OUTSYN newht) out1) ; MGU of output (1st arg modified in basic cats during match)
					     (setf (machash key *ht-tr*) newht) ; added to table as it is looped
					     (setf nochange nil)
					     (remhash k1 *ht-tr*)
					     (remhash k2 *ht-tr*))))))))))  ; cross your fingers for this destructive hash loop
		   *ht-tr*))
	     *ht-tr*))))

(defun compile_case (vmorphs &optional (e-log "case-compile-error.log"))
  "first finds all rules from grammar file with list of verbal POS in vmrophs, 
  then reduces the rule set to MGUs of pairs iteratively.
  We use hashtables to be compatible with MGU function cat-match---and for efficieny."
  (let ((res t))
    (compile_v vmorphs e-log) ; result in *RAISED-LEX-RULES* in reverse order of find
    (hash-tr)         
    (generate_paradigms)
    (format t "~%Summary of compiling synthetic case functions for current grammar")
    (if *tr-error-log*
      (progn (format t "~%Log of warnings and errors                      : ~A (total entry: ~A)" 
		     *tr-error-file* (length *tr-error-log*))
	     (setf res nil))
      (progn
	(format t "~%There were NO errors/warnings in deriving second order functions")
	(with-open-file (err *tr-error-file* :direction :output :if-exists :supersede)  ; delete earlier errors to avoid confusion
	  (format err "No errors~%"))))
    (format t "~%Number of elements in the grammar               : ~A" (length *current-grammar*))
    (format t "~%Number of elementary functions considered       : ~A" (length *VERBS-IN-GRAMMAR*))
    (format t "~%POS tags considered for synthetic case          : ~A" vmorphs)
    (format t "~%Number of second-order case functions generated : ~A" (length *RAISED-LEX-RULES*))
    (format t "~%Number of paradigmatic functions out of them    : ~A~%" (hash-table-count *ht-tr*))
    res))

(defun mk_string (&rest args)
  (apply #'concatenate 'string args))

(defun mk_basic_sc (syn s)
  (if (nv-get-v 'BCONST syn)
    (format s "'~{~(~A~)~^ ~}'" (nv-get-v 'BCAT syn))
    (progn
      (format s  "~(~A~)" (nv-get-v 'BCAT syn))
      (if (nv-get-v 'FEATS syn)
	(progn 
	  (format s "~A" "[")
	  (let ((n (length (nv-get-v 'FEATS syn)))
		(k 1))
	    (dolist (feat (nv-get-v 'FEATS syn))
	      (if (= n k)
		(format s "~(~A~)=~(~A~)"  (first feat) (second feat))
		(format s "~(~A~)=~(~A~)," (first feat) (second feat)))
	      (incf k)))
	  (format s "~A" "]"))))))

(defun mk_cat_sc  (syn s)       ; reverse engineers an autogenerated case rule to MG notation
  (cond ((nv-get-v 'DIR syn) (if (nv-get-v 'DIR (first syn))
			       (progn
				 (format s "~A" "(")   ; complex cat
				 (mk_cat_sc (first syn) s)
				 (format s "~A"  ")"))
			       (mk_cat_sc (first syn) s))
			     (format s "~A" (format-dir (nv-get-v 'DIR syn) nil))   ; there is no auto-generated LEX feature
			     (format s "~A" (format-mod (nv-get-v 'MODAL syn)))  
			     (cond ((nv-get-v 'DIR (fourth syn))
				    (format s "~A" "(")  ; why 4th? auto generated in seq '() DIR MODAL ()'
				    (mk_cat_sc (fourth syn) s)
				    (format s "~A" ")"))
				   (t (mk_basic_sc (fourth syn) s))))
	(t (mk_basic_sc syn s))))

(defun mk_cat (syn s)      
  (cond ((nv-get-v 'DIR syn) (if (nv-get-v 'DIR (first syn))
			       (progn
				 (format s "(")   ; complex cat
				 (mk_cat (first syn) s)
				 (format s  ")"))
			       (mk_cat (first syn) s))
			     (format s "~A" (format-dir (nv-get-v 'DIR syn) (nv-get-v 'LEX syn))) 
			     (format s "~A" (format-mod (nv-get-v 'MODAL syn)))
			     (if (nv-get-v 'LEX syn)   ; it is either () DIR MODAL () or () DIR MODAL LEX ()
			       (cond ((nv-get-v 'DIR (fifth syn))
				      (format s "~A" "(")
				      (mk_cat (fifth syn) s)
				      (format s "~A" ")"))
				     (t (mk_basic_sc (fifth syn) s)))
			       (cond ((nv-get-v 'DIR (fourth syn))
				      (format s "~A" "(")
				      (mk_cat (fourth syn) s)
				      (format s "~A" ")"))
				     (t (mk_basic_sc (fourth syn) s)))))
	(t (mk_basic_sc syn s))))

(defun mk_arulename_sc (r s)
  (format s "#~(~A~)  " r))

(defun mk_keyparamend (r s)
  (format s "<~A, ~F>~%" (nv-get-v 'KEY r) (nv-get-v 'PARAM r)))  ; we need ~F to avoid scientific notation for wee values

(defun mk_lf (lf s)
  "raw use of display-lf with format directives may spill over multiple lines, we avoid that with this function"
  (format s " : ")
  (dolist (obj (display-lf lf))
    (format s "~(~A~) " obj)))   ; all in lowercase

(defun mk_arule (r s)
  (mk_arulename_sc (nv-get-v 'INDEX r) s)       
  (mk_cat (nv-get-v 'INSYN r) s)
  (mk_lf (nv-get-v 'INSEM r) s)
  (format s " --> ")
  (mk_cat (nv-get-v 'OUTSYN r) s)
  (mk_lf (nv-get-v 'OUTSEM r) s))

(defun mk_entry (e s)
  (format s "~A | ~(~A~) :: " 
	  (nv-get-v 'PHON e)    ; keep case of the PHON
	  (nv-get-v 'MORPH e))
  (mk_cat (nv-get-v 'SYN e) s)
  (mk_lf (nv-get-v 'SEM e) s))

(defun generate_source (gname)   ;; converts arules in lisp format to monadic grammar source code
  (setf *print-pretty* nil)      ; to avoid multiline entries in format ...
  (setf *random-state* (make-random-state t))
  (if (null *current-grammar*)
    (progn (format t "~%Nothing to save as grammar~%")
	   (return-from generate_source t)))
  (let ((afile (concatenate 'string gname "." (write-to-string (random 999999)) ".txt"))) ; make up a name
    (with-open-file (s afile :direction :output :if-exists :supersede)
      (format s "%%%~%%This file is autogenerated by the processor at: ")
      (put_timestamp s)
      (format s "~%%%%~2%")
      (dolist (r *current-grammar*)
	(if (nv-get-v 'INSYN r) ; a rule
	  (mk_arule r s)
	  (mk_entry r s))
	(mk_keyparamend r s)))
    (format t "~%File: ~A created; contains text for ~A,~%   minus comments and empty lines, with srules converted to entries.~%" afile gname))
  (setf *print-pretty* t)
  t)

(defun sc_rules2mg (gname)   ;; converts arules in lisp format to monadic grammar source code
  ;(setf *random-state* (make-random-state t))
  (setf *print-pretty* nil)
  (if (null *SC-RULES*)
    (progn (format t "~%Nothing to save as case function; please check the case log file~%")
	   (return-from sc_rules2mg t)))
  (let ((afile (concatenate 'string gname ".sc.arules"))) ; make up a name
    (with-open-file (s afile :direction :output :if-exists :supersede)
      (dolist (r *SC-RULES*)
	(mk_arulename_sc (nv-get-v 'INDEX r) s)                 ; these rules have universal semantics
	(mk_cat_sc (nv-get-v 'INSYN r) s)
	(format s " : a --> ")
	(mk_cat_sc (nv-get-v 'OUTSYN r) s)
	(format s " : \\a\\p.p a~%")))
    (format t "~%File: ~A created; contains synthetic case rules for ~A in the source format,~%   for merging with grammar source text or for inspection.~%" afile gname))
  (setf *print-pretty* t)
  t) ; all interface functions return t

(defun synthetic_case (vmorphs logfile)
  (compile_case vmorphs logfile)
  (if *tr-error-log* 
    (progn
      (format t "~%Check the ~A file for potential concerns." *tr-error-file*)
      (format t "~%These are not ill-formed,~%   but expect unpredictable case performance from them.~%"))
    (format t "~%Case functions compiled OK.~%"))
  (add-tr-to-grammar)
  (format t "~%Loaded grammar augmented with arules for case~% (NOT saved in its text file).~2%")
  t)

(defun skeleton ()
  "collects and reports the skeleton of the currently loaded grammar"
  (let ((skht (make-cky-hashtable 
		(+ 5 (length *current-grammar*)))) ; although this is not for parsing, structure is the same
	(checksum 0)
	(slashcnt 0)
	) ; second element of the list value is the lex cat as hash table, the first one is list of elements which 
    ; matches the syntactic cat in the second element
    (dolist (el *current-grammar*)
      (if (not (lex-rule-p (nv-list-val 'KEY el)))
	(setf (machash (gensym "sk-") skht)  ; 3 elements: PHON list a lexht and match count
	      (list (list (nv-list-val 'PHON el))
		    (hash-lex el)
		    0))))
    (maphash #'(lambda (k1 v1)
		 (maphash #'(lambda (k2 v2)
			      (and (not (equal k1 k2))
				   (cat-match (machash 'SYN (second v1))
					      (machash 'SYN (second v2)))
				   (setf (first v1) (append (first v1) (cons "/"  (first v2))))
				   (setf (third v1) (+ (third v1) 1))
				   (incf slashcnt) ; for double check
				   (remhash k2 skht))) ; this is destructive--effects next iterations
			  skht))
	     skht)
    (let ((sklist nil))        ; sort what remains and report
      (maphash #'(lambda (k v) 
		   (push (list (machash 'SYN (second v))
			       (- (length (first v)) (third v))
			       (first v)) 
			 sklist)
		   (setf checksum (+ checksum (length (first v)))))
	       skht)
      (format t "The categorial skeleton of the current grammar~2%")
      (dolist (v (sort sklist #'> :key #'second))
	(format t "~%category  : ~A~%occurrence: ~A  element~:P~%elements  : ~A~2%--------~%" 
		(linearize-syn (first v)) (second v) (third v))))
    (format t "~%Checksum: ~A (total of sums in category classes)" (- checksum slashcnt))
    (format t "~%Total   : ~A distinct categories~%Out of  : ~A entries (not counting asymmetric relational rules)" 
	    (hash-table-count skht)
	    (- (length *current-grammar*) (length *lex-rules-table*))))
  t)  ; return success to python

;; some nohup-friendly test suite -- all is written offline
;; this stuff is used by bench-train-.. scripts 

(defun train-nohup-sbcl (gram sup gcmb out N alpha0 c)
  (progn 
    (setf (sb-ext:bytes-consed-between-gcs) (* gcmb 1024 1024))  ; specify GC cycle in MB
    ; default is 51 MB in sbcl
    (sb-ext:gc) ; make effective immediately
    (time (update-model gram sup N alpha0 c :load t)) ; cross your fingers
    (show-training)                     ; prayers answered
    (save-training out)     ; this is to save the grammar---session output always to names with nohup.out when called 
    ))

(defun train-nohup-sbcl-xp (gram sup gcmb out alpha0 c)
  "this is the extrapolating version."
  (progn 
    (setf (sb-ext:bytes-consed-between-gcs) (* gcmb 1024 1024))  ; specify GC cycle in MB
    ; default is 51 MB in sbcl
    (sb-ext:gc) ; make effective immediately
    (time (update-model-xp gram sup alpha0 c :load t)) 
    (show-training-xp)                  
    (save-training-xp out)  ; this is to save the grammar---session output always to names with nohup.out when called 
    ))

(defun noop () ; used in bench.py to keep #arguments constant
  (values))

; switch control

(defun beam-off ()
  (setf *beamp* nil))

(defun beam-on ()
  (setf *beamp* t))

(defun nfparse-off ()
  (setf *nf-parse* nil))

(defun nfparse-on ()
  (setf *nf-parse* t))

(defun oov-off ()
  (setf *oovp* nil))

(defun oov-on ()
  (setf *oovp* t))

(defun lambda-on ()
  (setf *lambdaflag* t))

(defun lambda-off ()
  (setf *lambdaflag* nil))

; almost there

(defun reset-globals (&key (silent nil))
  "resets the dynamic globals."
  (setf *print-readably* nil)
  (setf *print-pretty* t) 
  (setf *lex-rules-table* nil)
  (clrhash *cky-hashtable*)
  (clrhash *cky-lf-hashtable*)
  (setf *cky-lf-hashtable-sum* 0.0)
  (setf *cky-input* nil) 
  (setf *cky-max* nil)
  (setf *cky-argmax-lf-max* nil) 
  (setf *cky-argmax-lf* nil)
  (setf *cky-lf* nil) 
  (setf *loaded-grammar* "")
  (setf *current-grammar*  nil)
  (beam-off)
  (lambda-on)
  (nfparse-on)
  (oov-off)
  (monad-all)
  (if (not silent) (show-config))) 

(reset-globals :silent t)

(format t "lisp     : bench.lisp loaded, version ~A, encoding ~A~%" 
	  (multiple-value-bind (pr v) (which_processor)
	    v)
	  sb-impl::*default-external-format*)
