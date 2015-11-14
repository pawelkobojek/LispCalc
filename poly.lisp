(load "power.lisp")

(defun build-polynomial (n poly)
  (if (equal (length poly) 1)
    (* (first poly) (power 'x n))
    `(+ (* ,(first poly) ,(power 'x n)) ,(build-polynomial (- n 1) (rest poly)))))
