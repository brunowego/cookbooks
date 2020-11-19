# kiex

## CLI

### Dependencies

- [Erlang](/erlang.md)

### Installation

#### Unix-like

```sh
curl -sSL https://raw.githubusercontent.com/taylor/kiex/master/install | bash -s
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# kiex
source "$HOME/.kiex/scripts/kiex"
```

### Commands

```sh
kiex -h
```

### Usage

```sh
#
kiex list releases

#
kiex list

#
kiex install [version]

#
kiex use [version]

#
kiex default [version]
```
