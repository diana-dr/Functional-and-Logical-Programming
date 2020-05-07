% 3. Write a predicate to determine all decomposition of n (n given, positive), as sum of consecutive natural numbers.

% decomposition(N: number, E: number, R: list)
% N - the number that needs to be decomposed
% R - the list of consecutive numbers whose sum is N
% decomposition(n, e) =	{ findSolution(n, e), e < n
% 			{ findSolution(n, e + 1)
% flow model: (i, i, o)

decomposition(N, E, R) :- E < N, findSolution(N, E, R).
decomposition(N, E, R) :- E < N,  NE is E + 1, decomposition(N, NE, R).

% findSolution(N: number, E: number, R: list)
% flow model: (i, i, o)
% findSolution(n, e) =  { [], n = 0
%			{ e + findSolution(n - e, e + 1), otherwise

findSolution(0, _, []).
findSolution(N, E, [E|R]) :- N >= E,  NN is N - E, NE is E + 1, findSolution(NN, NE, R).

findAllSolutions(N, R) :- findall(R1, decomposition(N, 1, R1), R).

% findAllSolutions(10, R). R = [[1, 2, 3, 4]].
% findAllSolutions(100, R). R = [[9, 10, 11, 12, 13, 14, 15, 16], [18, 19, 20, 21, 22]].% findAllSolutions(1000, R).
% R = [[28, 29, 30, 31, 32, 33, 34, 35|...], [55, 56, 57, 58, 59, 60, 61|...], [198, 199, 200, 201, 202]].
