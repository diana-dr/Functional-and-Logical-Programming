(defun f(l)
	(cond
		((atom l) -1)
		((> (f (car l)) 0) (+ (car l) (f (car l)) (f (cdr l))))
		(t( f(cdr l)))
	)
)

(defun g(l)
	(cond
		((atom l) -1)
		((let ((fcar (g (car l) ) )) 
			(if (> fcar 0) (+ (car l) fcar (g (cdr l) ) ) ) 
		))
		(t (g (cdr l)))
	)
)

(print (f '(1 2 3 4 5 18181)))
(print( g '(1 2 3 4 5 18181)))
