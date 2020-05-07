% f(L:list, Rez: list)
% (i, o) - determ

f(L, Rez) :- f_aux(L, Rez, []).

% f_aux(L:list, Rez: list, Col: list)
% (i, o, i)

f_aux([], Rez, Rez).
f_aux([H|T], Rez, Col):- H mod 2=:=0, !, adaugsf(H, Col, Col1), f_aux(T, Rez, Col1).
f_aux([_|T], Rez, Col) :- f_aux(T, Rez, Col).
