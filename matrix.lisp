(load "vector.lisp")

(defun draw-matrix (m)
	(
		if (= (length m) 1)
			(car m)
			(progn (print (car m)) (draw-matrix (rest m)))
	)
)

(defun op-matrix (operand m1 m2)
	(
		if (not (= (length m1) (length m2)))
			(error "Matrix's lengths differs")
			(
				if (= (length m1) 1)
					(list (op-vector operand (car m1) (car m2)))
					(cons (op-vector operand (car m1) (car m2)) (op-matrix operand (rest m1) (rest m2)))
			)
	)
)

(defmacro op-matrix-macro (operand m1 m2)
	`(
		if (not (= (length ,m1) (length ,m2)))
			(error "Matrix's lengths differs")
			(
				if (= (length ,m1) 1)
					(list (op-vector-macro ,operand (car ,m1) (car ,m2)))
					(cons (op-vector-macro ,operand (car ,m1) (car ,m2)) (op-matrix-macro ,operand (rest ,m1) (rest ,m2)))
			)
	)
)

(defun eval-matrix (m)
	(
		if (= (length m) 1)
			(list (eval-vector (car m)))
			(cons (eval-vector (car m)) (eval-matrix (rest m)))
	)
)

(defmacro eval-matrix-macro (m)
	`(
		if (= (length ,m) 1)
			(list (eval-vector-macro (car ,m)))
			(cons (eval-vector-macro (car ,m)) (eval-matrix-macro (rest ,m)))
	)
)

(defun mul-matrix-by-vector (m v)
	(
		if (= (length m) 1)
		(list (list (dot-vector (car m) v)))
		(cons (list (dot-vector (car m) v)) (mul-matrix-by-vector (rest m) v))
	)
)

(defmacro mul-matrix-by-vector-macro (m v)
	`(
		if (= (length ,m) 1)
		(list (list (dot-vector-macro (car ,m) ,v)))
		(cons (list (dot-vector-macro (car ,m) ,v)) (mul-matrix-by-vector-macro (rest ,m) ,v))
	)
)
