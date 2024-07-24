# Next.js Page

## Snippets

### URL Params

```tsx
import type { JSX } from 'react'

type UserPageProps = {
  params: { userId: string }
}

export default function UserPage({ params }: UserPageProps): JSX.Element {
  return <>{params.userId}</>
}
```

### Query Params

<!--
https://nextjs.org/docs/app/api-reference/functions/use-search-params
-->

TODO
