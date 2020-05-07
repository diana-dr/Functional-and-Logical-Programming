% 12.
% a. Write a predicate to substitute in a list a value with all the elements of another list.
% b. Remove the n-th element of a list.

substitute([], _, _, []).
substitute([H|T], E, L, [L|R]) :- H =:= E, substitute(T, E, L, R), !.
substitute([H|T], E, L, [H|R]) :- substitute(T, E, L, R).

remove_nth([], _, _, []).
remove_nth([H|T], N, POS, [H|R]) :- N =\= POS, POS1 is POS + 1, remove_nth(T, N, POS1, R).
remove_nth([_|T], N, POS, R) :- N =:= POS, POS1 is POS + 1, remove_nth(T, N, POS1, R).
