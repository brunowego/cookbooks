# Boilerplate

## App

**Refer:** `./src/pages/_app.tsx`

```tsx
import '../styles/globals.css'
import type { AppProps } from 'next/app'

export default function App({ Component }: AppProps) {
  return <Component />
}
```
