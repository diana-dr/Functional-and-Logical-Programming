% all pairs from a list

findAllPairs(L, R) :- findall([A, B], (member(A, L), member(B, L), A \= B), R).
