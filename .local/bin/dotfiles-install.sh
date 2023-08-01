#!/bin/sh

git clone --bare git@github.com:biocoderh/.dotfiles.git $HOME/.dotfiles

function dotfiles {
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

dotfiles checkout

if [ $? = 0 ]; then
  echo "Checked out dotfiles.";
  else
    echo "Backing up pre-existing dot files to ${HOME}/.dotfiles-backup";
    mkdir -p $HOME/.dotfiles-backup
    dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} $HOME/.dotfiles-backup/{}
    dotfiles checkout
fi;

dotfiles config status.showUntrackedFiles no

chmod -R +x .local/bin
sudo ln -s $HOME/.local/share/libinput/local-overrides.quirks /usr/share/libinput/local-overrides.quirks
