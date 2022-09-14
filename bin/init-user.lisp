;; sample user additions the processor

(defun beam07-app ()
  "sets beam and turns of normal form parse"
  (setf *beam-exp* 0.7)
  (nf-parse-on)
  (beam-on)
  )

(defun nobeam-nf-apphcomp ()
  "allowing harmonic composition only"
  (nf-parse-on)
  (beam-off)
  (setf *f-apply* t) ;application
  (setf *b-apply* t)
  (setf *f-comp* t)  ;composition
  (setf *b-comp* t)
  )

(format t "~%processor: init-user.lisp loaded~%")
