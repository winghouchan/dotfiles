#!/bin/bash

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
