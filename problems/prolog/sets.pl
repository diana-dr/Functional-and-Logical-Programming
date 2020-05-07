% difference between two sets

union([], _, []).
union([H1|T1], [H2|T2], [H1, H2|R]) :- union(T1, T2, R).

noOcc([], _, 0).
noOcc([H|T], E, R) :- H =:= E, noOcc(T, E, R1), R is R1 + 1.
noOcc([H|T], E, R) :- H =\= E, noOcc(T, E, R).

remove([], _, []).
remove([H|T], LO, R) :- noOcc(LO, H, S), S > 1, remove(T, LO, R). 
remove([H|T], LO, [H|R]) :- noOcc(LO, H, S), S = 1, remove(T, LO, R).

main(L1, L2, R) :- union(L1, L2, R1), remove(R1, R1, R).
