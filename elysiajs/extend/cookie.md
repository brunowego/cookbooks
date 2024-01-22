# Extend with Cookie

## Links

- [Code Repository](https://github.com/elysiajs/elysia-cookie)

## Installation

```sh
# Using Bun
bun add @elysiajs/cookie
```

## Configuration

**Refer:** `./src/http/server.ts`

```ts
import { cookie } from '@elysiajs/cookie'

const app = new Elysia()

app
  // ...
  .use(cookie())
```
