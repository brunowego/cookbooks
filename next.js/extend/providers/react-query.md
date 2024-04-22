# React Query

<!--
https://github.com/jeromverschoote/nextjs-playground/blob/main/src/hooks/usePosts.ts
-->

## Dependencies

- [React Query](/tanstack/react-query/README.md#library)

## Configuration

<!-- **Refer:** `./src/hooks/react-query.ts`

```ts
export { useQuery, useQueryClient } from 'react-query'
``` -->

**Refer:** `./src/app/providers/react-query.tsx`

```tsx
'use client'

import { type ReactNode, type JSX, useState } from 'react'
import { QueryClient } from '@tanstack/query-core'
import { QueryClientProvider } from '@tanstack/react-query'
import { ReactQueryStreamedHydration } from '@tanstack/react-query-next-experimental'
import { ReactQueryDevtools } from '@tanstack/react-query-devtools'

export default function ReactQueryProvider({
  children,
}: {
  children: ReactNode
}): JSX.Element {
  const [queryClient] = useState(
    () =>
      new QueryClient({
        defaultOptions: {
          queries: {
            // retry: false,
            staleTime: 5 * 1000, // 5 seconds
          },
        },
      })
  )

  return (
    <QueryClientProvider client={queryClient}>
      <ReactQueryStreamedHydration>{children}</ReactQueryStreamedHydration>

      <ReactQueryDevtools initialIsOpen={false} />
    </QueryClientProvider>
  )
}
```

**Refer:** `./src/app/providers/index.tsx`

```tsx
import type { ReactNode, JSX } from 'react'

import ReactQueryProvider from './react-query'

interface ProvidersProps {
  children: ReactNode
}

export default function Providers({ children }: ProvidersProps): JSX.Element {
  return <ReactQueryProvider>{children}</ReactQueryProvider>
}
```
