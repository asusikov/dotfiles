arch_name="$(uname -m)"

if [ "${arch_name}" = "arm64" ]; then
  HOMEBREW_PREFIX="/opt/homebrew"
else
  HOMEBREW_PREFIX="/usr/local"
fi

eval $($HOMEBREW_PREFIX/bin/brew shellenv)


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# PRIMARY_FG=white
# ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME="frisk"
# ZSH_THEME="gnzh"
# ZSH_THEME="bira"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  bundler
  macos
  ruby
  rails
  docker-compose
  vi-mode
  tmux
  tmuxinator
  kubectl
  hanami
  golang
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
# prompt_context() {
  # # if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    # # prompt_segment black default ""
  # # fi
# }

# Dir: current working directory
# prompt_dir() {
  # # prompt_segment blue black '%2~'
# }

export EDITOR='nvim'

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_RU.UTF-8


export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

unset ASDF_DIR
. "$HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh"


eval "$(direnv hook zsh)"

alias lg='lazygit'

# create tmux session with nvim and opencode
create_tmux_development() {
  tmux new -s $1 -n dev \; \
    split-window -h \; \
    select-pane -t 0 \; \
    resize-pane -x 91 \; \
    split-window -v -l 5 \; \
    select-pane -t 0 \; \
    send-keys 'nv' C-m \; \
    select-pane -t 2 \; \
    send-keys 'opencode' C-m
}
alias ctd='create_tmux_development'

# alias for cmus-remote
alias lcp='cmus-remote -u'


bindkey '^N' clear-screen

alias nv='nvim'
alias oc='opencode'

alias lst='tree --dirsfirst'

export GOPATH="$HOME/go"
PATH="$GOPATH/bin:$PATH"

alias gota='go test $(go list ./... | grep -v /mocks | grep -v /test) -cover'
alias golr='golangci-lint run'
alias goga='go generate ./...'
alias gomt='go mod tidy'

alias glmr='glab mr view -c'
alias glmrl='glab mr list'
alias glmrn='glab mr new --wip --remove-source-branch -yft'
alias glmrw='BROWSER="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome" glab mr view -w'
alias glci='glab ci view'
eval "$($HOMEBREW_PREFIX/bin/mise activate zsh)"

eval "$(starship init zsh)"
