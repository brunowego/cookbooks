# Extend with Axiom

## Links

- [Code Repository](https://github.com/axiomhq/axiom-js/tree/main/packages/pino)

## Library

### Installation

```sh
# Usinb Bun
bun add @axiomhq/pino
```

### Configuration

**Refer:** `./src/lib/logger.ts`

```ts
import pino from 'pino'

export const logger = pino({
  transport: {
    target: '@axiomhq/pino',
    options: {
      dataset: process.env.AXIOM_DATASET,
      token: process.env.AXIOM_TOKEN,
    },
  },
})
```
