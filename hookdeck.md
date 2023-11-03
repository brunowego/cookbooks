# Hookdeck

## Links

- [Org. Repository](https://github.com/hookdeck)
- [Main Website](https://hookdeck.com)
- [Console](https://console.hookdeck.com)

<!-- ## Library

### Installation

```sh
# Using pnpm
pnpm install hookdeck-cli -D
``` -->

## CLI

### Links

- [Code Repository](https://github.com/hookdeck/hookdeck-cli)

### Installation

#### NPM

```sh
npm install hookdeck-cli -g
```

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
hookdeck workspace list

#
hookdeck listen <port-or-url>
hookdeck listen <port-or-url> <source-alias?>

hookdeck listen 3000 shopify

# What should be your new source label? ACME
# What path should the webhooks be forwarded to (ie: /webhooks)? /api/webhooks
# What's your connection label (ie: My API)? API
```
