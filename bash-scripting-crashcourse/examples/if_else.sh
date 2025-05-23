#!/bin/bash

# This script demonstrates the use of if-else statements in Bash.

# Define a variable
number=10

# Check if the number is greater than, less than, or equal to 10
if [ $number -gt 10 ]; then
    echo "The number is greater than 10."
elif [ $number -lt 10 ]; then
    echo "The number is less than 10."
else
    echo "The number is equal to 10."
fi

# Example of checking if a file exists
file="example.txt"

if [ -e "$file" ]; then
    echo "The file '$file' exists."
else
    echo "The file '$file' does not exist."
fi

# Example of checking if a directory exists
directory="example_dir"

if [ -d "$directory" ]; then
    echo "The directory '$directory' exists."
else
    echo "The directory '$directory' does not exist."
fi

# Example of using a command's exit status
command="ls /nonexistent_directory"

if $command; then
    echo "The command executed successfully."
else
    echo "The command failed."
fi