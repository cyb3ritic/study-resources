<!-- filepath: /bash-scripting-tutorial/bash-scripting-tutorial/examples/while_loops.sh -->
#!/bin/bash

# This script demonstrates the use of while loops in Bash.

# Example 1: Basic while loop
count=1
echo "Counting from 1 to 5:"
while [ $count -le 5 ]; do
    echo $count
    ((count++))  # Increment the count
done

# Example 2: Reading user input until a specific condition
echo "Enter numbers (type '0' to exit):"
number=1
while [ $number -ne 0 ]; do
    read -p "Enter a number: " number
    if [ $number -ne 0 ]; then
        echo "You entered: $number"
    fi
done

# Example 3: Infinite loop with break condition
echo "This will run until you type 'exit':"
while true; do
    read -p "Type 'exit' to stop: " input
    if [ "$input" == "exit" ]; then
        echo "Exiting the loop."
        break
    else
        echo "You typed: $input"
    fi
done

# Example 4: Using a while loop to read a file line by line
echo "Reading lines from a file (example.txt):"
if [ -f "example.txt" ]; then
    while IFS= read -r line; do
        echo "$line"
    done < "example.txt"
else
    echo "File example.txt does not exist."
fi