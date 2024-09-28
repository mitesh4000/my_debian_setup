#!/bin/bash

# Check for required commands
command -v curl >/dev/null 2>&1 || { echo "curl is required but not installed. Aborting." >&2; exit 1; }
command -v git >/dev/null 2>&1 || { echo "git is required but not installed. Aborting." >&2; exit 1; }

echo "Installing Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Source the Rust environment (this may be necessary for the current session)
source $HOME/.cargo/env

# Set the Rust toolchain to stable
rustup override set stable
rustup update stable

command -v cargo >/dev/null 2>&1 || { echo "cargo is required but not installed. Aborting." >&2; exit 1; }

echo "installing alacrittty bin with cargo"
cargo install alacritty

sudo mv ~/.cargo/bin/alacritty /usr/bin/alacritty
# Clone the dotfiles repository
git clone git@github.com:mitesh4000/rango.dotfiles.git temp_repo
if [ $? -ne 0 ]; then
    echo "Failed to clone the dotfiles repository. Aborting."
    exit 1
fi

# Copy the Alacritty configuration
cp -r temp_repo/alacritty ~/.config
if [ $? -eq 0 ]; then
    echo "Folder downloaded successfully to ~/.config"
else
    echo "Failed to download the folder"
fi

# Clean up the temporary repository
rm -rf temp_repo

