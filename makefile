create_links:
	ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
	ln -s ~/dotfiles/.zshrc ~/.zshrc
	ln -s ~/dotfiles/.p10k.zsh ~/.p10k.zsh
	mkdir -p ~/.config/nvim
	ln -s ~/dotfiles/init.vim ~/.config/nvim/init.vim
	ln -s ~/dotfiles/.direnvrc ~/.direnvrc

install_zsh:
	brew install zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	brew install romkatv/powerlevel10k/powerlevel10k

install_vim:
	brew install neovim
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	nvim -es -u init.vim -i NONE -c "PlugInstall" -c "qa"

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

