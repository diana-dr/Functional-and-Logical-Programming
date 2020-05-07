% list as a set two ways
contains([H|_], H) :- !.
contains([_|T], H) :- contains(T, H).

noOcc([], _,0).
noOcc([H|T], E, R) :- H =:= E, noOcc(T, E, R1), R is R1+1.
noOcc([H|T], E, R) :- H =\= E, noOcc(T, E, R).

set([], []).
set([H|T], R) :- contains(T, H), set(T, R), !.
set([H|T], [H|R]) :- set(T, R). 

set2([], []).
set2([H|T], R) :- noOcc(T, H, O), O >= 1, set2(T, R), !.
set2([H|T], [H|R]) :- set(T, R).

% arragements of k elements with the sum S

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

sum([], _, []).
sum([[H1, H2]|T], S, [[H1, H2]|R]) :- H3 is H1 + H2, H3 =:= S, sum(T, S, R), !.
sum([_|T], S, R) :- sum(T, S, R).

allsolutions(L, N, R) :-
    findall(RPartial, aranjamente(L, N, RPartial), R).

main(L, N, S, R) :- allsolutions(L, N, R1), sum(R1, S, R). 
