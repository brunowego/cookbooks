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

**Dependency:** [alias](/shell/alias.md)

```sh
echo "alias cat='bat'" >> ~/.aliases

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

#
echo '{"bignum":1e1000}' | bat -p -l json
```
