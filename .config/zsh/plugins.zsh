# plugins directory
ZPLUGINDIR=$HOME/.local/share/zsh/plugins
[ -d $ZPLUGINDIR ] || mkdir -p $ZPLUGINDIR 

# antidote.lite loader
if [[ ! -d $ZPLUGINDIR/zsh_unplugged ]]; then
  git clone --quiet https://github.com/mattmc3/zsh_unplugged $ZPLUGINDIR/zsh_unplugged
fi

source $ZPLUGINDIR/zsh_unplugged/zsh_unplugged.zsh

repos=(
  # fast load, leave it first
  romkatv/zsh-defer
  # PLUGINS: 
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-history-substring-search
  zsh-users/zsh-autosuggestions
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
  zsh
}
