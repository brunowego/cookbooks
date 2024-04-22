# Stale-While-Revalidate (SWR)

**Keywords:** Data Fetching, Server-Sent Events

## Links

- [Code Repository](https://github.com/vercel/swr)
- [Main Website](https://swr.vercel.app)

## Learn

- [Handling data fetching in Next.js with useSWR](https://blog.logrocket.com/handling-data-fetching-next-js-useswr/)
- [WebSockets vs Server-Sent Events: Key differences and which to use [2023 update]](https://ably.com/blog/websockets-vs-sse)

## Library

### Installation

```sh
# Using pnpm
pnpm add swr
```

### Configuration

**Refer:** `./src/app/providers/swr.tsx`

```tsx
'use client'

import type { ReactNode, JSX } from 'react'
import { SWRConfig } from 'swr'

type SwrProviderProps = {
  children: ReactNode
}

export default function SwrProvider({
  children,
}: SwrProviderProps): JSX.Element {
  return (
    <SWRConfig
      value={{
        // errorRetryCount: 3,
        revalidateOnFocus: false,
        // fetcher: (resource, init) =>
        //   fetch(resource, init).then((res) => res.json()),
      }}
    >
      {children}
    </SWRConfig>
  )
}
```

<!-- ##

```tsx
import useSWR from 'swr'

const fetcher = (url: string) => fetch(url).then(response => response.json())

const { data: items, error } = useSWR('/api/items', fetcher)
``` -->
