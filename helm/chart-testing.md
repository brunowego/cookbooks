# Helm Chart Testing

## Links

- [Code Repository](https://github.com/helm/chart-testing)

## CLI

### Installation

#### Homebrew

```sh
brew install chart-testing
```

### Commands

```sh
ct -h
```

### Configuration

```sh
cat << EOF > ./.ct.yml
---
remote: origin
target-branch: main
chart-dirs:
  - charts
EOF
```

### Usage

```sh
#
ct lint --config ./.ct.yml

#
ct install --config ./.ct.yml
```
