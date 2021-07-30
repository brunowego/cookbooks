# detect-secrets

<!--
https://github.com/auth0/repo-supervisor
-->

## Links

- [Code Repository](https://github.com/Yelp/detect-secrets)
- [Alternatives](/alternatives.md#code-secrets)

## CLI

### Installation

#### Homebrew

```sh
brew install detect-secrets
```

### Commands

```sh
detect-secrets -h
```

### Usage

```sh
#
detect-secrets scan --list-all-plugins

#
detect-secrets scan \
  ./ \
  --all-files > \
    ./.secrets.baseline
```
