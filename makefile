install_brew:
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash

install_dependicies:
	brew install --cask alacritty
	brew install asdf
	brew install fzf
	brew install lazygit
	brew install ripgrep
	brew install httpie
	brew install --cask qutebrowser

create_links:
	ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
	ln -sf ~/dotfiles/.zshrc ~/.zshrc
	ln -sf ~/dotfiles/.p10k.zsh ~/.p10k.zsh
	mkdir -p ~/.config/nvim
	ln -sf ~/dotfiles/init.vim ~/.config/nvim/init.vim
	ln -sf ~/dotfiles/init_configs ~/.config/nvim/init_configs
	ln -sf ~/dotfiles/lua ~/.config/nvim/lua
	ln -s ~/dotfiles/snippets ~/.config/nvim/snippets
	ln -sf ~/dotfiles/coc-settings.json ~/.config/nvim/coc-settings.json
	ln -sf ~/dotfiles/.gitignore_global ~/.gitignore_global
	mkdir -p ~/.config/alacritty
	ln -sf ~/dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml

install_yabai:
	ln -sf ~/dotfiles/.yabairc ~/.yabairc
	brew install koekeishiya/formulae/yabai
	yabai --start-service

install_skhd:
	ln -sf ~/dotfiles/.skhdrc ~/.skhdrc
	brew install koekeishiya/formulae/skhd
	skhd --start-service

install_tmux:
	brew install tmux
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	tmux source ~/.tmux.conf

setup_git:
	git config --global core.excludesfile ~/.gitignore_global
	git config --global user.name asusikov
	git config --global user.email susikov.alexander@gmail.com

install_fonts:
	brew tap homebrew/cask-fonts
	brew install --cask font-jetbrains-mono-nerd-font
	brew install --cask font-iosevka-nerd-font
	brew install --cask font-iosevka-term-nerd-font
	brew install --cask font-victor-mono-nerd-font

enable_font_smoothing:
	defaults write -g AppleFontSmoothing -int 0

install_zsh:
	curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash
	brew install romkatv/powerlevel10k/powerlevel10k
	brew install zsh-syntax-highlighting

install_vim:
	brew install neovim
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	nvim -es -u init.vim -i NONE -c "PlugInstall" -c "qa"

install_go:
	brew install go

update_dependicies:
	brew upgrade
