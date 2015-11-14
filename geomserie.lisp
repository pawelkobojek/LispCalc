(defun int_geomserie (qn q n)
	(
		if (= n 0)
			qn
			`(+ ,qn ,(int_geomserie `(* ,qn ,q) q (- n 1)))
	)
)

(defun geomserie (q n)
	(int_geomserie 1 q n)
)

(defmacro macroint_geomserie (qn q n)
	(
		if (= n 0)
			qn
			`(list '+ ,qn (macroint_geomserie ,`(list '* ,qn ,q) ,q ,(- n 1)))
	)
)

(defmacro macrogeomserie (q n)
	`(macroint_geomserie 1 ,q ,n)
)