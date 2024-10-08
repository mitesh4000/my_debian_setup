#!/bin/bash
if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "This is a Git repository."

    git add .

    echo 'Enter the commit message:'
    read commitMessage

    git commit -m "$commitMessage"

    echo "available branches" 
    mapfile -t branches < <(git branch --format='%(refname:short)')
for index in "${!branches[@]}"; do
    echo "$index: ${branches[$index]}"
done
if [ "${#branches[@]}" -eq 1 ]; then
    git push origin "${branches[0]}"

    echo "Pushed to only branch ${branches[0]}"
else
    echo 'Enter the index of the branch:'
    read branch

    git push origin "${branches[$branch]}"
fi
else
    echo "This is not a Git repository. Please navigate to a Git repository."
fi
