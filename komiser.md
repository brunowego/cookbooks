# Komiser

**Keywords:** Cloud Environment Inspector

## Links

- [Code Repository](https://github.com/tailwarden/komiser)
- [Main Website](https://komiser.io)
- [Docs](https://docs.komiser.io)

## CLI

### Installation

#### Homebrew

```sh
brew tap tailwarden/komiser
brew install komiser
```

### Commands

```sh
komiser -h
```

### Configuration

```sh
#
komiser config

#
cat << EOF > ~/.komiser/config.toml
[[aws]]
name="sandbox"
source="CREDENTIALS_FILE"
path=~/.aws/credentials
profile="default"
EOF
```

### Usage

```sh
#
komiser start \
  --config ~/.komiser/config.toml \
  --port 3000 \
  --telemetry false
```
