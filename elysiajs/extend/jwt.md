# Extend with JWT

<!--
https://github.com/rocketseat-education/pizzashop-api/blob/main/src/http/authentication.ts
-->

## Links

- [Docs](https://elysiajs.com/plugins/jwt)

## Installation

```sh
# Using Bun
bun add @elysiajs/jwt
```

## Configuration

**Refer:** `./src/http/server.ts`

```ts
import { jwt } from '@elysiajs/jwt'

import { env } from '@/env'

const app = new Elysia()

app
  // ...
  .use(
    jwt({
      secret: env.JWT_SECRET!,
    })
  )
```
