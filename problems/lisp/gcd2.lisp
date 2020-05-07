(DEFUN 	gcd2(A B)
	(COND
		((AND (NOT (NUMBERP A)) (NOT NUMBERP B)) NIL)
		((> A B) (gcd (mod A B) B))
		(t (gcd A (mod B A)))
	)
)

(print(gcd2 140 1400))
