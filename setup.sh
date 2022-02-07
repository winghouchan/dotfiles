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
