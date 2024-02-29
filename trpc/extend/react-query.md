# tRPC extend with React Query

## Links

- [React Query](/react-query/README.md)

## Installation

```sh
# Using pnpm
pnpm add @tanstack/react-query @trpc/react-query
```

## Configuration

**Refer:** `./trpc.ts`

```ts
import { createTRPCReact } from '@trpc/react-query'

import { type AppRouter } from '@acme/trpc'

export { loggerLink, unstable_httpBatchStreamLink } from '@trpc/client'

export const trpc: ReturnType<typeof createTRPCReact<AppRouter>> =
  createTRPCReact<AppRouter>()
```
