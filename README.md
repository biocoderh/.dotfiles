# dotfiles

[![ShellCheck](https://github.com/biocoderh/dotfiles/actions/workflows/shellcheck.yml/badge.svg)](https://github.com/biocoderh/dotfiles/actions/workflows/shellcheck.yml)

dotfiles bare repo with environment setup scripts.

- [Install](#install)
- [Fork](#fork)
- [Shell](#shell)
- [Scripts](#scripts)


## Install

Requirements:
- curl
- git


```sh
/bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/biocoderh/dotfiles/master/.scripts/common/dotfiles-install)"
```

All conflicting files would be moved to **.local/state/dotfiles-backup** folder.


## Fork

To properly fork this repo change **GIT_URI** value in [dotfiles-install](.scripts/common/dotfiles-install#L3) file.


## Shell

Prefered shell is zsh, but for compatibility, environment variables and aliases separated to files:

- [.profile](.profile) - environment variables.
- [.shrc](.shrc) - aliases.

### [ZSH](.config/zsh)

- [.zshrc](.config/zsh/.zshrc) - config.
- [plugins.zsh](.config/zsh/plugins.zsh) - plugins.
- [key-bindings.zsh](.config/zsh/key-bindings.zsh) - key bindings.

lf and fzf integrated.

Plugin manager - [antidote.lite](https://github.com/mattmc3/zsh_unplugged/blob/main/antidote.lite.zsh). \
Plugins:

- [romkatv/powerlevel10k](https://github.com/romkatv/powerlevel10k) - to customize prompt, run `p10k configure`
- [romkatv/zsh-defer](https://github.com/romkatv/zsh-defer)
- [zsh-users/zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search)
- [zsh-users/zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zdharma-continuum/fast-syntax-highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting)


## [Scripts](.scripts)

- [env](.scripts/env) - set **PATH** environment variable depend on OS. In **~/.profile**:
 
```sh
[ -f "$HOME/.scripts/env" ] && . "$HOME/.scripts/env"
```

### [common](.scripts/common)

Common scripts, loaded by default.

#### Dotfiles

- [dotfiles-install](.scripts/common/dotfiles-install) - install dotfiles bare repo.
- [dotfiles-link](.scripts/common/dotfiles-link) - symlink system wide configs.

#### Tools

- [ssh-copy-keys](.scripts/common/ssh-copy-keys) - copy private and public keys to remote host, also add them to ssh agent.
```sh
Usage: ssh-copy-keys KEY REMOTE
Example: ssh-copy-keys .ssh/id_ed25519 biocoder@192.168.1.3
```

- [boot-options](.scripts/common/boot-options) - systemd-boot options manager.
```sh
Usage: boot-options <operation> [...]
systemd-boot options manager

operations:
    boot-options set <option> [value]
    boot-options del <option>
```

- [sddm-theme](.scripts/common/sddm-theme) - set SDDM theme to conf.
```sh
Usage: sddm-theme THEME
```

### [arch](.scripts/arch)

Arch Linux specific.

#### Environment

- [full-setup](.scripts/arch/full-setup) - setup everything except server env.
- [repos-setup](.scripts/arch/repos-setup) - setup all repos, paru and run rankmirrors-update.
- [base-setup](.scripts/arch/base-setup) - setup base environment with some tweaks.
- [desktop-setup](.scripts/arch/desktop-setup) - graphical environment.
- [server-setup](.scripts/arch/server-setup) - server environment.

Note: **full-setup** and **base-setup** would disable cpu mitigations, for reset to defaults:
```sh
boot-options del mitigations
```


#### Packages

- [pkgs](.scripts/arch/pkgs) - package managers wrapper, noninteractive, support: pacman, paru, yay. Used in scripts.
```sh
usage:  pkgs <operation> [...]
operations:
    pkgs update
    pkgs upgrade
    pkgs install <package(s)>
```

- [meta-install](.scripts/arch/meta-install) - install meta packages.
```sh
Usage: meta-install <package(s)>
Install meta packages.

    all - all packages.
    net - network packages.
    dev - development packages.
    cups - CUPS with foomatic drivers.
    obs - OBS with some plugins.
```

- [rankmirrors-update](.scripts/arch/rankmirrors-update) - rank all [mirrors](https://archlinux.org/mirrorlist/?protocol=https&use_mirror_status=on), process can take a while, some abroad servers can be faster in EU.
- [paru-install](.scripts/arch/paru-install) - install AUR [paru](https://github.com/Morganamilo/paru) package manager.

#### Repos

- [alhp-install](.scripts/arch/alhp-install) - install [ALHP](https://github.com/an0nfunc/ALHP) repos. Archlinux-based repos build with different x86-64 feature levels, -O3 and LTO.
- [chaotic-aur-install](.scripts/arch/chaotic-aur-install) - install [Chaotic-AUR](https://github.com/chaotic-aur) repos. An automated building repo for AUR packages.
- [archlinuxcn-install](.scripts/arch/archlinuxcn-install) - install [archlinuxcn](https://github.com/archlinuxcn/repo) repos. Arch Linux CN Repository.
