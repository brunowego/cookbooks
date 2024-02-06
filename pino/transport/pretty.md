# Exten with pino-pretty

## Links

- [Code Repository](https://github.com/pinojs/pino-pretty)

## Library

### Installation

```sh
# Using Bun
bun add pino-pretty
```

### Configuration

**Refer:** `./src/lib/logger.ts`

```ts
import pino from 'pino'

export const logger = pino({
  transport: {
    target: 'pino-pretty',
    options: {
      colorize: true,
    },
  },
})
```

## CLI

### Installation

```sh
npm install pino-pretty -g
```

### Usage

```sh
#
node ./app.js | pino-pretty
```

<!--
"dev": "bun run --watch ./src/index.ts | pino-pretty -c"
-->
