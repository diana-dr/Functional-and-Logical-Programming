% 2 (Prolog) : Sa se elimine primele n numere prime dintr-o lista.

divisible(X, Y) :- 0 is X mod Y, !.
divisible(X, Y) :- X > Y + 1, Y1 is Y + 1, divisible(X, Y1). 

prime(2) :- true, !.
prime(E) :- E < 2, !, false.
prime(E) :- not(divisible(E, 2)).


remove_prime([], _, []).
remove_prime([H|T], N, R) :- prime(H), N > 0, !, N1 is N - 1, remove_prime(T, N1, R).
remove_prime([H|T], N, [H|R]) :- remove_prime(T, N, R).

% 3 (Prolog) : Sa se determine lista continand toate submultimile avand elementele intr-o lista data, de suma s.

subsets_([], []).
subsets_([H|T], [H|R]) :- subsets_(T, R).
subsets_([_|T], R) :- subsets_(T, R).


suma_([], 0).
suma_([H|T], R) :- suma_(T, R1), R is R1 + H.

all_subsets(L, R) :- findall(R1, subsets_(L, R1), R).

main(L, S, R) :- all_subsets(L, R1), findall(A, (member(A, R1), suma_(A, S1),
		S1 =:= S), R).
