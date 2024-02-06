# Extend with Loki

## Links

- [Code Repository](https://github.com/axiomhq/axiom-js/tree/main/packages/pino)

## Library

### Installation

```sh
# Usinb Bun
bun add pino-loki
```

### Configuration

**Refer:** `./src/lib/logger.ts`

```ts
import pino from 'pino'

export const logger = pino({
  transport: {
    target: 'pino-loki',
    options: {
      host: 'localhost:3100',
    },
  },
})
```
