# Prolog Tic Tac Toe with AI

A command-line implementation of Tic Tac Toe in Prolog, featuring an unbeatable AI opponent using the minimax algorithm.

## Game Description

This is a classic implementation of Tic Tac Toe where you play against an AI opponent. The game is played on a 3x3 grid where:
- You play as 'x'
- The AI plays as 'o'
- Empty squares are marked as 'empty'

The board positions are numbered 0-8, laid out as follows:

```
 0 | 1 | 2
-----------
 3 | 4 | 5
-----------
 6 | 7 | 8
```

## Features

- Clean command-line interface
- Unbeatable AI using minimax algorithm
- Input validation
- Clear game state display
- Automatic game end detection

## Requirements

- SWI-Prolog

## How to Run

1. Ensure you have SWI-Prolog installed on your system
2. Navigate to the project directory
3. Start SWI-Prolog
4. Load the main program:
   ```prolog
   ?- [main].
   ```
5. Start the game:
   ```prolog
   ?- main.
   ```

## How to Play

1. When prompted, enter a number between 0-8 corresponding to where you want to place your 'x'
2. The AI will automatically make its move
3. Continue until either:
   - You win (highly unlikely against the optimal AI!)
   - The AI wins
   - The game ends in a draw

## Project Structure

- `main.pl`: Entry point and game loop
- `board.pl`: Board representation and display functions
- `moves.pl`: Move validation and execution
- `win_conditions.pl`: Game state checking (win/draw/ongoing)
- `ai.pl`: AI implementation using minimax algorithm

## Implementation Details

The game uses several key Prolog concepts:

- Minimax algorithm for AI decision making
- List manipulation for board state
- Pattern matching for win conditions
- Recursion for game flow
- Backtracking for move generation

## Future Improvements

Potential enhancements that could be added:

- Alpha-beta pruning for AI optimization
- Difficulty levels
- Player choice of who goes first
- Human vs Human mode
- Position caching for faster AI responses
- Comprehensive test suite