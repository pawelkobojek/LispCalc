(defun int_exponent (xn sn x n maxn)
	(
		if (= n maxn) 
			(/ xn sn)
			(+ (/ xn sn) (int_exponent (* xn x) (* sn n) x (+ n 1) maxn))
	)
)

(defun exponent (x)
	(float (int_exponent x 1 x 1 10))
)