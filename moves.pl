% moves.pl - Mobe logic for Tic Tac Toe

% make_move(+Board, +Player, +Position, -NewBoard)
% Places Players symbol at position on Board, producing NewBoard.
% Fails if the Position is invalid or occupied.
make_move(Board, Player, Position, NewBoard) :-
  nth0(Position, Board, empty),  % Ensure position is empty
  replace(Board, Position, Player, NewBoard). % Replace empty position with Players symbol

% replace(+List, +Index, +Element, -NewList)
% Replaces element at Index in List with Element, producing NewList.
replace([_|T], 0, Element, [Element|T]).
replace([H|T], Index, Element, [H|NewT]) :-
  Index > 0,
  NextIndex is Index - 1,
  replace(T, NextIndex, Element, NewT).

% read_number(-Number)
% Reads a number from input without requiring a period.
read_number(Number) :-
  read_line_to_string(user_input, Input),
  number_string(Number, Input).
