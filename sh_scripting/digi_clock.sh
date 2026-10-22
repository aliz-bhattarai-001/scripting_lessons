#!/bin/bash

echo " "
echo ::Welcome to the Digital Clock ::
echo ""

echo -e "Today\'s date :\t$(date +%D)"
echo ""


# Save the current cursor position right where the time should go
tput sc


while true;
do

# clear

# Restore the cursor to the saved position
    tput rc

 # Clear from the cursor to the end of the line 
    tput el

echo -e "Time:\t$(date +%T)" 
# -e to specify that escape characters will be used within
sleep 1
done
