remove([], _, []).
remove([H|T], E, R) :- H =:= E, remove(T, E, R), !.
remove([H|T], E, [H|R]) :- remove(T, E, R).

list_to_set([],[]).
list_to_set([H|T], [H|R]) :- remove(T, H, R1), list_to_set(R1, R).  
