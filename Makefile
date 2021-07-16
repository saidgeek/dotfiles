install:
		@echo install brew package manager
		./scripts/brew.sh

		@echo install nvm, node & node dependencies
		./scripts/node.sh

		@echo install neovim
		./scripts/nvim.sh

symlinks:
	ln -sf `pwd`/config/nvim/ ~/.config
	ln -sf `pwd`/tmux.conf ~/.tmux.conf
	ln -sf `pwd`/config/kitty/ ~/.config

.PHONY: install symlinks setup
