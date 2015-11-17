(load "power.lisp")

(defun build-polynomial (n poly)
  "Builds a polynomial
    Example call: (build-polynomial 2 (list 1 2 1)) will build polynomial x^2 + 2x + 1
    n - degree of a polynomial
    poly - list of polynomial coefficients, first one is for the variable of degree n,
          second one for the viarable of degree n-1 and so on (also supports negative degrees)"
  (if (equal (length poly) 1)
    `(* ,(first poly) ,(power 'x n))
    `(+ (* ,(first poly) ,(power 'x n)) ,(build-polynomial (- n 1) (rest poly)))))

(defun build-integral-polynomial (n poly)
  "Computes an integral from a polynomial.
    Example call: (build-integral-polynomial 2 (list 1 2 1)) will build polynomial x^3/3 + x^2 + x
    n - degree of a polynomial
    poly - list of polynomial coefficients, first one is for the variable of degree n,
          second one for the viarable of degree n-1 and so on (also supports negative degrees)"
  (cond
    ((= n -1)
      (if (equal (length poly) 1)
        `(* ,(first poly) (log (abs x)))
        `(+ (* ,(first poly) (log (abs x))) ,(build-integral-polynomial (- n 1) (rest poly)))))
    ((if (equal (length poly) 1)
      `(* ,(first poly) (/ ,(power 'x (+ n 1)) ,(+ n 1)))
      `(+ (* ,(first poly) (/ ,(power 'x (+ n 1)) ,(+ n 1))) ,(build-integral-polynomial (- n 1) (rest poly)))))))

(defmacro build-polynomial-macro (n poly)
  "This macro generates the code which builds a polynomial.
    Example call: (build-polynomial-macro 2 (list 1 2 1)) will build polynomial x^2 + 2x + 1
    n - degree of a polynomial
    poly - list of polynomial coefficients, first one is for the variable of degree n,
          second one for the viarable of degree n-1 and so on (also supports negative degrees)"
  `(if (equal (length ,poly) 1)
    `(* ,(first ,poly) ,(power 'x ,n))
    `(+ (* ,(first ,poly) ,(power 'x ,n)) ,(build-polynomial-macro ,(- n 1) (rest ,poly)))))

(defmacro build-integral-polynomial-macro (n poly)
  "This macro generates the code which computes an integral from a polynomial.
    Example call: (build-integral-polynomial-macro 2 (list 1 2 1)) will build polynomial x^3/3 + x^2 + x
    n - degree of a polynomial
    poly - list of polynomial coefficients, first one is for the variable of degree n,
          second one for the viarable of degree n-1 and so on (also supports negative degrees)"
  `(cond
    ((= ,n -1)
      (if (equal (length ,poly) 1)
        `(* ,(first ,poly) (log (abs x)))
        `(+ (* ,(first ,poly) (log (abs x))) ,(build-integral-polynomial-macro (- ,n 1) (rest ,poly)))))
    ((if (equal (length ,poly) 1)
      `(* ,(first ,poly) (/ ,(power 'x (+ ,n 1)) ,(+ ,n 1)))
      `(+ (* ,(first ,poly) (/ ,(power 'x (+ ,n 1)) ,(+ ,n 1))) ,(build-integral-polynomial-macro (- ,n 1) (rest ,poly)))))))

(defun demonstrate-build-polynomial ()
  "This function's purpose is to demonstrate example usage of BUILD-POLYNOMIAL function"
  (format t "~%Calling (build-polynomial 4 (list '(+ u v) '(+ v w) '(+ w u) 1 2 3 4 5 6 7 8 9))...")
  (print (setq expr (build-polynomial 4 (list '(+ u v) '(+ v w) '(+ w u) 1 2 3 4 5 6 7 8 9))))

  (format t "~%~%Evaluating expression with u = 2, v = 3, w = 4...")
  (setq u 2)
  (setq v 3)
  (setq w 4)
  (print (eval expr))
  (format t "~%"))

(defun demonstrate-build-integral-polynomial ()
  "This function's purpose is to demonstrate example usage of BUILD-INTERAL-POLYNOMIAL function"
  (format t "~%Calling (build-integral-polynomial 4 (list '(+ u v) '(+ v w) '(+ w u) 1 2 3 4 5 6 7 8 9))...")
  (print (setq expr (build-integral-polynomial 4 (list '(+ u v) '(+ v w) '(+ w u) 1 2 3 4 5 6 7 8 9))))

  (format t "~%~%Evaluating expression with u = 2, v = 3, w = 4...")
  (setq u 2)
  (setq v 3)
  (setq w 4)
  (print (eval expr))
  (format t "~%"))
