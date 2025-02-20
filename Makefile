# Variables
PROLOG=swipl
MAIN=main.pl
TESTS=tests/*.pl

# Default target: Run the game
run:
	$(PROLOG) -g main -t halt -s $(MAIN)

# Run all tests
test:
	$(PROLOG) -g run_tests,halt -s $(TESTS)

# Clean compiled files
clean:
	find . -name "*.qlf" -delete

.PHONY: run test clean
