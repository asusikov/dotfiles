install_brew:
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash

install_dependicies:
	brew cask install alacritty
	brew install asdf
	brew install fzf
	brew install lazygit
	brew install ripgrep
	brew install tmux
	brew install httpie
	brew cask install qutebrowser
	brew cask install amethyst

create_links:
	ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
	ln -sf ~/dotfiles/.zshrc ~/.zshrc
	ln -sf ~/dotfiles/.p10k.zsh ~/.p10k.zsh
	mkdir -p ~/.config/nvim
	ln -sf ~/dotfiles/init.vim ~/.config/nvim/init.vim
	ln -s ~/dotfiles/snippets ~/.config/nvim/snippets
	ln -sf ~/dotfiles/coc-settings.json ~/.config/nvim/coc-settings.json
	ln -sf ~/dotfiles/.gitignore_global ~/.gitignore_global
	mkdir -p ~/.config/alacritty
	ln -sf ~/dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml

setup_git:
	git config --global core.excludesfile ~/.gitignore_global

install_fonts:
	brew tap homebrew/cask-fonts
	brew cask install font-jetbrainsmono-nerd-font

enable_font_smoothing:
	defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO
	defaults -currentHost write -globalDomain AppleFontSmoothing -int 2
	defaults write io.alacritty CGFontRenderingFontSmoothingDisabled 1

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

update_dependicies:
	brew upgrade
