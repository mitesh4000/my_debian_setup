#!/bin/bash
if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "This is a Git repository."

    git add .

    echo 'Enter the commit message:'
    read commitMessage

    git commit -m "$commitMessage"

    echo "available branches" 
    git branch -a
    echo 'Enter the name of the branch:'
    read branch

    git push origin "$branch"

else
    echo "This is not a Git repository. Please navigate to a Git repository."
fi
