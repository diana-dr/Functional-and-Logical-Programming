% reverse(L1: list, L2: list, R: list)
% flow model: (i, i, o)
% L1 - original list
% R - reversed list

reverse_list(L, R) :- reverse(L, [], R).    

reverse([], R, R).    
reverse([H|T], L1, R) :- reverse(T, [H|L1], R).

% sumList(L1: list, L2: list, R: result)
% flow model: (i, i, o)
% L1 - first number for addition written as a list
% L2 - second number for addition written as a list
% R - resulting list, backwards

sumList([], [], []).
sumList()
