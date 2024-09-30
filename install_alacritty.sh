#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

# Function to check for required commands
check_command() {
    command -v "$1" >/dev/null 2>&1 || { echo "$1 is required but not installed. Aborting." >&2; exit 1; }
}

# Check for required commands
check_command curl
check_command git

# Check if Rust is already installed
if ! command -v rustc >/dev/null 2>&1; then
    echo "Installing Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    # Source the Rust environment (this may be necessary for the current session)
    source $HOME/.cargo/env
    # Set the Rust toolchain to stable
    rustup override set stable
    rustup update stable
else
    echo "Rust is already installed."
fi

check_command cargo || echo "cargo not found, will install with Rust"

# Check if Alacritty is already installed
if ! command -v alacritty >/dev/null 2>&1; then
    echo "Installing dependencies..."
    sudo apt update
    sudo apt install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3

    echo "Installing Alacritty binary with Cargo..."
    cargo install alacritty

    # Move the Alacritty binary to /usr/bin
    sudo mv ~/.cargo/bin/alacritty /usr/bin/alacritty
else
    echo "Alacritty is already installed."
fi

echo "Installation finished."

