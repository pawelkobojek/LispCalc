(setq exponent_precision 10)

(defun int_exponent (xn sn x n)
	(
		if (= n exponent_precision) 
			(/ xn sn)
			(+ (/ xn sn) (int_exponent (* xn x) (* sn n) x (+ n 1)))
	)
)

(setq exponent '(float (int_exponent x 1 x 1)))