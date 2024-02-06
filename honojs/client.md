# Hono Client (a.k.a RPC)

## Configuration

**Refer:** `./src/lib/api.ts`

```ts
import { hc } from 'hono/client'
import type { AppRoute } from '@acme/api'
import { publicEnv as penv } from '@/env'

export const api = hc<AppRoute>(`${penv.NEXT_PUBLIC_BASE_URL}/api`)

// export const api = hc<AppRoute>(`${penv.NEXT_PUBLIC_BASE_URL}/api`, {
//   fetch: (input: RequestInfo | URL, init?: RequestInit) => {
//     return fetch(input, {
//       ...init,
//       credentials: 'include',
//     })
//   },
// })
```
