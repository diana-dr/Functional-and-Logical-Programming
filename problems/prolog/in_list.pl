% checks if an element belongs to a list

in_list(E, [E|_]).
in_list(E, [_|T]) :- in_list(E, T).
