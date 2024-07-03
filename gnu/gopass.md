# gopass

## Links

- [Code Repository](https://github.com/gopasspw/gopass)

## CLI

### Installation

```sh
# Using Homebrew
brew install gopass
```

### Commands

```sh
gopass -h
```

### Initialize

```sh
#
gopass setup

#
cat "$HOME/.config/gopass/config"
```

### Usage

```sh
#
gopass create

gopass find <search-term>

gopass ls

gopass show -c <path/to/key>

gopass recipients

gopass mounts
```

### Issues

#### TBD

```sh
⚠ No owner key found. Make sure your key is fully trusted.
gpg: godaddy.com: skipped: No public key
gpg: [stdin]: encryption failed: No public key
2024/07/01 20:33:58 failed to set "websites/godaddy.com/brunowego": failed to encrypt
```

TODO
