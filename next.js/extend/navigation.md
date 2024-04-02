# Extend with Navigation

## Configuration

```tsx
import type { JSX } from 'react'
import { useParams } from 'next/navigation'
import Link from 'next/link'

export default function SignIn(): JSX.Element {
  const { slug } = useParams<{ slug: string }>()

  return <Link href={`/${slug}/sign-up`}>Sign up</Link>
}
```
