gcd(0, B, B).
gcd(A, 0, A).
gcd(A, B, R) :- A >= B, A1 is A mod B, gcd(A1, B, R), !.
gcd(A, B, R) :- B1 is B mod A, gcd(A, B1, R).
