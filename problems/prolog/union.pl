% compute the union of two sets

noOcc([], _, 0).
noOcc([H|T], E, R) :- H =:= E, noOcc(T, E, R1), R is R1 + 1.
noOcc([H|T], E, R) :- H =\= E, noOcc(T, E, R).

remove([], _, []).
remove([H|T], E, R) :- H =:= E, remove(T, E, R), !.
remove([H|T], E, [H|R]) :- remove(T, E, R).

union([], [], []).
union([H|T], L2, [H|R]) :- remove([H|T], H, R1), remove(L2, H, R2), union(R1, R2, R).
union([], L2, R) :- union(L2, [], R).
