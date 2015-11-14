(defun op-vector (operand v1 v2)
	(
		if (not (= (length v1) (length v2)))
			(error "Vector's lengths differs")
			(
				if (= (length v1) 1)
					(list `(,operand ,(car v1) ,(car v2)))
					(cons `(,operand ,(car v1) ,(car v2)) (op-vector operand (rest v1) (rest v2)))
			)
	)
)

(defun op-vector-macro (operand v1 v2)
	(
		if (not (= (length v1) (length v2)))
			(error "Vector's lengths differs")
			(
				if (= (length v1) 1)
					(list `(,operand ,(car v1) ,(car v2)))
					(cons `(,operand ,(car v1) ,(car v2)) (op-vector-macro operand (rest v1) (rest v2)))
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

(defun add-vector (v1 v2)
	(op-vector '+ v1 v2)
)

(defun mul-vector (v1 v2)
	(op-vector '* v1 v2)
)

(defun reduce-vector (operand v)
	(
		if (= (length v) 1)
			(car v)
			`(,operand ,(car v) ,(reduce-vector operand (rest v)))
	)
)

(defun reduce-vector-macro (operand v)
	(
		if (= (length v) 1)
			(car v)
			`(,operand ,(car v) ,(reduce-vector operand (rest v)))
	)
)

(defun dot-vector (v1 v2)
	(reduce-vector '+ (mul-vector v1 v2))
)

(defun dot-vector-macro (v1 v2)
	(reduce-vector-macro '+ (op-vector-macro '* v1 v2))
)