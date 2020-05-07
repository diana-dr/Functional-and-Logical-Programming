(defun return_n(l n pos)
	( cond
		((null l) NIL)
		((= n pos) (CAR l))
		(t (return_n (cdr l) n (+ pos 1)))
	)
)

(defun main(l n)
	(return_n l n 1)
)

(print (main '(1 2 3 4 5 6 7 8 9 10) '5))
