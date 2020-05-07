(defun atoms(l)
	(cond
		((null l) nil)
		((numberp (car l)) (atoms (cdr l)))
		(t (cons (car l) (atoms (cdr l))))
	)
)

(defun pairs (e l)
	(cond
		((null l) nil)	
		(t (cons (list e (car l)) (pairs e (cdr l)) ))
	)
)

(defun subm(l)
    (cond 
	  ((null (cdr l)) nil)
          (t (append (pairs (car l) (cdr l)) (subm (cdr l))))
    )
)

(print (subm (atoms '(A 2 B 3 C D 1) )))
