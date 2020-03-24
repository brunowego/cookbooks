# GNU Core Utilities

## CLI

### Installation

#### Homebrew

```sh
brew install coreutils
```

#### YUM

```sh
yum check-update
sudo yum -y install coreutils
```

#### Chocolatey

```sh
choco install -y gnuwin32-coreutils.install
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# GNU Core Utilities
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH" # Homebrew
```

```sh
sudo su - "$USER"
```
