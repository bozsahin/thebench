;; sample user additions to the processor
;;
;; DO NOT delete or rename this file. You can change it. It is automatically loaded
;;  in the batch mode.
;; --cem bozsahin  2022-23

(defun beam07-app ()
  "sets beam and turns of normal form parse"
  (monad-all)
  (setf *beam-exp* 0.7)
  (nfparse-on)
  (beam-on))

(defun beam-nfoff()
  (monad-all)
  (beam-on)   ; uses default beam exp. viz .9
  (nfparse-off))

(defun nobeam-nf-apphcomp ()
  "Finer control than monad-all: allowing harmonic composition only"
  (nfparse-on)
  (beam-off)
  (monad-montague) ; only application turned on
  (setf *f-comp* t)  ; add harmonic composition
  (setf *b-comp* t))

(defun nobeam-nonf-apphcomp ()
  "Finer control than monad-all: allowing harmonic composition only"
  (nfparse-off)
  (beam-off)
  (monad-montague) ; only application turned on
  (setf *f-comp* t)  ; add harmonic composition
  (setf *b-comp* t))

(format t "         : bench.user.lisp loaded~%")
