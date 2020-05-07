add_([], _, _, _, []).
add_([H|T], E, POS, IDX, [H,E|R]) :- POS =:= IDX, !, IDX1 is IDX + 1, add_(T, E, 1, IDX1, R).
add_([H|T], E, POS, IDX, [H|R]) :- POS1 is POS + 1, add_(T, E, POS1, IDX, R).


create_list(_, 0, []).
create_list(N, M, [N|R]) :- M >= 0, N1 is N + 1, M1 is M - 1, create_list(N1, M1, R).

inserare([], E, [E]).
inserare([H|T], E, [E, H|T]).
inserare([H|T], E, [H|R]) :- inserare(T, E, R).

permutari([], []).
permutari([H|T], R) :- permutari(T, R1), inserare(R1, H, R).

check_([_]).
check_([H1, H2|T]) :- H3 is H1 - H2, abs(H3) =< 2, !, check_([H2|T]).

find_permutations(L, R) :- findall(R1, permutari(L, R1), R).

main(N, R) :- create_list(N, N, L), find_permutations(L, R1), findall(A, (member(A, R1), check_(A)), R).
