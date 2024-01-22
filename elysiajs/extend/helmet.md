# Extend with Helmet

## Installation

```sh
# Using Bun
bun add @elysiajs/helmet
```

## Configuration

**Refer:** `./src/http/server.ts`

```ts
import { helmet } from '@elysiajs/helmet'

const app = new Elysia()

app
  // ...
  .use(helmet({ contentSecurityPolicy: false }))
```
