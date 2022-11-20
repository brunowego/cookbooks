# detect-secrets

**Keywords:** Secrets Detection, SAST

## Links

- [Code Repository](https://github.com/Yelp/detect-secrets)

## CLI

### Installation

#### Homebrew

```sh
brew install detect-secrets
```

#### pip

```sh
pip3 install detect-secrets

#
pip3 install detect-secrets==1.0.3
```

### Commands

```sh
detect-secrets -h
```

### Usage

```sh
#
detect-secrets scan \
  --list-all-plugins

# For 1.0.x
detect-secrets scan \
  --all-files > \
    ./.secrets.baseline

# For 1.1.x
detect-secrets \
  -C ./ \
  scan \
    --all-files > \
      ./.secrets.baseline
```
