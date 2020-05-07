% 8.
% a. Determine the successor of a number represented as digits in a list.
% Eg.: [1 9 3 5 9 9] --> [1 9 3 6 0 0]
% b. For a heterogeneous list, formed from integer numbers and list of numbers, determine the successor of a
% sublist considered as a number.
% [1, [2, 3], 4, 5, [6, 7, 9], 10, 11, [1, 2, 0], 6] =>
% [1, [2, 4], 4, 5, [6, 8, 0], 10, 11, [1, 2, 1], 6]

reverse_([], Z, Z).
reverse_([H|T], Z, Acc) :- reverse_(T, Z, [H|Acc]).

reverse_list(L, R) :- reverse_(L, R, []).

successor([], []).
successor([H1, H2|T], R) :- H1 =:= 9, H3 is H2 + 1, successor([H3|T], [0|R]), !.
successor([H|T], R) :- H1 is H + 1, successor(T, [H1|R]).
