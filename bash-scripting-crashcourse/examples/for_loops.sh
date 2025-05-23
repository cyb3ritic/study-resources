#!/bin/bash

# This script demonstrates the use of for loops in Bash.

# Example 1: Iterating over a list of items
echo "Example 1: Iterating over a list of items"
fruits=("apple" "banana" "cherry" "date")
for fruit in "${fruits[@]}"; do
    echo "Fruit: $fruit"
done

# Example 2: Iterating over a range of numbers
echo -e "\nExample 2: Iterating over a range of numbers"
for i in {1..5}; do
    echo "Number: $i"
done

# Example 3: Using a for loop with a C-style syntax
echo -e "\nExample 3: Using a for loop with C-style syntax"
for ((i = 0; i < 5; i++)); do
    echo "C-style loop iteration: $i"
done

# Example 4: Iterating over files in a directory
echo -e "\nExample 4: Iterating over files in the current directory"
for file in *; do
    echo "File: $file"
done

# Example 5: Nested for loops
echo -e "\nExample 5: Nested for loops"
for i in {1..3}; do
    for j in {A..C}; do
        echo "Outer loop: $i, Inner loop: $j"
    done
done

# End of script