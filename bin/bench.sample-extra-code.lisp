;; sample user additions to the processor
;; --cem bozsahin 

(defun beam07-app ()
  "sets beam and turns of normal form parse"
  (setf *beam-exp* 0.7)
  (nfparse-on)
  (beam-on)
  )

(defun nobeam-nf-apphcomp ()
  "allowing harmonic composition only"
  (nfparse-on)
  (beam-off)
  (setf *f-apply* t) ;application
  (setf *b-apply* t)
  (setf *f-comp* t)  ;composition
  (setf *b-comp* t)
  )

(beam07-app)  ; run the code to change parse behavior
