#!/bin/bash

# Arithmetic calculations in Bash

# Method 1: Using $((...)) syntax
echo "Using \$((...)) syntax:"
num1=10
num2=5
sum=$((num1 + num2))
difference=$((num1 - num2))
product=$((num1 * num2))
quotient=$((num1 / num2))
echo "Sum: $sum"
echo "Difference: $difference"
echo "Product: $product"
echo "Quotient: $quotient"

# Method 2: Using expr command
echo -e "\nUsing expr command:"
sum_expr=$(expr $num1 + $num2)
difference_expr=$(expr $num1 - $num2)
product_expr=$(expr $num1 \* $num2)
quotient_expr=$(expr $num1 / $num2)
echo "Sum: $sum_expr"
echo "Difference: $difference_expr"
echo "Product: $product_expr"
echo "Quotient: $quotient_expr"

# Method 3: Using bc utility for floating-point arithmetic
echo -e "\nUsing bc utility for floating-point arithmetic:"
num1=10.5
num2=2.5
sum_bc=$(echo "$num1 + $num2" | bc)
difference_bc=$(echo "$num1 - $num2" | bc)
product_bc=$(echo "$num1 * $num2" | bc)
quotient_bc=$(echo "$num1 / $num2" | bc)
echo "Sum: $sum_bc"
echo "Difference: $difference_bc"
echo "Product: $product_bc"
echo "Quotient: $quotient_bc"