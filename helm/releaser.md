# Chart Releaser

## Links

- [Code Repository](https://github.com/helm/chart-releaser)

## CLI

### Installation

#### Homebrew

```sh
brew tap helm/tap
brew install chart-releaser
```

### Commands

```sh
cr -h
```

### Configuration

```sh
cat << EOF > ./.cr.yml
---
owner: henkiz
git-repo: helm-charts
pages-branch: main
EOF
```

### Usage

```sh
#
cr package ./

#
cr index \
  -o <owner> \
  -r <repo-url>

#
cr upload
```

### Issues

#### TBD

```log
✖ Git Error: revspec '0000000000000000000000000000000000000000' not found
```

TODO
