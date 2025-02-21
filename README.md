# Prolog Tic Tac Toe with AI

A command-line implementation of Tic Tac Toe in Prolog, featuring an AI opponent using the minimax algorithm.

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
- AI using minimax algorithm
- Input validation
- Clear game state display
- Automatic game end detection
- Docker support for easy deployment

## Requirements

Choose one of the following methods to run the game:

### Local Installation
- SWI-Prolog

### Docker Installation
- Docker

## How to Run

### Using Local SWI-Prolog

1. Ensure you have SWI-Prolog installed on your system
2. Navigate to the project directory
3. Run using make:
   ```bash
   make run
   ```
   
   Or manually start SWI-Prolog:
   ```bash
   swipl
   ?- [main].
   ?- main.
   ```

### Using Docker

1. Build the Docker image:
   ```bash
   make docker-build
   ```

2. Run the game:
   ```bash
   make docker-run
   ```

### Running Tests

Local tests:
```bash
make test
```

Docker tests:
```bash
make docker-test
```

## How to Play

1. When prompted, enter a number between 0-8 corresponding to where you want to place your 'x'
2. The AI will automatically make its move
3. Continue until either:
   - You win
   - The AI wins
   - The game ends in a draw

## Project Structure

- `main.pl`: Entry point and game loop
- `board.pl`: Board representation and display functions
- `moves.pl`: Move validation and execution
- `win_conditions.pl`: Game state checking (win/draw/ongoing)
- `ai.pl`: AI implementation using minimax algorithm
- `Dockerfile`: Container configuration for Docker deployment
- `Makefile`: Build and run commands for both local and Docker environments

## Implementation Details

The game uses several key Prolog concepts:

- Minimax algorithm for AI decision making
- List manipulation for board state
- Pattern matching for win conditions
- Recursion for game flow
- Backtracking for move generation

## Future Improvements

Current limitations and potential enhancements that could be added:

### AI Improvements
- Remove or modify the depth penalty in minimax algorithm to prevent suboptimal choices
- Add position-based scoring to prioritize strategic squares (center and corners)
- Implement alpha-beta pruning for optimization and potentially deeper search
- Add special handling for opening moves
- Enhance scoring system to recognize and prioritize fork opportunities
- Add heuristics to break ties between moves with equal scores

### General Improvements
- Difficulty levels
- Player choice of who goes first
- Human vs Human mode
- Position caching for faster AI responses
- Comprehensive test suite
- Multiple container configurations for different use cases
- CI/CD pipeline for automated testing and deployment

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.