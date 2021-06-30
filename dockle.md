# Dockle

Container Image Linter for Security, Helping build the Best-Practice Docker Image, Easy to start

**Keywords:** CIS Benchmarks

## Links

- [Code Repository](https://github.com/goodwithtech/dockle)

## CLI

### Installation

#### Homebrew

```sh
brew tap goodwithtech/r
brew install dockle
```

### Commands

```sh
dockle -h
```

### Usage

```sh
#
dockle docker.io/library/alpine:3.9
```

### Tips

#### Ignore File

```sh
cat << EOF > ./.dockleignore
CIS-DI-0001
EOF
```
