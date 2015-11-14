(defun dot (x y)
  (if (not (equal (length x) (length y)))
    NIL
    (if (= (length x) 1)
      `(* ,(first x) ,(first y))
      `(+ (* ,(first x) ,(first y)) ,(dot (rest x) (rest y))))))

(defmacro dot-macro (x y)
  `(if (not (equal (length ,x) (length ,y)))
    NIL
    (if (= (length ,x) 1)
      `(* ,(first ,x) ,(first ,y))
      `(+ (* ,(first ,x) ,(first ,y)) ,(dot (rest ,x) (rest ,y))))))
