(defun replace_(l)
	(cond
	((null l) nil)
	((and (numberp (car l)) (= 0 (mod (car l) 2))) (cons (+ 1 (car l)) (replace_ (cdr l))))
	((listp (car l)) (cons (replace_ (car l)) (replace_ (cdr l))))
	(t(cons (car l) (replace_ (cdr l))))
	)
)


(defun max_(l)
	((null l) -666)
	((numberp l) l)
	((atom l) -666)
	(t (apply 'max (mapcar #'max_ l)))
)

(defun count_(l lvl)
	(cond
	((null l) 0)
	((atom l) 0)
	((and (= 0 (mod (max_ l) 2)) (= 1 (mod lvl 2))) 
		(+ 1 (apply '+ (mapcar #'(lambda(a) (count_ a (+ 1 lvl))) l))))
	(t (apply '+ (mapcar #'(lambda(a) (count_ a (+ 1 lvl))) l)))
	)
)

(print (count_ '(a (b 2) (1 c 4) (1 (6 f)) (((g) 4) 6)) 1))
