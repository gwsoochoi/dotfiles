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
ZSH_THEME="agnoster"

# on my zsh plugins
plugins=(
  virtualenv
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Syntax Hightlighting
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Auto Suggestion
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-users/zsh-autosuggestions
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#6c6c6c"

##########################################
# fzf
##########################################
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='find .'
alias ff="fzf --preview 'cat {}' | xargs nvim"

##########################################
# Alias settings
##########################################
alias ls="ls -GF"
alias diff="colordiff -u"
alias vim="nvim"
