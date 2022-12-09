# azctx

**Keywords:** Azure Account Switcher

## Links

- [Code Repository](https://github.com/StiviiK/azctx)

## Alternative

- [Azure Account Switcher](https://github.com/abij/az-account-switcher)

## CLI

### Installation

#### Homebrew

```sh
brew tap stiviik/tap
brew install azctx
```

<!--
https://github.com/StiviiK/azctx/releases/download/v1.0/azctx_linux_amd64.zip
https://github.com/StiviiK/azctx/releases/download/v1.0/azctx_windows_amd64.zip
-->

### Commands

```sh
azctx -h
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# azctx
export AZURE_CONFIG_DIR="$HOME/.azure"
```

```sh
sudo su - "$USER"
```

### Usage

```sh
#
azctx -c

#
azctx
```
