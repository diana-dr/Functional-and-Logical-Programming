% suma primelor N numere naturale

suma(0, 0).
suma(N, R) :- suma(N1, R1), N is N1 + 1, R is R1 + N.

% aranjamente cu N elemente, avand suma S

comb(0, _, []).
comb(N, [X|T], [X|Comb]) :- N > 0, N1 is N - 1, comb(N1, T, Comb).
comb(N, [_|T], Comb) :- N > 0, comb(N, T, Comb).

% adds the given element on each position of the list
inserare([], E, [E]).
inserare([H|T], E, [E, H|T]).
inserare([H|T], E, [H|R]) :- inserare(T, E, R).

permutari([], []).
permutari([H|T], R) :- permutari(T, RP), inserare(RP, H, R).

aranjamente(L, K, R) :- comb(K, L, RC), permutari(RC, R).
sum([], 0).
sum([H1|T], S) :- sum(T, S1), S is S1 + H1.

checksum([], _, []).
checksum(L, S, L) :- sum(L, S1), S =:= S1.

oneSolution(L, N, S, R) :- aranjamente(L, N, R1), checksum(R1, S, R). 
