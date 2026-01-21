# rbenv

## CLI

### Dependencies

- [OpenSSL](/openssl.md#cli) (v1.1)
- [GNU Readline](/gnu/readline.md)
- [GNU Multiple Precision (GMP)](/gnu/gmp.md)

### Installation

```sh
# Using Homebrew
brew install rbenv

# Using Git
git clone https://github.com/rbenv/rbenv.git ~/.rbenv

( cd ~/.rbenv && ./src/configure && make -C src )

mkdir -p ~/.rbenv/plugins

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
```

### Environment

> For installation using Homebrew.

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshenv`:

```sh
# rbenv
eval "$(rbenv init -)"
```

> For installation using Git.

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshenv`:

```sh
# rbenv
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
export PATH="$HOME/.rbenv/bin:$PATH" # only for Git installation
eval "$(rbenv init -)"
```

```sh
sudo su - "$USER"
```

### Commands

```sh
rbenv -h
```

### Configuration

```sh
# Set project ruby version
echo 'ruby-2.6.5' > ./.ruby-version
```

### Usage

```sh
# List Versions
rbenv install -l

# Install
rbenv install # if have .ruby-version file
rbenv install <version>

# Versions
rbenv versions

# Setting
rbenv local <version>
rbenv global <version>

# Uninstall
rbenv uninstall <version>
```
