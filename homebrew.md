# Homebrew

## Installation

```sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

## Commands

```sh
brew help
brew services -h
```

### Prefix

```sh
brew --prefix [package]
```

### Cellar

```sh
brew --cellar [package]
```

### Self update

```sh
cd "$(brew --repo)" && git fetch && git reset --hard origin/master && brew update
```

### Versions

```sh
brew list --versions [package]
```

### Leaves

```sh
brew leaves
```

## Clean Up

```sh
brew cleanup -s
```

## Switch

```sh
brew switch [formula] [version]
```

## List Cache

```sh
ls $(brew --cache)
```

## Dependencies

```sh
brew deps --tree --installed
```

## Issues

### Brew Lock

> Another active Homebrew process is already using \[name].formula.

```sh
rm -f /usr/local/var/homebrew/locks/*.lock
```
