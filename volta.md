# Volta

**Keywords:** Node.js Version Manager

## Links

- [Code Repository](https://github.com/volta-cli/volta)
- [Main Website](https://volta.sh)

## CLI

### Dependencies

- [OpenSSL](/openssl.md) (Version 1.1)

### Installation

#### Homebrew

```sh
brew install volta
```

### Commands

```sh
volta -h
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Volta
export PATH="$PATH:$HOME/.volta/bin"
```

```sh
source ~/.zshrc
```

### Configuration

```sh
#
volta setup
```

### Usage

```sh
#
volta install <tool>@<version>

#
volta list
volta list <tool>@<version>

#
volta pin <tool>@<version>

#
volta which <tool>@<version>

# REPL
volta run <tool>@<version>

#
volta uninstall <tool>@<version>
```

<!-- ### Tips

#### Autocomplete

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Volta
source <(volta completions zsh) # bash
```

```sh
source ~/.zshrc
``` -->
