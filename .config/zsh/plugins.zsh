# plugins directory
ZPLUGINDIR=$HOME/.local/share/zsh/plugins
[ -d $ZPLUGINDIR ] || mkdir -p $ZPLUGINDIR 

# antidote.lite loader
if [[ ! -d $ZPLUGINDIR/zsh_unplugged ]]; then
  git clone --quiet https://github.com/mattmc3/zsh_unplugged $ZPLUGINDIR/zsh_unplugged
fi

source $ZPLUGINDIR/zsh_unplugged/zsh_unplugged.zsh

repos=(
  # load order!
  romkatv/powerlevel10k
  romkatv/zsh-defer

  zsh-users/zsh-history-substring-search
  zsh-users/zsh-autosuggestions

  #zsh-users/zsh-syntax-highlighting
  zdharma-continuum/fast-syntax-highlighting
)

# Load all plugins
plugin-load $repos

function plugins-update {
  plugin-update $repos
}

function plugins-list {
  ls $ZPLUGINDIR
}

function plugins-clean {
  rm -rfi $ZPLUGINDIR
  reload
}
