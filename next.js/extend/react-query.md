# React Query

## Related

- [React Query](/react/react-query.md)

```tsx
import type { AppProps } from 'next/app'
import { QueryClient, QueryClientProvider } from 'react-query'
import { ReactQueryDevtools } from 'react-query/devtools'

const queryClient = new QueryClient()

function App({ Component, pageProps }: AppProps) {
  return (
    <>
      <QueryClientProvider client={queryClient}>
        <Component {...pageProps} />

        {process.env.NODE_ENV !== 'production' && <ReactQueryDevtools initialIsOpen={false} />}
      </QueryClientProvider>
    </>
  )
}

export default App
```
