# Simple Python Version Management (pyenv)

## CLI

### Dependencies

#### Homebrew

```sh
sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.*.pkg -target /
brew install autoconf pkg-config openssl readline zlib
```

#### Zypper

```sh
sudo zypper refresh
sudo zypper install -y git-core curl tar gzip make gcc-c++ zlib-devel libffi-devel libopenssl-devel libbz2-devel readline-devel sqlite3-devel
```

#### YUM

```sh
sudo yum check-update
sudo yum -y install git curl tar gzip make gcc-c++ zlib-devel libffi-devel openssl-devel bzip2-devel readline-devel sqlite-devel
```

#### APT

```sh
sudo apt update
sudo apt -y install git curl tar gzip make g++ zlib1g-dev libffi-dev libbz2-dev libreadline-dev libsqlite3-dev
```

> Build OpenSSL from source before install python version 3.x

### Installation

#### Unix-like

```sh
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
```

### Environment

#### macOS

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
```

```sh
sudo su - $USER
```

#### Linux

```sh
sudo tee /etc/profile.d/pyenv.sh << 'EOF'
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
EOF
```

```sh
sudo su - $USER
```

### Commands

```sh
pyenv help
```

#### Install

```sh
pyenv install --list
```

##### With macOS Flags

```sh
PYTHON_CONFIGURE_OPTS="--with-system-expat" \
  CFLAGS="-I$(brew --prefix openssl)/include -I$(brew --prefix readline)/include -I$(xcrun --show-sdk-path)/usr/include" \
  LDFLAGS="-L$(brew --prefix openssl)/lib -L$(brew --prefix readline)/lib" \
  pyenv install [version]
```

##### With Linux Flags

```sh
CFLAGS="-I$(xcrun --show-sdk-path)/usr/include" \
  pyenv install [version]
```

#### Global

```sh
pyenv global [version]
```

#### Init

```sh
eval "$(pyenv init -)"
```

### Uninstall

```sh
rm -fR ~/.pyenv
```
