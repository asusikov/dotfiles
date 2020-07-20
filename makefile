install_brew:
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash

create_links:
	ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
	ln -s ~/dotfiles/.zshrc ~/.zshrc
	ln -s ~/dotfiles/.p10k.zsh ~/.p10k.zsh
	mkdir -p ~/.config/nvim
	ln -s ~/dotfiles/init.vim ~/.config/nvim/init.vim
	ln -s ~/dotfiles/.gitignore_global ~/.gitignore_global

setup_git:
	git config --global core.excludesfile ~/.gitignore_global

install_fonts:
	brew tap homebrew/cask-fonts
	brew cask install font-jetbrainsmono-nerd-font

install_zsh:
	curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash
	brew install romkatv/powerlevel10k/powerlevel10k
	brew install zsh-syntax-highlighting

install_vim:
	brew install neovim
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	nvim -es -u init.vim -i NONE -c "PlugInstall" -c "qa"
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

install_dependicies:
	brew install asdf
	brew install fzf
	brew install lazygit
	brew install ripgrep
	brew install tmux

update_dependicies:
	brew upgrade
