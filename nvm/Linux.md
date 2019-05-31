# Linux

## Dependencies

### APT

```sh
sudo yum check-update
sudo yum -y install bash git
```

### APT

```sh
sudo apt update
sudo apt -y install bash git
```

## Installation

```sh
curl -o - https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
```

## Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# NVM
export NVM_DIR="$HOME/.nvm"
source "$NVM_DIR/nvm.sh"
```

```sh
sudo su - $USER
```
