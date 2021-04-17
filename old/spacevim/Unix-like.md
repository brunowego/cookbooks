# Linux

## Dependencies

### Homebrew

```sh
brew install curl git vim
```

### YUM

```sh
yum check-update
sudo yum -y install curl git vim
```

> Need install vim >= 8.x. Install from source.

### APT

```sh
sudo apt update
sudo apt -y install curl git vim
```

## Installation

```sh
curl -sLf https://spacevim.org/install.sh | /bin/bash -s -- --install vim
```

## Uninstall

```sh
curl -sLf https://spacevim.org/install.sh | /bin/bash -s -- --uninstall
```

```sh
rm -fR ~/.cache/SpaceVim
rm -fR ~/.cache/vimfiles
rm -fR ~/.SpaceVim*
rm -fR ~/.viminfo
```
