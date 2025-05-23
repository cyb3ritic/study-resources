#!/bin/bash

# Colors for terminal output
# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
NC='\033[0m' # No Color

# Example of using colors in terminal output
echo -e "${RED}This is red text${NC}"
echo -e "${GREEN}This is green text${NC}"
echo -e "${YELLOW}This is yellow text${NC}"
echo -e "${BLUE}This is blue text${NC}"
echo -e "${MAGENTA}This is magenta text${NC}"
echo -e "${CYAN}This is cyan text${NC}"
echo -e "${WHITE}This is white text${NC}"

# Example of colored output with background
echo -e "${RED}This is red text with default background${NC}"
echo -e "${GREEN}This is green text with default background${NC}"

# Using colors in a loop
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
    echo -e "${!color}This text is ${color}${NC}"
done