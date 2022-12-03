# redactr

## Links

- [Code Repository](https://github.com/dhoelle/redactr)

## CLI

### Installation

#### Homebrew

```sh
brew tap dhoelle/tap
brew install redactr
```

### Commands

```sh
redactr -h
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# redactr
export AES_KEY='xuY6/V0ZE29RtPD3TNWga/EkdU3XYsPtBIk8U4nzZyc='
export VAULT_ADDR='<host>'
export VAULT_TOKEN='<token>'
```

```sh
source ~/.zshrc
```

### Usage

```sh
#
redactr key
```

<!--
#
redactr redact <text>

#
redactr unredact <text>
-->

### Uninstall

#### Homebrew

```sh
brew uninstall redactr
brew untap dhoelle/tap
```
