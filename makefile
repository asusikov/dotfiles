.PHONY : install_brew install_dependicies create_links

install_brew:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew tap homebrew/bundle

install_dependicies:
	@brew bundle --file=./Brewfile

create_links:
	ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
	ln -sf ~/dotfiles/.zshrc ~/.zshrc
	ln -sf ~/dotfiles/.p10k.zsh ~/.p10k.zsh
	mkdir -p ~/.config/bat
	ln -sf ~/dotfiles/bat.conf ~/.config/bat/config
	mkdir -p ~/.config/nvim
	ln -sf ~/dotfiles/init.lua ~/.config/nvim/init.lua
	ln -sf ~/dotfiles/lua ~/.config/nvim
	ln -sf ~/dotfiles/.gitignore_global ~/.gitignore_global
	mkdir -p ~/.config/alacritty
	ln -sf ~/dotfiles/alacritty.toml ~/.config/alacritty/alacritty.toml
	ln -s ~/dotfiles/karabiner ~/.config

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

setup: install_brew install_dependicies create_links

migrate_alacritty_configs:
	unlink ~/.config/alacritty/alacritty.yml
	ln -sf ~/dotfiles/alacritty.toml ~/.config/alacritty/alacritty.toml
