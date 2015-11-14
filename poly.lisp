(load "power.lisp")

(defun build-polynomial (n poly)
  (if (equal (length poly) 1)
    `(* ,(first poly) ,(power 'x n))
    `(+ (* ,(first poly) ,(power 'x n)) ,(build-polynomial (- n 1) (rest poly)))))

(defun integral (n poly)
  (cond
    ((= n -1)
      (if (equal (length poly) 1)
        `(* ,(first poly) (log (abs 'x)))
        `(+ (* ,(first poly) (log (abs 'x))) ,(integral (- n 1) (rest poly)))))
    ((if (equal (length poly) 1)
      `(* ,(first poly) (/ ,(power 'x (+ n 1)) ,(+ n 1)))
      `(+ (* ,(first poly) (/ ,(power 'x (+ n 1)) ,(+ n 1))) ,(integral (- n 1) (rest poly)))))))

(defmacro build-polynomial-macro (n poly)
  `(if (equal (length ,poly) 1)
    `(* ,(first ,poly) ,(power 'x ,n))
    `(+ (* ,(first ,poly) ,(power 'x ,n)) ,(build-polynomial ,(- n 1) (rest ,poly)))))

(defmacro integral-macro (n poly)
  `(cond
    ((= ,n -1)
      (if (equal (length ,poly) 1)
        `(* ,(first ,poly) (log (abs 'x)))
        `(+ (* ,(first ,poly) (log (abs 'x))) ,(integral (- ,n 1) (rest ,poly)))))
    ((if (equal (length ,poly) 1)
      `(* ,(first ,poly) (/ ,(power 'x (+ ,n 1)) ,(+ ,n 1)))
      `(+ (* ,(first ,poly) (/ ,(power 'x (+ ,n 1)) ,(+ ,n 1))) ,(integral (- ,n 1) (rest ,poly)))))))
