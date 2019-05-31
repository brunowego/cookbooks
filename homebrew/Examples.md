# Commands

## Paths

### Prefix

```sh
brew --prefix [package]
```

### Cellar

```sh
brew --cellar [package]
```

## Update

```sh
brew update
```

## Upgrade

```sh
brew upgrade
```

## Self update

```sh
cd $(brew --repo) && git fetch && git reset --hard origin/master && brew update
```

## Installed

```sh
brew list
```

### Versions

```sh
brew list --versions [package]
```

#### Get version

```sh
brew list --versions [package] | tr ' ' '\n' | tail -1
```

### Cask

```sh
brew cask list
```

## Install

```sh
brew install [package]
```

### Cask

```sh
brew cask install [package]
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

## Cache

### List

```sh
ls $(brew --cache)
```

### Remove

## Info

```sh
brew info [package]
```

## Doctor

```sh
brew doctor
```

## Dependencies

```sh
brew deps --tree --installed
```
