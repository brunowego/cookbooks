# Extend with Scalar

## Links

- [Code Repository](https://github.com/scalar/scalar/tree/main/packages/hono-api-reference)

## Installation

```sh
# Using Bun
bun add @scalar/hono-api-reference
```

## Configuration

```ts
// ..
import { apiReference } from '@scalar/hono-api-reference'

app
  // ...

  .get(
    '/reference',
    apiReference({
      spec: {
        url: '/api/v1/openapi.json',
      },
    })
  )
```
