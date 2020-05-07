(defun remove_(l n pos)
	(cond
		((null l) nil)
		((= n pos) (remove_ (cdr l) n 1))
		(t (cons (car l) (remove_ (cdr l) n (+ 1 pos))))
	)
)


(defun count_atoms(l)
	(cond
		((null l) 0)
		((numberp (car l)) (+ 1 (count_atoms (cdr l))))
		((listp (car l)) (count_atoms (cdr l)))
		(t(count_atoms (cdr l)))
	)
)

(defun count_sublists(l lvl)
	(cond
		((null l) 0)
		((atom l) 0)
		((and (= 0 (mod lvl 2)) (= 1 (mod (count_atoms l) 2))) 
			(+ 1 (apply '+ (mapcar #'(lambda(a) (count_sublists a (+ 1 lvl))) l))))
		(t (apply '+ (mapcar #'(lambda(a) (count_sublists a (+ 1 lvl))) l)))
	)
)

(print (count_sublists '(a (b 2) (1 c 4) (1 (6 f)) (((g) 4) 6)) 1))
