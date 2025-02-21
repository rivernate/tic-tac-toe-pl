# Variables
PROLOG=swipl
MAIN=main.pl
TESTS=tests/*.pl
DOCKER_IMAGE=prolog-tictactoe

# Default target: Run the game
run:
	$(PROLOG) -g main -t halt -s $(MAIN)

# Run all tests
test:
	$(PROLOG) -g run_tests,halt -s $(TESTS)

# Clean compiled files
clean:
	find . -name "*.qlf" -delete

# Docker targets
docker-build:
	docker build -t $(DOCKER_IMAGE) .

docker-run: docker-build
	docker run -it --rm $(DOCKER_IMAGE)

docker-test: docker-build
	docker run --rm $(DOCKER_IMAGE) swipl -g run_tests,halt -s tests/*.pl

.PHONY: run test clean docker-build docker-run docker-test