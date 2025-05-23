#!/bin/bash

# Function to greet the user
greet_user() {
    echo "Hello, $1! Welcome to the Bash scripting tutorial."
}

# Function to add two numbers
add_numbers() {
    local sum=$(( $1 + $2 ))
    echo "The sum of $1 and $2 is: $sum"
}

# Function to check if a number is even or odd
check_even_odd() {
    if (( $1 % 2 == 0 )); then
        echo "$1 is even."
    else
        echo "$1 is odd."
    fi
}

# Function to demonstrate returning a value
calculate_square() {
    local square=$(( $1 * $1 ))
    return $square
}

# Main script execution
echo "Function Examples in Bash"

# Call greet_user function
greet_user "Alice"

# Call add_numbers function
add_numbers 5 10

# Call check_even_odd function
check_even_odd 7

# Call calculate_square function
calculate_square 4
result=$?
echo "The square of 4 is: $result"