% main.pl - Entry point

% Include modules
:- [ai].
:- [board].
:- [moves].
:- [win_conditions].

% main/0 - Entry point to start the game
main :-
  init_board(Board),
  play_game(Board, x).

% play_game(+Board, +CurrentPlayer)
% Handles turn-taking until the game ends.
play_game(Board, _) :-
  game_over(Board, Result),
  display_board(Board),
  end_message(Result), !. % End the game if it's over

play_game(Board, Player) :-
  display_board(Board),
  player_move_or_ai(Board, Player, NewBoard),
  switch_player(Player, NextPlayer),
  play_game(NewBoard, NextPlayer).

% prompt_move_or_ai(+Board, +Player, -NewBoard)
% If Player is human (x), prompt for input; if AI (o), AI makes a move.
player_move_or_ai(Board, x, NewBoard) :-
  prompt_move(Board, x, NewBoard).

player_move_or_ai(Board, o, NewBoard) :- % AI move
  writeln('AI is thinking...'),
  best_move(Board, o, BestMove),
  make_move(Board, o, BestMove, NewBoard),
  format('AI played at position ~w~n', [BestMove]).

% prompt_move(+Board, +Player, -NewBoard)
% Prompts the player for a move and and applies it.
prompt_move(Board, Player, NewBoard) :-
  format('Player ~w, enter your move (0-8): ', [Player]),
  read_number(Position),
  ( make_move(Board, Player, Position, NewBoard)
  -> true
  ; writeln('Invalid move, try again.'), prompt_move(Board, Player, NewBoard)
  ).

% switch_player(+Current, -Next)
switch_player(x, o).
switch_player(o, x).

%end_message(+Result)
end_message(x_wins) :- writeln('Player x wins!').
end_message(o_wins) :- writeln('Player o wins!').
end_message(draw) :- writeln('It\'s a draw!').
