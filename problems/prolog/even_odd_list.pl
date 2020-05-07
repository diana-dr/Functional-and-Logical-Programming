% decompose a list separating the even and the odd elements in two different lists
% and writing the number of elements for each list

even([], 0).
even([H|T], R) :- H mod 2 =:= 0, even(T, R1), R is R1 + 1.
even([H|T], R) :- H mod 2 =\= 0, even(T, R).

odd([], 0).
odd([H|T], R) :- H mod 2 =\= 0, odd(T, R1), R is R1 + 1.
odd([H|T], R) :- H mod 2 =:= 0, odd(T, R).

decompose_even([], []).
decompose_even([H|T], [H|R]) :- H mod 2 =:= 0, decompose_even(T, R).
decompose_even([H|T], R) :- H mod 2 =\= 0, decompose_even(T, R).

decompose_odd([], []).
decompose_odd([H|T], [H|R]) :- H mod 2 =\= 0, decompose_odd(T, R).
decompose_odd([H|T], R) :- H mod 2 =:= 0, decompose_odd(T, R).

even_odd(L, [R1,R2,R3,R4]) :- decompose_odd(L, R1),
	 decompose_even(L, R2), odd(L, R3), even(L, R4).
