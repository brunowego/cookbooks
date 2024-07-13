# Next.js Page 404

## Basic Structure

**Refer:** `./src/pages/404.tsx`

```tsx
import Error from 'next/error'

function NotFound() {
  return <Error statusCode={404} />
}

export default NotFound
```

<!--
src/app/not-found.tsx
-->
