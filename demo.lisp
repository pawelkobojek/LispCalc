(load "power.lisp")
(load "dot.lisp")
(load "poly.lisp")

(format t "~%-----------------------------Demo: POWER with >positive< exponent (function)-----------------------------~%~%")

;;; power with positive exponent
(demonstrate-power)

(format t "~%-----------------------------Demo: POWER with >positive< exponent (macro)-----------------------------~%~%")

;;; power with positive exponent
(format t "Calling (power-macro (+ x 1) 2)...")
(print (setq expr (power-macro '(+ x 1) 2)))

(format t "~%Expandning macro...")
(print (macroexpand '(power-macro '(+ x 1) 2)))

(format t "~%~%Evaluating expression with x = 2...")
(setq x 2)
(print (eval expr))

(format t "~%~%-----------------------------Demo: POWER with >negative< exponent (function)-----------------------------~%~%")

;;; power with negative exponent
(demonstrate-power-negative)

(format t "~%~%-----------------------------Demo: POWER with >negative< exponent (macro)-----------------------------~%~%")

;;; power with negative exponent
(format t "~%Calling (power-macro 'x -5)")
(print (setq expr (power-macro 'x -5)))

(format t "~%Expandning macro...")
(print (macroexpand '(power-macro 'x -5)))

(format t "~%~%Evaluating expression with x = 2...")
(setq x 2)
(print (eval expr))


(format t "~%~%-------------------------------Demo: DOT product of vectors (function)-----------------------------------~%~%")

;;; dot product of vectors
(demonstrate-dot)

(format t "~%~%-------------------------------Demo: DOT product of vectors (macro)-----------------------------------~%~%")

;;; dot product of vectors
(format t "~%Calling (dot-macro (list 'x 'y 'z) (list '(+ x y) '(+ y z) '(+ z x)))...")
(print (setq expr (dot-macro (list 'x 'y 'z) (list '(+ x y) '(+ y z) '(+ z x)))))

(format t "~%Expandning macro...")
(print (macroexpand '(dot-macro (list 'x 'y 'z) (list '(+ x y) '(+ y z) '(+ z x)))))

(format t "~%~%Evaluating expression with x = 2, y = 3, z = 4...")
(setq x 2)
(setq y 3)
(setq z 4)
(print (eval expr))
(format t "~%")

(format t "~%~%----------------------------------Demo: BUILD-POLYNOMIAL (function)--------------------------------------~%~%")

;; build polynmial
(demonstrate-build-polynomial)

(format t "~%~%----------------------------------Demo: BUILD-POLYNOMIAL (macro)-----------------------------------------~%~%")

;;; build polynomial macro
(format t "~%Calling (build-polynomial-macro 4 (list '(+ u v) '(+ v w) '(+ w u) 1 2 3 4 5 6 7 8 9))...")
(print (setq expr (build-polynomial-macro 4 (list '(+ u v) '(+ v w) '(+ w u) 1 2 3 4 5 6 7 8 9))))

(format t "~%Expandning macro...")
(print (macroexpand '(build-polynomial-macro 4 (list '(+ u v) '(+ v w) '(+ w u) 1 2 3 4 5 6 7 8 9))))

(format t "~%~%Evaluating expression with u = 2, v = 3, w = 4...")
(setq u 2)
(setq v 3)
(setq w 4)
(print (eval expr))
(format t "~%")

(format t "~%~%----------------------------------Demo: BUILD-INTERAL-POLYNOMIAL (function)------------------------------~%~%")

;; build integral polynmial
(demonstrate-build-integral-polynomial)

(format t "~%~%----------------------------------Demo: BUILD-INTERAL-POLYNOMIAL (macro)---------------------------------~%~%")
(format t "~%Calling (build-integral-polynomial-macro 4 (list '(+ u v) '(+ v w) '(+ w u) 1 2 3 4 5 6 7 8 9))...")
(print (setq expr (build-integral-polynomial-macro 4 (list '(+ u v) '(+ v w) '(+ w u) 1 2 3 4 5 6 7 8 9))))

(format t "~%Expandning macro...")
(print (macroexpand '(build-integral-polynomial-macro 4 (list '(+ u v) '(+ v w) '(+ w u) 1 2 3 4 5 6 7 8 9))))

(format t "~%~%Evaluating expression with u = 2, v = 3, w = 4...")
(setq u 2)
(setq v 3)
(setq w 4)
(print (eval expr))
(format t "~%")
