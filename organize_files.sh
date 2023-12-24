#!/bin/bash

# Specify the source directory where the files are located
SOURCE_DIR="/home/ubuntketly/screen/files"

# Create the destination directory
DEST_DIR="/home/ubuntketly/organised_files"
mkdir -p "$DEST_DIR"

# Find files with the specified naming convention
files=$(find "$SOURCE_DIR" -type f -name '*.*.*.csv')
echo "$files"

# Loop through each file
for file in $files; do
	# Extract the date from the file name
	
	filename=$(basename "$file" .csv)
	date_string=$(echo "$filename" | grep -oP '[0-9]{2}-[0-9]{2}-[0-9]{4} [0-9]{2}\.[0-9]{2}\.[0-9]{2}')
	month=$(date -d "$date_string" '+%m')
	day=$(date -d "$date_string" '+%d')
	year=$(date -d "$date_string" '+%Y')

	# Create directories if they don't exist
	mkdir -p "$DEST_DIR/$year/$month/$day"

	# Move the file to the organized directory
	cp "$file" "$DEST_DIR/$year/$month/$day/"
done

echo "Files organized successfully!"

