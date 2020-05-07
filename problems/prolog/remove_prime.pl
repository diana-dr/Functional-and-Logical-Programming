
divisible(X, Y) :- 0 is X mod Y.
divisible(X, Y) :- X > Y + 1, divisible(X, Y + 1). 

prime(2) :- true, !.
prime(A) :- A < 2, false.
prime(A) :- not(divisible(A, 2)).

remove_prime([], []).
remove_prime([H|T], R) :- prime(H), remove_prime(T, R), !.
remove_prime([H|T], [H|R]) :- remove_prime(T, R).
