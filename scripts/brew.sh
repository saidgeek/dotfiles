# Install brew - package manager for MacOS
# https://brew.sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install require dependencies
brew install python3 python3-pip pyvim
brew install --cask alacritty
brew install --cask docker
