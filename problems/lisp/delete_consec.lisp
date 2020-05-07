(defun delete_(l)
	(cond
		((null l) 0)
		((and (numberp (car l))(numberp (cadr l))) 
			(if (= 1 (cadr l) (car l))
				(delete_ (cddr l))
			))
		(t (delete_ (cdr l)))
	)
)

(print (delete_ '(1 2 c 4 6 7 8 i 10 j) ))
