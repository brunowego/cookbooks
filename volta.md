# Volta

**Keywords:** Node.js Version Manager

<!--
Written in Rust
-->

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

# Volta Features
export VOLTA_FEATURE_PNPM=1
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
volta list <tool>

#
volta pin <tool>@<version>

#
volta which <tool>@<version>

# REPL
volta run <tool>@<version>
```

### Tips

#### Uninstall

```sh
#
volta list node

#
ls ~/.volta/tools/image/node/<version>

#
cat ~/.volta/tools/user/platform.json | jq '.node.runtime'
```

<!--
NOT SUPPORTED YET: volta uninstall <tool>@<version>
-->

<!-- #### Autocomplete

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Volta
source <(volta completions zsh) # bash
```

```sh
source ~/.zshrc
``` -->

### Issues

#### Missing PNPM

```log
 WARN  Unsupported engine: wanted: {"node":">=20.17.0 <20.18.0"} (current: {"node":"v20.12.2","pnpm":"9.7.0"})
apps/api                                 |  WARN  Unsupported engine: wanted: {"node":">=20.17.0 <20.18.0"} (current: {"node":"v20.12.2","pnpm":"9.7.0"})
apps/web                                 |  WARN  Unsupported engine: wanted: {"node":">=20.17.0 <20.18.0"} (current: {"node":"v20.12.2","pnpm":"9.7.0"})
```

```sh
export VOLTA_FEATURE_PNPM=1

volta pin pnpm
```
