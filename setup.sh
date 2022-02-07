#!/bin/bash

# ==================================
# Run setup with elevated privileges
# ==================================

# Authenticate user for elevated privileges
sudo -v

# Keep elevated privileges alive until setup is complete
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# ====
# Brew
# ====

if [[ $(command -v brew) == "" ]]; then
  # Install Homebrew
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash

  # Add Homebrew to $PATH
  /opt/homebrew/bin/brew shellenv
else
  # Ensure latest version of Homebrew is being used
  brew update

  # Upgrade any already installed casks and formulae
  brew upgrade
fi

# Install dependencies listed in Brewfile
brew bundle install

# Stow the contents of each directory to the home directory
for directory in */; do
  stow -t ~/ $directory
done
