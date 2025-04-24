#!/bin/bash

# Replace "." with any root directory you'd like to start from
for dir in $(find . -type d -name ".git"); do
    repo_dir=$(dirname "$dir")
    cd "$repo_dir" || continue

    # Check for uncommitted changes
    if [[ -n $(git status --porcelain) ]]; then
        echo "Uncommitted changes in: $repo_dir"
    fi

    cd - > /dev/null
done