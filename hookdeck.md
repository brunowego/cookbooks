# Hookdeck

## Links

- [Org. Repository](https://github.com/hookdeck)
- [Main Website](https://hookdeck.com)
- [Console](https://console.hookdeck.com)

## CLI

### Links

- [Code Repository](https://github.com/hookdeck/hookdeck-cli)

### Installation

#### Homebrew

```sh
brew tap hookdeck/hookdeck
brew install hookdeck
```

### Commands

```sh
hookdeck -h
```

### Configuration

```sh
#
hookdeck login --cli-key <token>
```

### Usage

```sh
#
hookdeck listen <port-or-url>
hookdeck listen <port-or-url> <source-alias?>

# What should be your new source label? ACME
# What path should the webhooks be forwarded to (ie: /webhooks)? /api/webhooks
# What's your connection label (ie: My API)? API
```
