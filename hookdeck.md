# Hookdeck

## Links

- [Org. Repository](https://github.com/hookdeck)
- [Main Website](https://hookdeck.com)
- [Console](https://console.hookdeck.com)

## Library

### Installation

```sh
# Using pnpm
pnpm install hookdeck-cli -D
```

<!--
npx hookdeck-cli -h
-->

### Configuration

```json
{
  "scripts": {
    "webhook:listen": "hookdeck listen 3000 acme --path /api/webhook"
  }
}
```

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
hookdeck project list

#
hookdeck listen <port-or-url>
hookdeck listen <port-or-url> <source-alias?>
# ex:
hookdeck listen 3000 acme --path /api/webhooks
```

<!--
completion
-->
