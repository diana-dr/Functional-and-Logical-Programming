subsets([], []).
subsets([H|T], [H|R]) :- subsets(T, R).
subsets([_|T], R) :- subsets(T, R).

suma([], 0).
suma([H|T], S) :- suma(T, S1), S is S1 + H.

findAllSubsets(L, R) :- findall(RPartial, subsets(L, RPartial), R).

pairs(L, R) :- findAllSubsets(L, R1), 
		findall([A, B], (member(A, R1), member(B, R1),
		 A \= B, suma(A, S1), suma(B, S2), S1 =:= S2), R). 
