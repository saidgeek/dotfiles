# Install neovim nightly version with brew
# https://github.com/neovim/neovim/wiki/Installing-Neovim#homebrew-on-macos-or-linux

brew install --HEAD tree-sitter
brew install --HEAD luajit
brew install --HEAD neovim

# Install instructions
# https://github.com/junegunn/vim-plug#installation

sh -c 'curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

