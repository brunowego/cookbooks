# tRPC

<!--
https://github.com/trpc/trpc/tree/main/examples/next-prisma-starter

https://github.com/nrademacher/invee
-->

<!--
CORS

https://github.com/nnad3N/pdf-generator/blob/main/src/app/api/trpc/%5Btrpc%5D/route.ts
-->

## Referrer

- [tRPC](/trpc.md)

## Learning

- [Client Usage / Set up with Next.js](https://trpc.io/docs/client/nextjs/setup)

## Issues

### Missing tRPC Provider

```log
Error: Cannot read properties of undefined (reading '_context')
```

<!--
https://stackoverflow.com/questions/77918106/cannot-read-properties-of-undefined-reading-context-using-trpc-with-getuser
-->

Check if correctly wrapper with `TrpcProvider`:

```tsx
import { type ReactNode, type JSX } from 'react'

import { TrpcProvider } from './trpc'
import { ReactQueryProvider } from './react-query'

interface ProvidersProps {
  children: ReactNode
}

export function Providers({ children }: ProvidersProps): JSX.Element {
  return (
    <TrpcProvider>
      <ReactQueryProvider>{children}</ReactQueryProvider>
    </TrpcProvider>
  )
}
```

### TBD

```log
Attempted import error: 'Hydrate' is not exported from '@tanstack/react-query' (imported as 'Hydrate').
```

TODO

<!--
Rollback to 4.36.1

"@tanstack/react-query": "~4.36.1",
-->

### TBD

```log
../../node_modules/@trpc/react-query/dist/createHooksInternal-063195fc.mjs
Attempted import error: 'hashQueryKey' is not exported from '@tanstack/react-query' (imported as 'hashQueryKey').
```

<!--
https://github.com/trpc/trpc/issues/4218
https://github.com/trpc/trpc/issues/5006
https://github.com/trpc/trpc/issues/5157
https://tanstack.com/query/v5/docs/framework/react/guides/migrating-to-v5#hashquerykey-has-been-renamed-to-hashkey

https://trpc.io/docs/migrate-from-v10-to-v11
-->

TODO

<!--
Rollback to 4.36.1

"@tanstack/react-query": "~4.36.1",
-->
