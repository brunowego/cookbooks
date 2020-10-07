# rmtrash

## CLI

### Dependencies

#### Linux

- [trash-cli](/trash-cli.md)
- [cURL](/curl.md)
- [which](/which.md)

### Installation

#### Homebrew

```sh
brew install rmtrash
```

#### Linux

```sh
curl \
  -L 'https://raw.githubusercontent.com/PhrozenByte/rmtrash/master/rmtrash' \
  -o /usr/local/bin/rmtrash && \
    chmod +x /usr/local/bin/rmtrash
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Prevent Mistakes
alias rm='rmtrash'
```

```sh
sudo su - "$USER"
```
