% sort a list an removing the doubles

minlist([M], M) :- !, true.
minlist([H|T], M) :- minlist(T, M), M < H.
minlist([H|T], H) :- minlist(T, M), M >=  H.

removemin([], _, []).
removemin([H|T], M, R) :- M =:= H, removemin(T, M, R), !.
removemin([H|T], M, [H|R]) :- removemin(T, M, R).

sortlist([], _, []).
sortlist([H|T], M, [H|R]) :- H =:= M, removemin(T, H, LM), sortlist(LM, M, R), !.
sortlist(L, M, [M|R]) :- removemin(L, M, LM), minlist(LM, M2), sortlist(LM, M2, R).

main(L, R) :- minlist(L, M), sortlist(L, M, R).


sort_het_list([], []).
sort_het_list([H|T], [R1|R]) :- is_list(H), main(H, R1), sort_het_list(T, R), !.
sort_het_list([H|T], [H|R]) :- sort_het_list(T, R).
