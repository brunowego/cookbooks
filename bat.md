# bat

## Links

- [Code Repository](https://github.com/sharkdp/bat)

## CLI

### Installation

#### Homebrew

```sh
brew install bat
```

#### Chocolatey

```sh
choco install bat
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# bat
alias cat='bat'
```

```sh
source ~/.zshrc
```

### Configuration

```sh
#
bat --list-themes

#
bat --generate-config-file

#
sed -i 's/#--theme="TwoDark"/--theme="OneHalfDark"/g' ~/.config/bat/config
```

### Commands

```sh
bat --help
```

### Usage

```sh
#
bat <filename>
```
