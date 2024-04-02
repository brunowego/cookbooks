# Extend with Google Tag Manager

## Installation

```sh
# Using Bun
bun add @next/third-parties
```

## Configuration

**Refer:** `./.env.local`

```env
NEXT_PUBLIC_GTM_ID='GTM-XYZ'
```

**Refer:** `./src/app/layout.tsx`

```tsx
import type { ReactNode, JSX } from 'react'
import { GoogleAnalytics } from '@next/third-parties/google'

interface RootLayoutProps {
  children: ReactNode
}

export default function RootLayout({ children }: RootLayoutProps): JSX.Element {
  return (
    <html lang="en">
      <body>{children}</body>

      {process.env.NEXT_PUBLIC_GTM_ID ? (
        <GoogleTagManager gtmId={process.env.NEXT_PUBLIC_GTM_ID} />
      ) : null}
    </html>
  )
}
```
