(DEFUN gcd_(a b)
	(COND
		((= b 0) a)
		(t (gcd_ b (mod a b)))
	)
)

(DEFUN gcd_list(L)
	(COND	
		((NULL L) 0)
		((NUMBERP (CAR L)) (gcd_ (CAR L) (gcd_list (CDR L))))
		(t (gcd_ (gcd_list (CAR L)) (gcd_list (CDR L))))
	)
)

