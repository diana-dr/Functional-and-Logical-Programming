sum(L1, L2, Out) :- reverse(L1, List1), reverse(L2, List2),
                    add_lists(List1, List2, 0, List3),
                    reverse(List3, Out).

% add_lists(L1: list, L2: list, C: 0/1, R: result) 
% flow model: (i, i, i, o)
% L1, L2 - the 2 list that need to be added together 
% C - the remain of the addition of the elements
% R - the resulted list reversed
%                       { [], L1 = [] and L2 = []
% add_lists(L1, L2, c)= { L1, L2 = []
%                       { L2, L1 = []
%                       { (a1 + b1 + c) U add_lists(a2..an, b2..bm), (a1 + b1 + c) < 10
%                       { (a1 + b1 + c) % 10 U add_lists(a2..an, b2..bm), (a1 + b1 + c) > 10  

add_lists([], [], 0, []).
add_lists([], [], C, [C]).
add_lists([], [H|T], C, [H1|T]) :- H1 is H + C.
add_lists([H|T], [], C, [H1|T]) :- H1 is H + C.
add_lists([H|T], [H1|T1], C, [H2|T2]) :- NH is H1 * H,
                         (NH + C > 9 -> NC is 1, H2 is NH + C - 10; H2 is NH + C, NC is 0),
                          add_lists(T, T1, NC, T2).
