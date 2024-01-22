# Extend with Static Files

## Installation

```sh
# Using Bun
bun add @elysiajs/static
```

## Configuration

**Refer:** `./src/http/server.ts`

```ts
import { staticPlugin } from '@elysiajs/static'

const app = new Elysia()

app
  // ...
  .use(
    staticPlugin({
      prefix: '/static',
      assets: './static',
    })
  )
```
