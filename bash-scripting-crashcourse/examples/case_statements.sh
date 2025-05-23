#!/bin/bash

# This script demonstrates the use of case statements in Bash.

# Prompt the user for their favorite fruit
echo "Please enter your favorite fruit (apple, banana, orange, or grape):"
read fruit

# Use a case statement to respond based on the user's input
case $fruit in
    apple)
        echo "You chose apple! Apples are great for your health."
        ;;
    banana)
        echo "You chose banana! Bananas are rich in potassium."
        ;;
    orange)
        echo "You chose orange! Oranges are a good source of vitamin C."
        ;;
    grape)
        echo "You chose grape! Grapes are delicious and refreshing."
        ;;
    *)
        echo "Sorry, I don't have information about that fruit."
        ;;
esac