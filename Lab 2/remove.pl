% a. Define a predicate to remove from a list all repetitive elements.
%                                         { 0, lst = []
%    noOfOccurrences(e, l1, l2, ... ln) = { 1 + noOfOccurrences(e, l2, ... ln), e = l1
%                                         { noOfOccurrences(e, l2, ... ln), otherwise
    
%                       { 0, lst = []
%   remove(l1... ln) =  { l1 U remove(l2...ln), noOfOccurrences(l1) = l1
%                       { remove(l2...ln), otherwise

% nrOccurrences(L:list, E:el, S:integer)
% flow model: (i, i, o) or (i, i, i)
% L – list in which we count the occurrences
% E – the element we are looking for
% S – the result, the number of occurrences

nrOccurrences([], _, 0).
nrOccurrences([H|T], E, S) :- H = E, nrOccurrences(T, E, S1), S is S1 + 1.
nrOccurrences([H|T], E, S) :- H \= E, nrOccurrences(T, E, S).

% remove(L: List, LO:List, R:List)
% flow model: (i, i, o) or (i, i, i)
% L – list from which we remove elements
% LO – copy of the original list,this is where we count occurrences
% R – resulting list
remove([], _, []).
remove([H|T], LO, R) :- nrOccurrences(LO, H, S), S > 1, remove(T, LO, R).
remove([H|T], LO, [H|R]) :- nrOccurrences(LO, H, S), S = 1, remove(T, LO, R).

% removeMain(L: List, R:List)
% flow model: (i, o) or (i, i)
% L – input list
% R – resulting list
removeMain(L, R) :- remove(L,L,R).

% removeMain([10, 11, 12, 9, 11, 0, 16], R). => R = [10, 12, 9, 0, 16] .

% removeMain([], R). => R = [].

% removeMain([10, 11, 12, 13], R). => R = [10, 11, 12, 13].

% removeMain([10, 10, 10, 10], R). => R = [].  
