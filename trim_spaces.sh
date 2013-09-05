#!/bin/bash

#-----------------------------------------------------------------------------#
# Trim Trailing Spaces
#-----------------------------------------------------------------------------#
# Remove trailing spaces from files to reduce their overall size and to keep
# them tidy. This can be run on a single file or a directory.
#-----------------------------------------------------------------------------#

# Check that a moodle directory has been specified
if [ -z $1 ] || [ $2 ]
then
	echo
	if [ -z $1 ]
	then	
		echo "ERROR: Incorrect syntax, filename/directory not provided"
	fi
	if [ $2 ]
	then
		echo "ERROR: Incorrect syntax, too many parameters"
	fi
    echo "USAGE: ./trim_spaces.sh <filename/directory>"
    echo
    exit
fi

if [ ! -d $1 ] &&  [ ! -f $1 ]
then
	echo
	echo "ERROR: $1 is neither a file or a directory"
	echo
	exit
fi

if [ -d $1 ] 
then
	for f in $1/*
	do
		echo " ... Trimming trailing spaces from $f"
		sed -i '' -e's/[[:space:]]*$//' $f
	done
fi

if [ -f $1 ]
then
	echo " ... Trimming trailing spaces from $1"
	sed -i '' -e's/[[:space:]]*$//' $1
fi