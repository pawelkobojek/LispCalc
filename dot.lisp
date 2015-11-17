(defun dot (x y)
  "This function computes dot product of two vectors. If vectors length does not match,
  it returns NIL
  Example call: (dot (list 1 2 3) (list 3 2 1) will return 10)
  x - list representing first vector, e.g. (list 1 2 3)
  y - list representing second vector, e.. (list 3 2 1)"
  (if (not (equal (length x) (length y)))
    NIL
    (if (= (length x) 1)
      `(* ,(first x) ,(first y))
      `(+ (* ,(first x) ,(first y)) ,(dot (rest x) (rest y))))))

(defmacro dot-macro (x y)
  "This macro will generate code which computes dot product of two vectors.
  If vectors length does not match, it returns NIL
  Example call: (dot-macro (list 1 2 3) (list 3 2 1) will return 10)
  x - list representing first vector, e.g. (list 1 2 3)
  y - list representing second vector, e.. (list 3 2 1)"
  `(if (not (equal (length ,x) (length ,y)))
    NIL
    (if (= (length ,x) 1)
      `(* ,(first ,x) ,(first ,y))
      `(+ (* ,(first ,x) ,(first ,y)) ,(dot (rest ,x) (rest ,y))))))

(defun demonstrate-dot ()
  "This function purpose is to print example usage of DOT function"
  (format t "~%Calling (dot (list 'x 'y 'z) (list '(+ x y) '(+ y z) '(+ z x)))...")
  (print (setq expr (dot (list 'x 'y 'z) (list '(+ x y) '(+ y z) '(+ z x)))))

  (format t "~%~%Evaluating expression with x = 2, y = 3, z = 4...")
  (setq x 2)
  (setq y 3)
  (setq z 4)
  (print (eval expr))
  (format t "~%"))
