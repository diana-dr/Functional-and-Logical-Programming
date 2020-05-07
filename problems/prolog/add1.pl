% adds 1 after every even element of a list

add([], _, []).
add([H|T], E, [H, E|R]) :- P is H mod 2, P =:= 0, add(T, E, R), !.
add([H|T], E, [H|R]) :- add(T, E, R).
