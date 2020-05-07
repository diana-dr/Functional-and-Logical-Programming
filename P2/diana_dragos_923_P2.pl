% 4.
% a. Write a predicate to determine the sum of two numbers written in list representation.
% b. For a heterogeneous list, formed from integer numbers and list of digits, write a predicate to compute the
% sum of all numbers represented as sublists.
% Eg.: [1, [2, 3], 4, 5, [6, 7, 9], 10, 11, [1, 2, 0], 6] => [8, 2, 2].

% sum(L1: list, L2: list, Out: result)
% flow model: (i, i, o)
% L1, L2 - we need the reversed lists for the addition
% Out - the reversed list of the addition

sum(L1, L2, Out) :- reverse(L1, List1), reverse(L2, List2), 
		    add_lists(List1, List2, 0, List3), 
		    reverse(List3, Out).

% add_lists(L1: list, L2: list, C: 0/1, R: result) 
% flow model: (i, i, i, o)
% L1, L2 - the 2 list that need to be added together 
% C - the remain of the addition of the elements
% R - the resulted list reversed
%			{ [], L1 = [] and L2 = []
% add_lists(L1, L2, c)= { L1, L2 = []
%			{ L2, L1 = []
%			{ (a1 + b1 + c) U add_lists(a2..an, b2..bm), (a1 + b1 + c) < 10
%			{ (a1 + b1 + c) % 10 U add_lists(a2..an, b2..bm), (a1 + b1 + c) > 10  

add_lists([], [], 0, []).
add_lists([], [], 1, [1]).
add_lists([], [H|T], C, [H1|T]) :- H1 is H + C.
add_lists([H|T], [], C, [H1|T]) :- H1 is H + C.
add_lists([H|T], [H1|T1], C, [H2|T2]) :- NH is H1 + H,
                         (NH + C > 9 -> NC is 1, H2 is NH + C - 10; H2 is NH + C, NC is 0),
                          add_lists(T, T1, NC, T2).

% addLists(L: list, R: result)
% L - list of sublists
% R - sum of the lists written as a list
% flow model: (i, o)
%		{ [], L = []
% addLists(L) = { sum(l1, addLists(l2..ln)), l1 = list
%		{ addLists(l2..ln), otherwise

addLists([], []).
addLists([H|T], R) :- is_list(H), !, addLists(T, RH), sum(H, RH, R).
addLists([_|T], R) :- addLists(T, R).

% addLists([1, [2, 3], 4, 5, [6, 7, 9], 10, 11, [1, 2, 0], 6], R). R = [8, 2, 2]
% addLists([1, [2, 3], 4, 5, [6, 7, 9], 10, 11], R). R = [7, 0, 2]
% addLists([1, [2, 3], 4, 5, 11], R). R = [2, 3]
