#!/bin/bash
echo "Creating multiple files or directories"
if [ $# -lt 2 ]; then
	echo "Usage: bash $0 <Path> <File or Directory>"
	exit 1
fi
path="$1"
shift
read -r -p "Do you want to create a directory (YES/NO): " YES
        if [ -z "$YES" ]; then
                echo "Please provide input YES or NO"
                exit 1
		elif [ "$YES" != "YES" ] && [ "$YES" != "NO" ]; then
		echo "Invalid input"
		exit 1
	fi
for name in "$@"
do
	fullpath="$path/$name"
	if [ "YES" = "$YES" ]; then
		echo "Creating directories"
		mkdir -p "$fullpath"
	else
		echo "Creating files"
		touch "$fullpath"
	fi
done
