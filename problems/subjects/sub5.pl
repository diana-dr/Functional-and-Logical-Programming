f([], 0).
f([H|T], S) :- f(T, S1), S1 >= 2, !, S = S1  + H.
f([_|T], S) :- f(T, S1), S = S1 + 1.
