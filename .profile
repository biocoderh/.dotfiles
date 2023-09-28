#!/bin/sh

export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/history"

[ -z "$PATH_ORIG" ] && export PATH_ORIG="$PATH"
export PATH="$PATH_ORIG:$HOME/.local/bin"

if [ -x "$(command -v nvim)" ]; then
  export EDITOR="nvim"
  export VISUAL="nvim"
fi

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
  export MOZ_ENABLE_WAYLAND=1
fi

if [ -f "/usr/bin/ksshaskpass" ]; then
  export SSH_ASKPASS='/usr/bin/ksshaskpass'
  export SSH_ASKPASS_REQUIRE=prefer
fi

if [ -x "$(grep -q WSL /proc/sys/kernel/osrelease)" ]; then
  export WSL=true
fi
