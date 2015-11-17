(defun power (x y)
  "This function computes x to the power of y.
    Example call: (power 'x+1 2) will return expression equal to x^2 + 2x + 1
    x - exponention base, which can be any lisp atom
    y - exponent, which can be any integer"
  (cond
    ((= y 0) 1)
    ((< y 0) `(* (/ 1 ,x) ,(power x (+ y 1))))
    (`(* ,x ,(power x (- y 1))))))

(defmacro power-macro (x y)
  "This macro generates code which computes x to the power of y.
    Example call: (power-macro 'x+1 2) will return expression equal to x^2 + 2x + 1
    x - exponention base, which can be any lisp atom
    y - exponent, which can be any integer"
  `(cond
    ((= ,y 0) 1)
    ((< ,y 0) `(* (/ 1 ,,x) ,(power-macro ,x ,(+ y 1))))
    (`(* ,,x ,(power-macro ,x ,(- y 1))))))

(defun demonstrate-power ()
  "This function purpose is to print demo usage of POWER function"
  (format t "Calling (power (+ x 1) 2)...")
  (print (setq expr (power '(+ x 1) 2)))

  (format t "~%~%Evaluating expression with x = 2...")
  (setq x 2)
  (print (eval expr)))

(defun demonstrate-power-negative ()
  "This function purpose is to print demo usage of POWER function with negative exponent"
  (format t "~%Calling (power 'x -5)")
  (print (setq expr (power 'x -5)))

  (format t "~%~%Evaluating expression with x = 2...")
  (setq x 2)
  (print (eval expr)))
