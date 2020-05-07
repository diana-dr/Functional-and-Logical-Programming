(defun f(l)
	(cond
		((null l) 0)
		((atom l) l)
		((> (f (car l)) 2) (+ (car l) (f (cdr l))))
		(t (f (car l)))
	)
)


(defun g(l)
        (cond
                ((null l) 0)
		((atom l) l)
		((let ((gcar (g (car l) ) ))
                (if (> (gcar) 2) (+ (car l) (g (cdr l)))
                	(apply 'gcar l))
        	))
	)
)


(print( f '(1 2 3 4)))
(print( g '(1 2 3 4)))
