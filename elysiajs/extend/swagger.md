# Extend with Swagger

<!--
http://localhost:3000/swagger

http://localhost:3000/docs/json
-->

## Links

- [Code Repository](https://github.com/elysiajs/elysia-swagger)

## Installation

```sh
# Using Bun
bun add @elysiajs/swagger
```

## Configuration

**Refer:** `./src/http/server.ts`

```ts
import { swagger } from '@elysiajs/swagger'

const app = new Elysia()

app
  // ...
  .use(
    swagger({
      // provider: 'swagger-ui',
      documentation: {
        info: {
          title: 'API Documentation',
          version: '0.0.0',
        },
      },
      path: '/docs',
      exclude: ['/docs', '/docs/json'],
    })
  )
```
