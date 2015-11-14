(defun int_exponent (xn sn x n exponent_precision)
	(
		if (= n exponent_precision) 
			`(/ ,xn ,sn)
			(
				if (= n 0)
					`(+ 1 ,(int_exponent `(* ,xn ,x) (* sn (+ n 1)) x (+ n 1) exponent_precision))
					`(+ (/ ,xn, sn) ,(int_exponent `(* ,xn ,x) (* sn (+ n 1)) x (+ n 1) exponent_precision))
			)
	)
)

(defun exponent (x n)
	`(float ,(int_exponent x 1 x 0 n)))