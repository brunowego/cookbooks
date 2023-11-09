# Mozilla Secrets OPerationS (SOPS)

**Keywords:** Secret Manager

## Links

- [Code Repository](https://github.com/mozilla/sops)

## Videos

- [Mozilla SOPS: Secrets OPerationS](https://youtube.com/watch?v=DWzJ87KbwxA)

## CLI

### Installation

#### Homebrew

```sh
brew install sops
```

### Commands

```sh
sops -h
```

### Configuration

**Refer:** `./.sops.yaml`

```yml
---
creation_rules:
  - path_regex:
```

### Usage

```sh
#
sops -e --input-type json ./config.json > ./config.json.encrypted
sops -e --input-type yaml ./config.yaml > ./config.yaml.encrypted
sops -e --input-type env ./config.env > ./config.env.encrypted
```

<!--
--pgp '<pgp-finger-print>'
-->

### Issues

#### Missing Config File

```log
config file not found and no keys provided through command line options
```

Missing configuration file `./.sops.yaml`.

#### TBD

```log
Error unmarshalling file: Could not unmarshal input data: invalid character 'e' looking for beginning of value
```

TODO
