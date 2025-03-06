#!/bin/bash

# Extract the directory and filename
input_file="$1"
directory=$(dirname "$input_file")

echo $input_file
echo $directory

# Generate a new friendly name using Ollama
friendly_name=$(ollama run gemma "Generate a short, descriptive filename based on the document content. The filename should start with the the date found in the PDF if there is one in the format of yyyy-MM-dd, followed by an underscore, and then a concise name describing the document. Do not include special characters. Use underscores instead of spaces. Content: $(pdftotext "$input_file" - | head -n 100)")

# Clean up the name (remove special characters)
friendly_name=$(echo "$friendly_name")

echo $friendly_name

# Set new filename with .pdf extension
new_file="${directory}/processed/${friendly_name}.pdf"

echo $new_file

# Rename the file
cp "$input_file" "$new_file"
mv "$input_file" "${input_file}.old"