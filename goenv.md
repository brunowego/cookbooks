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

#### macOS

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
sudo su - $USER
```

#### Linux

```sh
sudo tee /etc/profile.d/goenv.sh << 'EOF'
export GOENV_ROOT="$HOME/.goenv"
export GOENV_GOPATH_PREFIX='/usr/local/go'
export GOPATH="$HOME/.go"
export GOBIN="$GOPATH/bin"
export PATH="$GOENV_ROOT/bin:$GOBIN:$PATH"
EOF
```

```sh
sudo su - $USER
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

#### Install

```sh
goenv install --list
```

```sh
goenv install [version]
```

#### Global

```sh
goenv global [version]
```

#### Init

```sh
eval "$(goenv init -)"
```

### Uninstall

```sh
rm -fR ~/.goenv
rm -fR ~/.go
rm -fR /usr/local/go
```
