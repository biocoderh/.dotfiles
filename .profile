export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE="$HOME/.cache/.sh_history"

export PATH="$PATH:$HOME/.local/bin"
export ZDOTDIR="$HOME/.config/zsh"

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    export MOZ_ENABLE_WAYLAND=1
fi

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
