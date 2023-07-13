[ -f $HOME/.profile ] && source $HOME/.profile 
[ -f $ZDOTDIR/zshrc ] && source $ZDOTDIR/zshrc 

function reload {
  source $ZDOTDIR/.zshrc
}
