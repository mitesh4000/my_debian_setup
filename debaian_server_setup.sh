#!/bin/bash

# Update package list
sudo apt update

# Define the packages to install
packages=("git" "lf" "curl" "make" "vim" "fonts-gujr-extra" "fonts-gargi" "bashtop")

# Initialize an array to hold failed packages
failed_packages=()

# Loop through each package and attempt to install it
for package in "${packages[@]}"; do
    if ! sudo apt install -y "$package"; then
        echo "Failed to install $package"
        failed_packages+=("$package")  # Add to failed packages array
    fi
done

# Check if there were any failed packages
if [ ${#failed_packages[@]} -ne 0 ]; then
    echo "The following packages failed to install:"
    echo "-----------------------------------------"
    for failed in "${failed_packages[@]}"; do
        echo "$failed"
    done
    
    echo "-----------------------------------------"
else
    echo "All packages installed successfully."
fi

