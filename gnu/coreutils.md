# GNU Core Utilities

## CLI

### Installation

```sh
# Using Homebrew
brew install coreutils

# Using YUM
yum check-update
sudo yum -y install coreutils

# Using Chocolatey
choco install -y gnuwin32-coreutils.install
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

**Homebrew:**

```sh
# GNU Core Utilities
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
```

```sh
sudo su - "$USER"
```
