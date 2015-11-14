(setq exponent_precision 10)

(defun int_exponent (xn sn x n)
	(
		if (= n exponent_precision) 
			`(/ ,xn ,sn)
			(
				if (= n 0)
					`(+ 1 ,(int_exponent `(* ,xn ,x) (* sn (+ n 1)) x (+ n 1)))
					`(+ (/ ,xn, sn) ,(int_exponent `(* ,xn ,x) (* sn (+ n 1)) x (+ n 1)))
			)
	)
)

(defun exponent (x)
	`(float ,(int_exponent x 1 x 0)))