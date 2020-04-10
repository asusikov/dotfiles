create_links:
	ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
	ln -s ~/dotfiles/.zshrc ~/.zshrc
	ln -s ~/dotfiles/init.vim ~/.config/nvim/init.vim
	ln -s ~/dotfiles/.direnvrc ~/.direnvrc

install_dependicies:
	brew install asdf
	brew install fzf
	brew install lazygit
	brew install ripgrep
	brew install tmux

update_dependicies:
	brew upgrade

install_fonts:
	brew tap homebrew/cask-fonts
	brew cask install font-jetbrainsmono-nerd-font

