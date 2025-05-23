#!/bin/bash

# This script demonstrates input and output redirection in Bash.

# Output Redirection
echo "This message will be saved to a file." > output.txt
echo "You can check the contents of output.txt to see this message."

# Appending to a file
echo "This message will be appended to the file." >> output.txt
echo "You can check the contents of output.txt again to see the appended message."

# Input Redirection
# Create a sample file for input redirection
echo -e "Line 1\nLine 2\nLine 3" > input.txt

# Reading from a file using input redirection
echo "Reading from input.txt:"
cat < input.txt

# Using a command with input redirection
echo "Counting the number of lines in input.txt:"
line_count=$(wc -l < input.txt)
echo "The file input.txt has $line_count lines."

# Cleanup
rm output.txt input.txt