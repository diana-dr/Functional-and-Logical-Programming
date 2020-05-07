(defun modify(l lvl k)
	(cond
	((null l) nil)
	((and (atom (car l)) (= lvl k)) (cons 0 (modify (cdr l) lvl k)))
	((listp (car l)) (cons (modify (car l) (+ 1 lvl) k) (modify (cdr l) lvl k)))
	(t(cons (car l) (modify (cdr l) lvl k)))
	)
)

(defun find_min(l)
        (cond
                ((null l) +666)
                ((numberp l) l)
                ((atom l) +666)
                (t(apply 'min (mapcar #'find_min l)))
        )
)

(defun count_(l lvl)
	(cond
		((null l) 0)
		((atom l) 0)
		((and (= 1 (mod lvl 2)) (= 0 (mod (find_min l) 2))) 
			(+ 1 (apply '+ (mapcar #'(lambda(a) (count_ a (+ 1 lvl))) l))))
		(t (apply '+ (mapcar #'(lambda(a) (count_ a (+ 1 lvl))) l)))
	)
)

(print (count_ '(a (b 2) (2 c 4) (1 (3 f)) (((g) 4) 2)) 0))
