# Go Version Management (goenv)

## CLI

### Dependencies

#### Homebrew

```sh
brew install git
```

### Installation

#### Unix-like

```sh
git clone https://github.com/syndbg/goenv.git ~/.goenv
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# goenv
export GOENV_ROOT="$HOME/.goenv"
export GOENV_GOPATH_PREFIX='/usr/local/go'
export GOPATH="$HOME/.go"
export GOBIN="$GOPATH/bin"
export PATH="$GOENV_ROOT/bin:$GOBIN:$PATH"
```

```sh
sudo su - "$USER"
```

## Configuration

```sh
sudo mkdir -p /usr/local/go
sudo chown -R "$(whoami)" /usr/local/go
```

### Commands

```sh
goenv help
```

### Usage

```sh
# List
goenv install --list

# Install
goenv install [version]

# Check
goenv versions

# Global
goenv global [version]

# Initialize
eval "$(goenv init -)"

# Uninstall
goenv versions --bare | xargs -n 1 goenv uninstall -f

#
rm -fR ~/.goenv
rm -fR ~/.go
sudo rm -fR /usr/local/go
```
