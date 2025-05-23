#!/bin/bash

# This script showcases how to define and use variables in Bash, including local and global variables.

# Defining a global variable
global_var="I am a global variable"

# Function to demonstrate local variable
function demonstrate_local_variable {
    local local_var="I am a local variable"
    echo $local_var
}

# Function to demonstrate variable usage
function demonstrate_variable_usage {
    echo "Using global variable: $global_var"
}

# Calling the functions
demonstrate_local_variable
demonstrate_variable_usage

# Modifying a global variable
global_var="I have been modified"
echo "Modified global variable: $global_var"