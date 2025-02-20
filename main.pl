% main.pl - Entry point

% Include modules
:- [board].
:- [moves].

start_game :-
  init_board(Board),
  display_board(Board),
  Player = x,
  prompt_move(Board, Player, NewBoard),
  display_board(NewBoard).

% prompt_move(+Board, +Player, -NewBoard)
% Prompts the player for a move and applies it.
prompt_move(Board, Player, NewBoard) :-
  format('Player ~w, enter your move (0-8): ', [Player]),
  read_number(Position),
  ( make_move(Board, Player, Position, NewBoard)
  -> true
  ; writeln('Invalid move, try again.'), prompt_move(Board, Player, NewBoard)
  ).

% read_number(-Number)
% Reads a number from input without requiring a period.
read_number(Number) :-
  read_line_to_string(user_input, Input),
  number_string(Number, Input).

% Entry point
:- initialization(start_game).
