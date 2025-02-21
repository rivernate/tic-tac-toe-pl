FROM swipl:latest

WORKDIR /app

# Copy all Prolog source files
COPY *.pl ./
COPY tests ./tests/

# Set the entry point to run the game
ENTRYPOINT ["swipl", "-g", "main", "-t", "halt", "-s", "main.pl"]