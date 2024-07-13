# Next.js Page

## Snippets

```tsx
import type { JSX } from 'react'

type UserPageProps = {
  params: { userId: string }
}

export default function UserPage({ params }: UserPageProps): JSX.Element {
  return <>{params.userId}</>
}
```
