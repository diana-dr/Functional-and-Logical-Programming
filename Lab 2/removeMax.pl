% b. Remove all occurrence of a maximum value from a list on integer numbers.
%                         { max, lst = []
% maxlist(l1...ln, max) = { maxlist(l2...ln, l1), max < l1
%                         { maxlist(l2...ln, max), max > l1
    
%                           { [], lst = []
% removeMax(l1...ln, max) = { removeMax(l2...ln), l1 = max
%                           { l1 + removeMax(l2...ln), otherwise

% maxValue(L:list, M:max)
% flow model: (i, o)
% L - list in which we search for the maximum value
% M - the result of the search for the maximum

maxlist([M],M) :- !, true.
maxlist([H|T], M) :- maxlist(T, M), M >= H.
maxlist([H|T], H) :- maxlist(T, M), M <  H.

% removeMax(L: list, LO: list, R: result)
% flow model: (i, i, o)
% L - original list
% LO - copy of the list 
% R - list resulted after deleting the max

removeMax([], _,[]).
removeMax([H|T], LO, R) :- maxlist(LO, S), S =:= H, removeMax(T, LO, R).
removeMax([H|T], LO, [H|R]) :- maxlist(LO, S), S =\= H, removeMax(T, LO, R).

% remove_max_main(L: list, R: list)
% flow model: (i, o)
% L - list from where we remove the maximum
% R - the resulted list without the max

remove_max_main(L, R) :- removeMax(L, L, R).

% remove_max_main([10, 10, 10, 10], R). => R = [].
% remove_max_main([10, 0, 19, 18, 19, 20, 20, 20, 1], R). => R = [10, 0, 19, 18, 19, 1].
% remove_max_main([-1, -2, -3, -4, 0], R). => R = [-1, -2, -3, -4] . 
