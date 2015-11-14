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

(defun op-matrix-macro (operand m1 m2)
	(
		if (not (= (length m1) (length m2)))
			(error "Matrix's lengths differs")
			(
				if (= (length m1) 1)
					(list (op-vector-macro (car m1) (car m2)))
					(cons (op-vector-macro (car m1) (car m2)) (op-matrix-macro (rest m1) (rest m2)))
			)
	)
)

(defun add-matrix (m1 m2)
	(op-matrix '+ m1 m2)
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

(defun car-matrix (m)
	(
		if (= (length m) 1)
			(list (car (car m)))
			(cons (car (car m)) (car-matrix (rest m)))
	)
)

(defmacro car-matrix-macro (m)
	`(
		if (= (length ,m) 1)
			(list (car (car ,m)))
			(cons (car (car ,m)) (car-matrix-macro (rest ,m)))
	)
)

(defun rest-matrix (m)
	(
		if (= (length m) 1)
			(list (rest (car m)))
			(cons (rest (car m)) (rest-matrix (rest m)))
	)
)

(defmacro rest-matrix-macro (m)
	`(
		if (= (length ,m) 1)
			(list (rest (car ,m)))
			(cons (rest (car ,m)) (rest-matrix-macro (rest ,m)))
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

(defun concat-matrix (m1 m2)
	(
		if (= (length m1) 1)
			(list (append (car m1) (car m2)))
			(cons (append (car m1) (car m2)) (concat-matrix (rest m1) (rest m2)))
	)
)

(defun concat-matrix-macro (m1 m2)
	`(
		if (= (length ,m1) 1)
			(list (append (car ,m1) (car ,m2)))
			(cons (append (car ,m1) (car ,m2)) (concat-matrix-macro (rest ,m1) (rest ,m2)))
	)
)

(defun mul-matrix (m1 m2)
	(
		if (= (length (car m2)) 1)
			(mul-matrix-by-vector m1 (car-matrix m2))
			(concat-matrix (mul-matrix-by-vector m1 (car-matrix m2)) (mul-matrix m1 (rest-matrix m2)))
	)
)

; (defun mul-matrix-macro (m1 m2)
	; `(
		; if (= (length (car ,m2)) 1)
			; (mul-matrix-by-vector-macro ,m1 (car-matrix-macro ,m2))
			; (concat-matrix-macro (mul-matrix-by-vector ,m1 (car-matrix-macro ,m2)) (mul-matrix-macro ,m1 (rest-matrix-macro ,m2)))
	; )
; )