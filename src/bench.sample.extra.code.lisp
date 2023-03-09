;; sample user additions to the processor
;; --cem bozsahin 

(defun beam07-app ()
  "sets beam and turns of normal form parse"
  (monad-all)
  (setf *beam-exp* 0.7)
  (nfparse-on)
  (beam-on)
  )

(defun nobeam-nf-apphcomp ()
  "Finer control than monad-all: allowing harmonic composition only"
  (nfparse-on)
  (beam-off)
  (monad-all) ; first turn them all on, then restrict
  (setf *a-apply* t) ;application
  (setf *b-apply* t)
  (setf *f-comp* t)  ;composition
  (setf *b-comp* t)
  )

(beam07-app)  ; run the code to change parse behavior
