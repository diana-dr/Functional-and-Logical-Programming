% removeInc(L:list, R:list)
% flow model: (i,o) or (i,i)
% L – list from which we remove the increasing sequences
% R – resulting list
removeInc([], []).
removeInc([H], [H]).
removeInc([H1,H2], []):- H1 < H2.
removeInc([H1,H2,H3|T], R):-
H1 < H2,
H2 < H3,
removeInc([H2,H3|T], R).
removeInc([H1,H2,H3|T], R):-
H1 < H2,
H2 >= H3,
removeInc([H3|T], R).
removeInc([H1,H2|T], [H1|R]):-
H1 >= H2,
removeInc([H2|T], R).
