# React Query

<!--
https://github.com/jeromverschoote/nextjs-playground/blob/main/src/hooks/usePosts.ts
-->

## Dependencies

- [React Query](/react/react-query.md)

## Configuration

**Refer:** `./src/hooks/index.ts`

```ts
export { useQuery, useQueryClient } from 'react-query'
```

**Refer:** `./src/pages/_app.tsx`

```tsx
import { QueryClient, QueryClientProvider } from 'react-query'
import type { AppProps } from 'next/app'
import { ReactQueryDevtools } from 'react-query/devtools'

const queryClient = new QueryClient()

function App({ Component, pageProps }: AppProps) {
  return (
    <>
      <QueryClientProvider client={queryClient}>
        <Component {...pageProps} />

        {process.env.NODE_ENV !== 'production' && (
          <ReactQueryDevtools initialIsOpen={false} />
        )}
      </QueryClientProvider>
    </>
  )
}

export default App
```
