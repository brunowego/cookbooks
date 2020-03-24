# rbenv

## CLI

### Dependencies

#### Homebrew

```sh
brew install \
  openssl \
  readline
```

#### YUM

```sh
yum check-update
sudo yum -y install \
  git \
  make \
  openssl-devel \
  readline-devel \
  zlib-devel
```

### Installation

#### Homebrew

```sh
brew install rbenv
```

#### Git

```sh
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
( cd ~/.rbenv && ./src/configure && make -C src )
```

```sh
mkdir -p ~/.rbenv/plugins
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
```

### Environment

> For installation using Git.

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Darwin
echo $(brew --prefix openssl@1.1)

# rbenv
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=/usr/local/opt/openssl@1.1"
export PATH="$HOME/.rbenv/bin:$PATH"
```

```sh
sudo su - "$USER"
```

### Commands

```sh
rbenv -h
```

### Usage

```sh
# List Versions
rbenv install -l

# Install
rbenv install [version]

# Initialize
eval "$(rbenv init -)"

# Versions
rbenv versions

# Setting
rbenv local [version]
rbenv global [version]

# Uninstall
rbenv uninstall [version]
```
