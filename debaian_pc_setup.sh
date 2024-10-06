#!/bin/bash

# Update package list
sudo apt update

# Define the packages to install
packages=("git" "lf" "curl" "make"  "dmenu" "vim" "i3-wm" "network-manager-applet" "fonts-jetbrains-mono" "lightdm" "x11-xsession-manager" "blueman" "feh" "lsd" "dunst")
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

