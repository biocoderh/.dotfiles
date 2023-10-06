ZPLUGINDIR="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/plugins"
[[ -d "$ZPLUGINDIR" ]] || mkdir -p "$ZPLUGINDIR" 

if [[ ! -d "$ZPLUGINDIR/zsh_unplugged" ]]; then
  git clone --quiet https://github.com/mattmc3/zsh_unplugged "$ZPLUGINDIR/zsh_unplugged"
fi

repos=(
  romkatv/powerlevel10k
  # deferred
  romkatv/zsh-defer
  zsh-users/zsh-history-substring-search
  zsh-users/zsh-autosuggestions
  zdharma-continuum/fast-syntax-highlighting
)

# antidote.lite loader
source "$ZPLUGINDIR/zsh_unplugged/antidote.lite.zsh"
plugin-clone $repos
plugin-load $repos

plugins-update() {
  plugin-update $repos
}
