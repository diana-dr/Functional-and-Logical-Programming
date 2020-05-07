% x^n
power(_, 0, 1).
power(X, N, R) :- power(X, N1, R1), N is N1 + 1, R is R1 * X.

power2(_, 0, 1).
power2(X, N, R1) :- R1 is X ** N.

% permutari, diferenta dintre oricare doua elem consec <= 3

permutari([], []).
permutari([H|T], R) :- permutari(T, RP), inserare(RP, H, R).

inserare([], E, [E]).
inserare([H|T], E, [E, H|T]).
inserare([H|T], E, [H|R]) :- inserare(T, E, R).

diferenta([_]) :- !.
diferenta([H1, H2|T]) :- H3 is abs(H1 - H2), H3 =< 3, diferenta([H2|T]).

oneSolution(L, R) :- permutari(L, R), diferenta(R).

allsolutions(L, R) :-
    findall(RPartial, oneSolution(L,  RPartial), R).
