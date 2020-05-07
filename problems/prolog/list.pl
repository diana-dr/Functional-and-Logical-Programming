f([],[]).
f([H|T], [H|Rez]) :- H mod 2 =:= 0, !, f(T,Rez).
f([_|T], Rez) :- f(T,Rez).
