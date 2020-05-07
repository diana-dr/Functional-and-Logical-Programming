reverse_(0, _, 0).
reverse_(X, 1, X).
reverse_(X1, N1, R1) :- X is X1 div 10, N is N1 - 1,
			R is X1 mod 10 * 10^N1 + R1, reverse_(X, N, R).  
