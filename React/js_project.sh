#!/bin/bash

# Make the script executable and run it
# chmod +x project.sh
# ./project.sh

# Define the output file
output_file="project.md"

# Define the programming language for syntax highlighting
code_language="javascript"

# Clear the output file if it already exists
> "$output_file"

# Define an array of directories to search
# directories=(".")
directories=("src")

# Add a header to the output file

echo -e "\n## Nightclub Capacity Reactstrap App Source Code\n" >> "$output_file"

# Loop through files in the specified directories only
for file in $(find "${directories[@]}" -type f ! -name "project.md"); do
    # Append the filename as a subheader
    echo -e "## File: $file\n" >> "$output_file"
    
    # Start a code block with the specified language syntax highlighting
    echo "\`\`\`$code_language" >> "$output_file"
    
    # Append the contents of the file
    cat "$file" >> "$output_file"
    
    # End the code block
    echo -e "\n\`\`\`\n" >> "$output_file"
done

# Remove the last newline character
truncate -s -1 "$output_file"

# Print a completion message
echo "All files in ${directories[*]} directories have been copied into $output_file."