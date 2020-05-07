f([], 0).
f([H|T], S) :- f(T, S1), S1 >= 2, !, S = S1 + H.
f([_|T], S) :- f(T, S1), S = S1 + 1.

% remove first n prime numbers from a list

divisible(X,Y) :- 0 is X mod Y, !.
divisible(X,Y) :- X > Y + 1, divisible(X, Y + 1).

isPrime(2) :- true, !.
isPrime(X) :- X < 2, !, false.
isPrime(X) :- not(divisible(X, 2)).

remove([], _, _, []).
remove([H|T], N, P, [H|R]) :- not(isPrime(H)), remove(T, N, P, R).
remove([H|T], N, P, R) :- isPrime(H), P1 is P + 1, P1 =< N, remove(T, N, P1, R), !.
remove([H|T], N, P, [H|R]) :- remove(T, N, P, R).

% all subsets of a given sum S

subsets([], []).
subsets([H|T], [H|R]) :- subsets(T, R).
subsets([_|T], R) :- subsets(T, R).

sum([], 0).
sum([H|T], R) :- sum(T, R1), R is R1 + H.

allsolutions(L, S, R) :- findall(RPartial, main(L, S, RPartial), R).

main(L, S, R) :- subsets(L, R), sum(R, S).
