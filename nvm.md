# Node Version Manager

## CLI

### Dependencies

#### APT

```sh
yum check-update
sudo yum -y install bash git
```

#### APT

```sh
sudo apt update
sudo apt -y install bash git
```

### Installation

#### Homebrew

```sh
brew install nvm
```

#### Git

```sh
curl -Ss https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | /bin/bash
```

### Environment

#### Homebrew

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# NVM
export NVM_DIR="$HOME/.nvm"
source '/usr/local/opt/nvm/nvm.sh'
```

```sh
sudo su - "$USER"
```

#### Linux

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# NVM
export NVM_DIR="$HOME/.nvm"
source "$NVM_DIR/nvm.sh"
```

```sh
sudo su - "$USER"
```

### Commands

```sh
nvm -h
```

### Usage

```sh
# List Versions
nvm ls-remote

# Install
nvm install [version]

# List
nvm ls

# Current
nvm current

# Alias
nvm alias default [version]
```
