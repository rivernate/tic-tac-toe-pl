% board.pl - Board representation and display functions

% Initialize an empty board
init_board([empty, empty, empty,
            empty, empty, empty,
            empty, empty, empty]).

% Display the board on the terminal
display_board(Board) :-
    nl,
    display_row(Board, 0),
    writeln('----------------------'),
    display_row(Board, 3),
    writeln('----------------------'),
    display_row(Board, 6),
    nl.

% Helper predicate to display a single row
display_row(Board, Index) :-
    I2 is Index + 1,
    I3 is Index + 2,
    nth0(Index, Board, C1),
    nth0(I2, Board, C2),
    nth0(I3, Board, C3),
    format(' ~w | ~w | ~w~n', [C1, C2, C3]).

