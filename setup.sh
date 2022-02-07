#!/bin/bash

# Authenticate user for elevated privileges
sudo -v

# Keep elevated privileges alive until setup is complete
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

./brew.sh

# Stow the contents of each directory to the home directory
for directory in */; do
  stow -t ~/ $directory
done

# Install Visual Studio Code extensions
while IFS= read -r extension || [[ -n "$extension" ]]; do
  code --install-extension $extension
done <VSCodeExtensionFile

# Set Fish as the default shell
fish_home=$(command -v fish)
if [[ $fish_home ]]; then
  echo $fish_home | sudo tee -a /etc/shells
  chsh -s $fish_home
fi 
