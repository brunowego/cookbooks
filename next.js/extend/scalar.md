# Extend with Scalar

## Links

- [Code Repository](https://github.com/scalar/scalar/tree/main/packages/nextjs-api-reference)

## Installation

```sh
# Using Bun
bun add @scalar/api-reference @scalar/nextjs-api-reference
```

## Configuration

**Refer:** `./src/app/reference/route.ts`

```ts
import { ApiReference } from '@scalar/nextjs-api-reference'

// import content from '/absolute/path/to/openapi.json'

const config = {
  spec: {
    // content
    url: '/api/v1/openapi.json',
  },
}

export const GET = ApiReference(config)
```
