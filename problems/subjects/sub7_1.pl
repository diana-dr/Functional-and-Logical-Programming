f([], -1).
f([H|T], S) :- f(T, S1), S1 > 0, !, S is S1 + H.
f([_|T], S) :- f(T, S1), S is S1.

g([], -1).
g([H|T], S) :- g(T, S1), h(S1, H, S).

h(S, H, R) :- S > 0, R is S + H.
h(S, _, R) :- R is S.
