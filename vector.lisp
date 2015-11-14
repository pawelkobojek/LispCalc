(defun add-vector (v1 v2)
	(
		if (not (= (length v1) (length v2)))
			(error "Vector's lengths differs")
			(
				if (= (length v1) 1)
					(list `(+ ,(car v1) ,(car v2)))
					(cons `(+ ,(car v1) ,(car v2)) (add-vector (rest v1) (rest v2)))
			)
	)
)

(defun add-vector-macro (v1 v2)
	(
		if (not (= (length v1) (length v2)))
			(error "Vector's lengths differs")
			(
				if (= (length v1) 1)
					(list `(+ ,(car v1) ,(car v2)))
					(cons `(+ ,(car v1) ,(car v2)) (add-vector-macro (rest v1) (rest v2)))
			)
	)
)

(defun eval-vector (v)
	(
		if (= (length v) 1)
			(list (eval (car v)))
			(cons (eval (car v)) (eval-vector (rest v)))
	)
)

(defmacro eval-vector-macro (v)
	`(
		if (= (length ,v) 1)
			(list (eval (car ,v)))
			(cons (eval (car ,v)) (eval-vector-macro (rest ,v)))
	)
)