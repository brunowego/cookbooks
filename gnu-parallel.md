# GNU Parallel

## CLI

### Installation

#### Homebrew

```sh
brew install parallel
```

### Commands

```sh
parallel --help
```

### Issues

#### Conflict with moreutils

```sh
rm /usr/local/bin/parallel

ln -s "$(brew --prefix parallel)/bin/parallel" '/usr/local/bin/parallel'
```
