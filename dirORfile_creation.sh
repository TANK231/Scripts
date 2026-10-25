#!/bin/bash
echo "Validating file or directory creation by using positional arguments as inputs"
if [ -z "$1" ] || [ -z "$2" ]; then
	echo "Usage: $0 <Path> <Dir or File>"
	exit 1
fi
fullpath="$1/$2"
if [ -e "$fullpath" ]; then
	echo "File or Directory already existed in $1"
else
	echo "File or Directory does not exist, Creating"
	read -r -p "Do you want to create a Directory? (yes \ no): " yes
	if [ "yes" = "$yes" ]; then
		mkdir -p "$fullpath"
		echo "Creating a Directory $2 in the path $1"
	else
		touch "$fullpath"
		echo "Creating a file $2 in the path $1"
	fi
fi
