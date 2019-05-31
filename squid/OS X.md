# OS X

## Installation

### Homebrew

```sh
brew install squid
```

## Environment

### Homebrew

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Squid
export PATH="/usr/local/sbin:$PATH"
```

```sh
sudo su - $USER
```

## Service

### Homebrew

```sh
brew services start squid
```
