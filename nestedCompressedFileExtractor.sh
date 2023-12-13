#!/bin/bash

# Function to check if a file is a compressed archive
is_compressed() {
    local file=$1
    local type=$(file --mime-type -b "$file")

    case $type in
        application/zip|application/gzip|application/x-gzip|application/x-xz|application/x-tar)
            return 0
            ;;
        *)
            return 1
            ;;
    esac
}

# Function to extract compressed files
extract_and_remove() {
    local file=$1

    7z e "$file" && rm "$file"

    case $file in
        *.zip)
            unzip -q "$file" && rm "$file"
            ;;
        *.tar.gz)
            tar -xzf "$file" && rm "$file"
            ;;
    esac
}

# Main loop
while true; do
    found=0
    for file in *; do
        echo $file
        if [[ -f "$file" && $(is_compressed "$file"; echo $?) -eq 0 ]]; then
            extract_and_remove "$file"
            found=1
        fi
    done

    # Break the loop if no compressed files were found
    if [[ $found -eq 0 ]]; then
        break
    fi
done
