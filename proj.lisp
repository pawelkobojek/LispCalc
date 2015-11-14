(defun ackerman (m n)
  (if (= m 0) (+ n 1)
  (if (and (> m 0) (= n 0))
    (ackerman (- m 1) 1))))

(print (ackerman 1 0))
