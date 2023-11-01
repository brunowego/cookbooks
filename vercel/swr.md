# Stale-While-Revalidate (SWR)

<!--
https://blog.logrocket.com/handling-data-fetching-next-js-useswr/#:~:text=SWR%2C%20which%20stands%20for%20Stale,stale%20data%20from%20the%20cache.
-->

**Keywords:** Server-Sent Events

## Links

- [Code Repository](https://github.com/vercel/swr)
- [Main Website](https://swr.vercel.app)

## Alternatives

- React Query

<!-- ##

```tsx
import useSWR from 'swr'

const fetcher = (url: string) => fetch(url).then(response => response.json())

const { data: items, error } = useSWR('/api/items', fetcher)
``` -->

## Articles

- [WebSockets vs Server-Sent Events: Key differences and which to use [2023 update]](https://ably.com/blog/websockets-vs-sse)
