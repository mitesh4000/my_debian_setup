#!/bin/bash

# Define the download link and the target font directory
DOWNLOAD_LINK="https://objects.githubusercontent.com/github-production-release-asset-2e65be/27574418/0c99e921-69d8-453e-8010-ced4bb5ef63d?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=releaseassetproduction%2F20240928%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240928T082036Z&X-Amz-Expires=300&X-Amz-Signature=16fdeab709b5cb49e3e2c6691d445d2befbae1e554ff545556c527816a95f712&X-Amz-SignedHeaders=host&response-content-disposition=attachment%3B%20filename%3DIosevkaTerm.zip&response-content-type=application%2Foctet-stream"
FONT_DIR="$HOME/.fonts"

# Create the font directory if it doesn't exist
mkdir -p "$FONT_DIR"

# Download the font zip file
echo "Downloading font..."
wget -O "$HOME/IosevkaTerm.zip" "$DOWNLOAD_LINK"

# Extract the zip file
echo "Extracting font..."
unzip -o "$HOME/IosevkaTerm.zip" -d "$FONT_DIR"

# Update the font cache
echo "Updating font cache..."
fc-cache -f -v

# Clean up
echo "Cleaning up..."
rm "$HOME/IosevkaTerm.zip"

echo "Font installation complete!"

