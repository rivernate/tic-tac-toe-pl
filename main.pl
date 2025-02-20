% main.pl - Entry point

:- [board]. % Include the board module

start_game :-
  init_board(Board),
  display_board(Board).

% Entry point
:- initialization(start_game).
