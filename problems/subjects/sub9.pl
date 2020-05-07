f([], 0).
f([H|T], S) :- f(T, S1), S1 is S - H.

% f([H|T], S) :- f(T, S1), S is S1 - H.

reverse_lists([], R, R).
reverse_lists([H|T], R, R1) :- reverse_lists(T, R, [H|R1]).


main_reverse([], R, R).
main_reverse([H|T], R, R1) :- is_list(H), !,reverse_lists(H, H1, []),
	main_reverse(T, R, [H1|R1]).
main_reverse([H|T], R, R1) :- main_reverse(T, R, [H|R1]).


subsets_([], []).
subsets_([H|T], [H|R]) :- subsets_(T, R).
subsets_([_|T], R) :- subsets_(T, R).

count_elem([], 0).
count_elem([_|T], S) :- count_elem(T, S1), S is S1 + 1.

all_subsets(L, R) :- findall(R1, subsets_(L, R1), R).

main(L, N, R) :- all_subsets(L, R1), findall(A, (member(A, R1),
	count_elem(A, S), S =:= N), R). 
