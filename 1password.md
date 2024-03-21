# 1Password

<!--
data-1p-ignore
-->

## Links

- [Main Website](https://1password.com)
- [Dashboard](https://my.1password.com/home)
- [Download Extension](https://1password.com/downloads)

## App

### Installation

#### Homebrew

```sh
brew install --cask 1password
```

#### Chocolatey

```sh
choco install -yf -not-silent 1password
```

<!-- ### Tips

#### Save in 1Password

1. Extensions -> 1Password -> Settings
2. Autofill & save
   - Uncheck "Offer to fill and save password" -->

### Issues

#### macOS QR Code Failed

```log
QR code detection failed.
```

Use cell phone instead.

## CLI

### Installation

#### Homebrew

```sh
brew install --cask 1password-cli
```

### Commands

```sh
op -h
```

### Usage

```sh
#
op signin <example>
```

<!--
op inject -i app-config.1password.yaml.tpl -o app-config-credentials.yaml
-->
