HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/.sh_history

export PATH="$PATH:$HOME/.local/bin"
export ZDOTDIR="$HOME/.config/zsh"

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
