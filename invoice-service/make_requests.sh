#!/bin/bash

# List of URLs to randomly choose from
URLS=(
"http://localhost:8082/invoices/1"
"http://localhost:8082/invoices/2"
"http://localhost:8082/invoices/3"
)

# Function to execute random curls
execute_random_curls() {
  # Generate a random number between 1 and 10
  RANDOM_COUNT=$((RANDOM % 10 + 1))
  echo "Executing $RANDOM_COUNT curl requests..."

  # Loop and make random curl requests
  for ((i = 1; i <= RANDOM_COUNT; i++)); do
    # Pick a random URL from the list
    RANDOM_URL=${URLS[RANDOM % ${#URLS[@]}]}
    echo "Curling: $RANDOM_URL"
    curl -s -o /dev/null -w "Response Code: %{http_code}\n" "$RANDOM_URL"
  done
}

# Infinite loop to execute every 30 seconds
while true; do
  execute_random_curls
  echo "Sleeping for 30 seconds..."
  sleep 30
done