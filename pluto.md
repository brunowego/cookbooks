# Pluto

## Links

- [Code Repository](https://github.com/FairwindsOps/pluto)
- [Docs](https://pluto.docs.fairwinds.com)

## CLI

### Installation

#### Homebrew

```sh
brew tap FairwindsOps/tap
brew install pluto
```

#### Darwin Binary

```sh
curl \
  -L \
  'https://github.com/FairwindsOps/pluto/releases/download/v4.2.0/pluto_4.2.0_darwin_amd64.tar.gz' | \
    tar -xzC /usr/local/bin pluto
```

#### Linux Binary

```sh
curl \
  -L \
  'https://github.com/FairwindsOps/pluto/releases/download/v4.2.0/pluto_4.2.0_linux_amd64.tar.gz' | \
    tar -xzC /usr/local/bin pluto
```

### Commands

```sh
pluto
```

### Usage

```sh
#
pluto detect-files \
  -d ./ \
  -o wide

#
pluto detect-helm \
  -o wide

pluto detect-helm \
  -n cert-manager \
  -o wide

#
helm template e2e/tests/assets/helm3chart | \
  pluto detect -

#
pluto list-versions -f ./new.yaml
```
