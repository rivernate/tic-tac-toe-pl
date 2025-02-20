% win_conditions.pl - Check win, draw and game-over conditions

% winning_conbinations(-Combo)
% Defines all possible winnning combinations.
winning_combinations([0, 1, 2]).
winning_combinations([3, 4, 5]).
winning_combinations([6, 7, 8]).
winning_combinations([0, 3, 6]).
winning_combinations([1, 4, 7]).
winning_combinations([2, 5, 8]).
winning_combinations([0, 4, 8]).
winning_combinations([2, 4, 6]).

% win(+Board, +Player)
% True if Player has a winning combination on the Board.
win(Board, Player) :-
  winning_combinations([A, B, C]),
  nth0(A, Board, Player),
  nth0(B, Board, Player),
  nth0(C, Board, Player).

% draw(+Board)
% True if the Board is full an no player has won.
draw(Board) :-
  \+ member(empty, Board),
  \+ win(Board, x),
  \+ win(Board, o).

% game_over(+Board, -Result)
% Determines the game outcome.
% Result is 'x_wins', 'o_wins', 'draw', or 'ongoing'.
game_over(Board, x_wins) :- win(Board, x), !.
game_over(Board, o_wins) :- win(Board, o), !.
game_over(Board, draw) :- draw(Board), !.
game_over(_, ongoing).
