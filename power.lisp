(defun power (x y)
  (if (= y 0)
    1
    `(* ,x ,(power x (- y 1)))))

(defmacro power-macro (x y)
  `(if (= ,y 0)
    1
    `(* ,,x ,(power-macro ,x ,(- y 1)))))


;(setq expr (power `x 5))
;(setq x 2)

;(print (eval expr))

;(print (power 2 5))
