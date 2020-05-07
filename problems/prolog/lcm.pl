gcd(A, 0, A) :- !.
gcd(0, B, B) :- !.
gcd(A, B, R) :- A >= B, A1 is A mod B, gcd(A1, B, R), !.
gcd(A, B, R) :- B1 is B mod A, gcd(A, B1, R), !.

lcm(A, B, R) :- gcd(A, B, R1), R is A * B / R1.

lcm_list([], 0).
lcm_list([H1, H2], R) :- lcm(H1, H2, R).
lcm_list([H1, H2|T], R) :- lcm(H1, H2, H3), lcm_list([H3|T], R).
