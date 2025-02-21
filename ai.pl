% ai.pl - AI logic using the minimax algorithm

:- [moves].
:- [win_conditions].

% best_move(+Board, +Player, -BestMove)
% Finds the BestMove for Player using the minimax algorithm.
best_move(Board, Player, BestMove) :-
  findall(
    Score-Move,
    ( valid_move(Board, Move),
      make_move(Board, Player, Move, NewBoard),
      minimax(NewBoard, Player, Score)
    ),
    Moves
  ),
  select_best_move(Player, Moves, BestMove).

% valid_move(+Board, -Position)
% True if Position is a valid move (empty spot).
valid_move(Board, Position) :-
  nth0(Position, Board, empty).

% minimax(+Board, +Player, -Score)
% Evaluates the Board and assigns a Score from Players perspective.
minimax(Board, Player, Score) :-
  game_over(Board, Result),
  score(Result, Player, Score), !.

minimax(Board, Player, Score) :-
  switch_player(Player, Opponent),
  findall(
    OpponentScore,
    ( valid_move(Board, Move),
      make_move(Board, Opponent, Move, NewBoard),
      minimax(NewBoard, Opponent, OpponentScore)
    ),
    Scores
  ),
  ( Player = x -> max_list(Scores, Score) ; min_list(Scores, Score) ).

% score(+Result, +Player, -Score)
% Assigns score based on the Result from Players perspective.
score(x_wins, x, 1).
score(o_wins, o, -1).
score(x_wins, o, -1).
score(o_wins, x, 1).
score(draw, _, 0).
score(ongoing, _, 0).

% select_best_move(+Player, +Moves, -BestMove)
% Selects the best move based on the scores for the current Player
select_best_move(x, Moves, BestMove) :- keysort(Moves, Sorted), last(Sorted, _-BestMove).
select_best_move(o, Moves, BestMove) :- keysort(Moves, [_-BestMove | _ ]).
