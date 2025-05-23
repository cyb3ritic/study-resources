#!/bin/bash

# Strings in Bash

# This script provides examples of string manipulation in Bash, including:
# - Concatenation
# - Substring extraction
# - Pattern replacement

# Example 1: String Concatenation
string1="Hello"
string2="World"
concatenated_string="$string1 $string2"
echo "Concatenated String: $concatenated_string"

# Example 2: Substring Extraction
original_string="Bash Scripting Tutorial"
substring=${original_string:5:11}  # Extracts "Scripting"
echo "Substring: $substring"

# Example 3: Pattern Replacement
string_to_replace="I love Bash scripting"
replaced_string=${string_to_replace/Bash/Unix}
echo "Replaced String: $replaced_string"

# Example 4: String Length
string_length=${#original_string}
echo "Length of Original String: $string_length"

# Example 5: Upper and Lower Case Conversion
lowercase_string="bash scripting"
uppercase_string=${lowercase_string^^}  # Converts to uppercase
echo "Uppercase String: $uppercase_string"

# Example 6: Checking if a String Contains a Substring
if [[ $string_to_replace == *"Bash"* ]]; then
    echo "The string contains 'Bash'."
else
    echo "The string does not contain 'Bash'."
fi

# Example 7: Splitting a String into an Array
IFS=' ' read -r -a string_array <<< "$concatenated_string"
echo "Split String into Array: ${string_array[@]}"