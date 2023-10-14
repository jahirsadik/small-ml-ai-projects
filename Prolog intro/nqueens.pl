nqueens(N, Solution) :-
    length(Solution, N),               % create a list of length N
    Solution ins 1..N,                 % set the domain of each element to be 1..N
    all_distinct(Solution),            % ensure that no two elements are the same
    constrain_diagonals(Solution),     % ensure that no two queens are on the same diagonal
    label(Solution).                   % assign values to each element

constrain_diagonals([]).
constrain_diagonals([X|Xs]) :-
    constrain_diagonals(Xs, X, 1),
    constrain_diagonals(Xs).

constrain_diagonals([], _, _).
constrain_diagonals([Y|Ys], X, D) :-
    abs(X-Y) #\= D,
    D1 #= D+1,
    constrain_diagonals(Ys, X, D1).
