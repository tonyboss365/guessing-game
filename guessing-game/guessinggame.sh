#!/usr/bin/env bash

# guessinggame.sh - user guesses number of files in current directory

# function: return number of items in current directory (one per line)
file_count() {
    ls -1 | wc -l
}

# store correct answer once at start
correct_count=$(file_count)

echo "Welcome to the Bash Guessing Game!"
echo "Try to guess how many files are in the current directory."

# loop until the correct guess
while true; do
    read -p "Enter your guess: " guess

    # ensure numeric input (non-negative integer)
    if [[ ! $guess =~ ^[0-9]+$ ]]; then
        echo "Please enter a non-negative integer."
        continue
    fi

    if (( guess < correct_count )); then
        echo "Too low — try again."
    elif (( guess > correct_count )); then
        echo "Too high — try again."
    else
        echo "Congratulations! You guessed correctly: $correct_count files."
        break
    fi
done
