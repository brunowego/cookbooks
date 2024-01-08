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
volta install node
volta install pnpm
volta install yarn

#
volta list
volta list <tool>

#
volta pin <tool>
volta pin node@<version>

#
volta which <tool>
volta which yarn@<version>

# REPL
volta run <tool>
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
