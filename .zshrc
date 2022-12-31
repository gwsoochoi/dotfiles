##########################################
# Basic settings
##########################################

# autoload
autoload -U compinit && compinit

# autoload -Uz compinit && compinit -u
autoload -Uz colors && colors
autoload -Uz vcs_info
autoload history-search-end
autoload -Uz add-zsh-hook
autoload -Uz terminfo

# language
export LANGUAGE="en_US.UTF-8"
export LANG="${LANGUAGE}"
export LC_ALL="${LANGUAGE}"
export LC_CTYPE="${LANGUAGE}"

# history
export HISTFILE=~/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000

# homebrew
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
eval "$(/opt/homebrew/bin/brew shellenv)"

# oh my zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(
  virtualenv
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-completions
)

source $ZSH/oh-my-zsh.sh
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
source ~/.oh-my-zsh/custom/plugins/zsh-completions

# mysql@8.4
export PATH="/opt/homebrew/opt/mysql@8.4/bin:$PATH"

# node
export PATH=$PATH:/Users/gwangsoochoi/.nodenv/versions/20.9.0/bin

# Color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#817e7f'

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='find .'
alias ff="fzf --preview 'cat {}' | xargs nvim"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# nodevn
eval $(/opt/homebrew/bin/brew shellenv)
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

##########################################
# Basic Alias Configuration
##########################################
alias ls="ls -GF"
alias diff="colordiff -u"
alias vim="nvim"
alias dotfiles="/Users/gwangsoochoi/dotfiles"
alias gcphost="vim ~/.ssh/google_compute_known_hosts"
alias gcb='git branch | fzf | cut -c 3- | xargs git checkout'
alias tmuxconfig="nvim /Users/gwangsoochoi/dotfiles/.tmux.config"
alias vimconfig='vim ~/.config/nvim/init.vim'
alias zshconfig='vim ~/.zshrc'

##########################################
# Customized Project Alias Configuration
##########################################
alias pongeapp='cd /Users/gwangsoochoi/development/pon_ge_app'
alias pongeapi='cd /Users/gwangsoochoi/development/beongae-api'
alias dev='cd /Users/gwangsoochoi/development'
