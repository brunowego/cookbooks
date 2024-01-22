# Extend with CORS

## Installation

```sh
# Using Bun
bun add @elysiajs/cors
```

## Configuration

### Basic Usage

**Refer:** `./src/http/server.ts`

```ts
import { cors } from '@elysiajs/cors'

const app = new Elysia()

app
  // ...
  .use(
    cors({
      // origin: '*',
      methods: ['GET', 'POST', 'PUT', 'DELETE', 'PATCH', 'HEAD', 'OPTIONS'],
      // allowedHeaders: ['Content-Type'],
      // credentials: true
    })
  )
```

### Middleware

**Refer:** `./src/http/middlewares/cors.ts`

```ts
import type Elysia from 'elysia'

import { cors } from '@elysiajs/cors'

export const useCors = (app: Elysia) =>
  app.use(
    cors({
      methods: ['GET', 'POST', 'PUT', 'DELETE', 'PATCH', 'HEAD', 'OPTIONS'],
    })
  )
```

**Refer:** `./src/http/server.ts`

```ts
import Elysia from 'elysia'

const app = new Elysia()

app
  // ...
  .use(
    cors({
      // origin: '*',
      methods: ['GET', 'POST', 'PUT', 'DELETE', 'PATCH', 'HEAD', 'OPTIONS'],
      // allowedHeaders: ['Content-Type'],
      // credentials: true
    })
  )
```
