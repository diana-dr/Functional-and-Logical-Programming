; 4. sa se dea 2 implementari recursive in lisp pentru a inlocui un element e intro lista neliara cu altu care se da.

(defun replace_(l e1 e)
	(cond
	((null l) nil)
	((equal l e1) e)
	((atom l) l)
	(t (mapcar #'(lambda(a) (replace_ a e1 e)) l))
	)
)

(defun replace2(l e1 e)
	(cond
		((null l) nil)
		((listp (car l)) (cons (replace2 (car l) e1 e) (replace2 (cdr l) e1 e)))
		((equal (car l) e1) (cons e (replace2 (cdr l) e1 e)))
		(t (cons (car l) (replace2 (cdr l) e1 e)))
	)
)


; 5. sa se det nr sublistelor care au suma elementelor de la toate nivelurilor para. folosind o fc map

(defun suma(L)
	(cond
		((null l) 0)
		((numberp (car l)) (+ (car l) (suma (cdr l))))
		(t (suma (cdr l)))
	)
)

(defun count_sublists(l)
	(cond
	((null l) 0)
	((and (listp l) (= 0 (mod (suma l) 2))) (+ 1 (apply '+ (mapcar #'count_sublists l))))
	((atom l) 0)
	(t (apply '+ (mapcar #'count_sublists l)))
	)
)

(print(count_sublists '(1 2 3 (2 2 a (4 4 q)) 6 5 (7 7) (8 (9 9 a t))) ))

