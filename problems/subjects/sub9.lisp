(defun remove_(l a)
	(cond
		((null l) nil)
		((listp (car l)) (cons (remove_ (car l) a) (remove_ (cdr l) a)))
		((equal (car l) a) (remove_ (cdr l) a))
		(t(cons (car l) (remove_ (cdr l) a)))
 	)
)

	(print (remove_ '(1 (2 a (3 a)) (a)) 'a))

(defun reverse_(l)
 (cond
  ((null l) nil)
  (t(append (reverse_ (cdr l)) (list(car l))))
 )
 )


(defun count_(l)
 (cond
  ((null l) 0)
  ((atom l) 0)
  ((not(numberp (car (reverse_ l))))
   (+ 1 (apply '+ (mapcar 'count_ l))))
  (t(apply '+ (mapcar 'count_ l)))	
 )
 )

	(count_ '(a (b 2) (1 c 4) (d 1 (6 f)) ((g 4) 6) f) )
