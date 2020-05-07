remove_([], _, _, []).
remove_([_|T], POS, IDX, R) :- POS =:= IDX, !, IDX1 is IDX + 1, POS1 is POS * 2, remove_(T, POS1, IDX1, R).
remove_([H|T], POS, IDX, [H|R]) :- IDX1 is IDX + 1, remove_(T, POS, IDX1, R).

main(L, N, R) :- remove_(L, N, 1, R).

subsets_([],[]).
subsets_([H|T], [H|R]) :- subsets_(T, R).
subsets_([_|T], R) :- subsets_(T, R).

all_subsets(L, R) :- findall(R1, subsets_(L, R1), R).

check_length([]) :- true, !.
check_length([_, _|T]) :- check_length(T).

main(L, R) :- all_subsets(L, R1), findall(A, (member(A, R1), check_length(A)) ,R).
