# Extend with Scalar

## Links

- [Code Repository](https://github.com/scalar/scalar/tree/main/packages/nextjs-api-reference)

## Installation

```sh
# Using Bun
bun add @scalar/nextjs-api-reference
```

## Configuration

**Refer:** `./src/app/api/reference/route.ts`

```ts
import { ApiReference } from '@scalar/nextjs-api-reference'

const config = {
  spec: {
    content: await (
      await fetch(`${process.env.NEXT_PUBLIC_API_URL}/specs/openapi.json`)
    ).json(),
  },
}

export const GET = ApiReference(config)
```
