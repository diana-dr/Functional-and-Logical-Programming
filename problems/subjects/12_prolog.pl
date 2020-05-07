% aranjamente luate cate k

insert([], E, [E]).
insert([H|T], E, [E, H|T]).
insert([H|T], E, [H|R]) :- insert(T, E, R).

permutari([], []).
permutari([H|T], R) :- permutari(T, R1), insert(R1, H, R).

comb([E|_], 1, [E]).
comb([_|T], N, R) :- comb(T, N, R).
comb([H|T], N, [H|R]) :- N1 is N - 1, comb(T, N1, R).

aranjamente(L, K, R) :- comb(L, K, R1), permutari(R1, R).

main(L, K, R) :- findall(R1, aranjamente(L, K, R1), R).
