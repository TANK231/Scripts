#!/bin/bash
#Create a directory if not available
#PWD=$(pwd)
#Dir="$PWD/Naga"

while true
do
read -r -p "Provide Path: " path
read -r -p "Provide directory name: " dir
if [ -z "$path" ] || [ -z "$dir" ]; then
	echo "Path or Dir should not be empty, try agian"
else
	break
	exit 1
fi
done

fullpath="$path/$dir"
if [ -d "$fullpath" ]; then
	echo "Directory already existed"
else
	echo "Directory not existed, Creating"
	mkdir -p "$fullpath"
	if [ $? = 0 ]; then
		echo "Created Directory "$fullpath""
	else
	echo "Not able to create "$fullpath", Please check the input"	
	fi
fi
