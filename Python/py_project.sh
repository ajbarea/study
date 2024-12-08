#!/bin/bash

# Define the output file
output_file="flask-restful.md"

# Define the programming language for syntax highlighting
code_language="python"

# Clear the output file if it already exists
> "$output_file"

# Define an array of directories to search
directories=("src" "tests")

# Define arrays for directories and files to ignore
ignore_dirs=(
    "*/__pycache__"
    "*/temp"
    # Add more directories to ignore here
)

ignore_files=(
    "__init__.py"
    "*.pyc"
    "*.log"
    # Add more files or patterns to ignore here
)

# Add a header to the output file
echo -e "\n# Nightclub Capacity Python Flask-RESTful API Source Code\n" >> "$output_file"

# Build the find command dynamically
find_cmd="find ${directories[@]}"

# Add prune options for directories to ignore
for dir_pattern in "${ignore_dirs[@]}"; do
    find_cmd+=" -path \"$dir_pattern\" -prune -o"
done

# Continue building the find command
find_cmd+=" -type f"

# Add options to exclude files
for file_pattern in "${ignore_files[@]}"; do
    find_cmd+=" ! -name \"$file_pattern\""
done

# Finish the find command
find_cmd+=" -print"

# Execute the find command and process the files
eval $find_cmd | while read -r file; do
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
