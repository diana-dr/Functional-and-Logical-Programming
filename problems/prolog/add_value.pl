add_value([], _, _, _, []).

add_value([H|T], V, POS, INDEX, [H, V|R]) :- POS =:= INDEX,
    POS1 is POS * 2,
    INDEX1 is INDEX + 1,
    add_value(T, V, POS1, INDEX1, R).

add_value([H|T], V, POS, INDEX, [H|R]) :- POS =\= INDEX,
    INDEX1 is INDEX + 1,
    add_value(T, V, POS, INDEX1, R).

add(L, N, R) :- add_value(L, N, 1, 1, R).
