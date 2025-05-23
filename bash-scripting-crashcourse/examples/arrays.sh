#!/bin/bash

# This script demonstrates how to create and manipulate arrays in Bash.

# Declare an array
fruits=("apple" "banana" "cherry" "date" "elderberry")

# Accessing elements of the array
echo "First fruit: ${fruits[0]}"  # Output: apple
echo "Third fruit: ${fruits[2]}"   # Output: cherry

# Adding an element to the array
fruits+=("fig")
echo "Fruits after adding fig: ${fruits[@]}"  # Output: apple banana cherry date elderberry fig

# Modifying an element in the array
fruits[1]="blueberry"
echo "Fruits after changing banana to blueberry: ${fruits[@]}"  # Output: apple blueberry cherry date elderberry fig

# Length of the array
echo "Number of fruits: ${#fruits[@]}"  # Output: 6

# Iterating through the array
echo "All fruits:"
for fruit in "${fruits[@]}"; do
    echo "$fruit"
done

# Getting the index of an element
for i in "${!fruits[@]}"; do
    echo "Index $i: ${fruits[$i]}"
done

# Removing an element from the array (removing 'cherry')
unset 'fruits[2]'
echo "Fruits after removing cherry: ${fruits[@]}"  # Output: apple blueberry date elderberry fig

# Displaying the final array
echo "Final array of fruits: ${fruits[@]}"