remove([], _, []).
remove([H|T], E, R) :- H =:= E, remove(T, E, R).
remove([H|T], E, [H|R]) :- H =\= E, remove(T, E, R).

noOccurrences([], _, 0).
noOccurrences([H|T], E, R) :- H =:= E, noOccurrences(T, E, R1), R is R1 + 1.
noOccurrences([H|T], E, R) :- H =\= E, noOccurrences(T, E, R).

pairs([], []).
pairs([H|T], [[H, Occ]|R]) :- noOccurrences([H|T], H, Occ), remove(T, H, RR), pairs(RR, R).
