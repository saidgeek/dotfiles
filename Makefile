install:
		@echo install brew package manager
		./scripts/brew.sh

		@echo install nvm, node & node dependencies
		./scripts/node.sh

		@echo install neovim
		./scripts/nvim.sh

		@echo install fish shell
		brew install fish

symlinks:
	ln -sf `pwd`/config/nvim/ ~/.config
	ln -sf `pwd`/tmux.conf ~/.tmux.conf
	#	ln -sf `pwd`/zsh/zsh_alias ~/zsh_alias
	#	ln -sf `pwd`/zshrc ~/.zshrc
	ln -sf `pwd`/config/fish ~/.config

.PHONY: install symlinks setup
