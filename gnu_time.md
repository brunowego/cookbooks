# GNU time

## CLI

### Installation

#### Homebrew

```sh
brew install gnu-time
```

#### YUM

```sh
yum check-update
sudo yum -y install time
```

### Environment

#### Homebrew

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# GNU time
export PATH="/usr/local/opt/gnu-time/libexec/gnubin:$PATH"
```

```sh
sudo su - "$USER"
```

### Commands

```sh
# Homebrew
gtime --help

# Linux
/usr/bin/time --help
```
