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
eval "$(/opt/homebrew/bin/brew shellenv)"

# oh my zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(
  virtualenv
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Auto Suggestion
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# Auto Syntax Highlighting
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

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
export PATH=$PATH:/Users/gwangsoochoi/.nodenv/versions/20.9.0/bin

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

##########################################
# Basic Alias Configuration
##########################################
alias ls="ls -GF"
alias diff="colordiff -u"
alias vim="nvim"

# .dotfiles
alias dotfiles="/Users/gwangsoochoi/dotfiles"

# Google Cloud Host
alias gcphost="vim ~/.ssh/google_compute_known_hosts"

# Tmux config
alias tmuxconfig="nvim /Users/gwangsoochoi/dotfiles/.tmux.config"

# Git
alias gcb='git branch | fzf | cut -c 3- | xargs git checkout'

alias vimconfig='vim ~/.config/nvim/init.vim'

alias zshconfig='vim ~/.zshrc'

export PATH="/opt/homebrew/opt/mysql@8.4/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/gwangsoochoi/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/gwangsoochoi/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/gwangsoochoi/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/gwangsoochoi/google-cloud-sdk/completion.zsh.inc'; fi
