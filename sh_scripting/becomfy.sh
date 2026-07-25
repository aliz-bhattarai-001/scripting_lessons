#!/bin/bash

# This file was originally the precursor to the custom command:
# switchuser() : currently in ~/.bashrc
# a lot of things didn't work as intended still this provided enough details 
# I learnt how to create switch user and well it works fine as inteded now.

# was originally meant to take user input but decided passing arguments 
# was more easier and faster

# GONNA REMOVE ALL ACCESS TO THIS FILE BESIDES READ PERMISSIONS.

# Prompt the user and storing input in 'choice'
# read -p "Your Pref >> " choice

# Using that variable
# echo "User Choose: $choice"


# changing hostname based on user choice
if [[ "$1" == "1" ]]; then
    hostname="something"
elif [[ "$1" == "2" ]]; then
    hostname="thewriter"
elif [[ "$1" == "3" ]]; then
    hostname="alfred"
elif [[ "$1" == "4" ]]; then
	hostname="sunrise"
else
    hostname="raven"
fi

sudo hostnamectl set-hostname "$hostname"
# echo "Target host set to: $hostname"

# history -a
# append the history to ~/.bash_history
clear
# clear the terminal
#  and then re-execute the bash
#  exec bash


#reopening the terminal
konsole &
#
# it just opened another terminal so didn't work as expected.

exit
# the combo with konsole & (hopefully should've worked as expected but didn't )
