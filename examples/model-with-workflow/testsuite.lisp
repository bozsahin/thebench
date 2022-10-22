;; this file explains how the throught experiment was conducted step by step
;; run it after you are logged on to ccglab-- it's all Lisp code
;; -cem bozsahin

(defparameter *db* '(
  (john loves mary)
  (mary loves john)
  (john knows mary)
  (mary knows john)
  (mary knows john loves mary)
  (john knows mary loves john)
  ))

(defun train-noqnoc ()
  (load_bin "g1.g.bin")        
  (update-model "g1.g.bin" 10 1.0 1.0 :load t)  ; updates g1.ccg.lisp after loading it, using g1.sup
  (show-training)
  (save-training "g1-updated.bin")
  )

(defun train-noqnoc-xp ()
  "in case we want to extrapolae the gradient"
  (load_bin "g1.g.bin")               ; makes and loads the .ccg.lisp file  from .ccg
  (nf-parse-on)           ; use normal form parsing
  (update-model-xp "g1.g.bin" 1.0 1.0 :load t)  ; update using extrapolation (fixed to 4 iterations)
  (show-training-xp)	    ; shows training using extrapolation
  (save-training "g1-updated-xp.bin")
  )

(defun test (g)
  (load_bin "g")
  (format t "~%---------~%Testing the ~A grammar" g)
  (dolist (ex *db*)
    (format t "~2%======~%all derivations of ~A without ranking~%" ex)
    (cky_analyze ex)
    (cky_show_analysis)
    (format t "~2%======~%all derivations of ~A with ranking~%" ex)
    (cky_rank ex)
    (cky_show_ranking) ; shows the most likely LF
    ))
