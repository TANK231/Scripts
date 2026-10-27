#!/bin/bash
#This script is to rotate logs and delete older logs which are larger than 1MB
read -r -p "Provide the parent directory to identify the larger files: " parentDir
read -r -p "provide the Least size of file (Exp: +1M or +25M or +1G): " min
read -r -p "provide the Max size of file (Exp: -1M or -25M or -1G): " max
if [ -z "$parentDir" ] || [ -z "$min" ] || [ -z "$max" ]; then 
	echo "Please provide the values as requested"
	exit 1
else 
	echo "Listing the files which are the size between $min - $max along with files size"
	find "$parentDir" -type f -size "$min" -size "$max" -exec du -sh {} +
	echo "Compressing the files"
	find "$parentDir" -type f -size "$min" -size "$max" | xargs gzip -rvf
fi


