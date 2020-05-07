(defun count_(l)
	(cond
		((null l) 0)
		((numberp l) 1)
		((atom l) 0)
		(t (apply #'+ (mapcar #'count_ l)))
	)
)


(print (count_ '(1 2 3 (5 6 a (7 s) (9 h)))) )
