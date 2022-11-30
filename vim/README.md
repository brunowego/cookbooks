# Vim

<!--
https://www.youtube.com/watch?v=gnupOrSEikQ
https://linkedin.com/learning/search?entityType=COURSE&keywords=vim

# vim:syntax=ruby:et:sts=2:sw=2:ts=2:ff=unix:
# vi:syntax=ruby
-->

## CLI

### Installation

#### Homebrew

```sh
brew install vim
```

#### YUM

```sh
yum check-update
sudo yum -y install vim
```

#### APT

```sh
sudo apt update
sudo apt -y install vim
```

#### APK

```sh
sudo apk update
sudo apk add vim
```

#### Source

##### Dependencies

```sh
yum check-update
sudo yum -y install curl ncurses-devel make
```

##### Build & Install

```sh
curl -L 'https://github.com/vim/vim/archive/v8.1.0968.tar.gz' | \
  tar -xz
```

```sh
( cd ./vim-8.1.0968 && ./configure \
  --enable-cscope \
  --enable-multibyte \
  --disable-gui \
  --disable-nls \
  --with-tlib=ncurses \
  --with-features=huge \
  --without-x )
```

```sh
( cd ./vim-8.1.0968 && make && sudo make install ) && rm -r ./vim-8.1.0968
```

#### Chocolatey

```sh
choco install -y vim
```

### Configuration

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Default Editor
export EDITOR='vim'
```

```sh
sudo su - "$USER"
```

### Commands

```sh
vim -c '[command]'
```

### Usage

```sh
vim ./[filename]
```

### Tips

#### Modelines

```rb
# -*- mode: ruby -*-
# vi: set ft=ruby :
```
