(DEFUN find_min(l)
	(cond
		((null l) +666)
		((numberp (car l)) (min (car l) (find_min (cdr l))))
		((atom l) +666)
		(t (find_min (cdr l)))
	)
)

(defun counts(l lvl)
	(cond
		((null l) 0)
		((atom l) 0)
		((and ( = 1 (mod lvl 2)) (= 0 (mod (find_min l) 2))) 1)
		(t (apply '+ (mapcar #'(lambda(a) (counts a (+ 1 lvl))) l)))
	)
)

(print (counts '(a (b 2) (2 c 4) (1 (3 f))(((g)4)2)) 1))
