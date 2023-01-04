# Microsoft SQL Server (MSSQL)

## CLI

### Installation

#### Homebrew

```sh
brew install sqlcmd
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# MSSQL
export PATH="$PATH:/usr/local/opt/sqlcmd/bin"
```

```sh
sudo su - "$USER"
```

### Commands

```sh
sqlcmd --help
```

### Usage

```sh
#
sqlcmd \
  -S 127.0.0.1 \
  -U sa \
  -P '<password>' \
  -Q '<query>'
```
