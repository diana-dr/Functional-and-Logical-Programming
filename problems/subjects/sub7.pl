contains([E|_], E) :- true, !.
contains([_|T], E) :- contains(T, E).


to_set([], []).
to_set([H|T], R) :- contains(T, H), !, to_set(T, R).
to_set([H|T], [H|R]) :- to_set(T, R).


noOcc([], _,0).
noOcc([H|T], E, R) :- H =:= E, !, noOcc(T, E, R1), R is R1 + 1.
noOcc([_|T], E, R) :- noOcc(T, E, R).

inserare([], E, [E]).
inserare([H|T], E, [E, H|T]).
inserare([H|T], E, [H|R]) :- inserare(T, E, R).

permutari([], []).
permutari([H|T], R) :- permutari(T, R1), inserare(R1, H, R).

comb([E|_], 1, [E]).
comb([_|T], N, R) :- comb(T, N, R).
comb([H|T], N, [H|R]) :- N1 is N - 1, comb(T, N1, R).


aranjamente(L, N, R) :- comb(L, N, R1), permutari(R1, R).

all_(L, N, R) :- findall(R1, aranjamente(L, N, R1), R).

product_([E], E).
product_([H|T], P) :- product_(T, P1), P is P1 * H.

main(L, K, P, R) :- all_(L, K, R1), findall(A, (member(A, R1), product_(A, P1), P1 =:= P), R). 
