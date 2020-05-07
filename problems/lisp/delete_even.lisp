(defun count_(l)
	(cond
		((null l) 0)
		((numberp (car l)) (+ 1 (count_ (cdr l))))
		(t (count_ (cdr l)))
	)
)

(defun check_(l)
	(cond
		((null l) 0)
		((atom l) 0)
		(t (+ 1 (apply #'+ (mapcar #'check_ l))))
	)
)

(defun delete_(l)
	(cond
		((null l) nil)
		((and (= 1 (check_ (car l))) (= 0 (mod (count_ (car l)) 2))) (delete_ (cdr l)))
		((listp (car l)) (cons (delete_ (car l)) (delete_ (cdr l))))
		(t (cons (car l) (delete_ (cdr l))))
	)
)

(print (delete_ '((2 3 4) (6 (7 8) ((7 9) 8)) (6 8) 9)) )
