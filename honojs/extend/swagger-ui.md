# Extend with Swagger UI

## Installation

```sh
# Using Bun
bun add @hono/swagger-ui
```

## Configuration

```js
// ...
import { swaggerUI } from '@hono/swagger-ui'

app
  // ...
  .get('/docs', swaggerUI({ url: '/api/v1/openapi.json' }))
```
