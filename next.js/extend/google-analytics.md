# Extend with Google Analytics

## Installation

```sh
# Using pnpm
pnpm add @next/third-parties

# Using Bun
bun add @next/third-parties
```

## Configuration

**Refer**: `./src/app/layout.tsx`

```tsx
import type { ReactNode, JSX } from 'react'
import { GoogleAnalytics } from '@next/third-parties/google'

interface RootLayoutProps {
  children: ReactNode
}

export default function RootLayout({ children }: RootLayoutProps): JSX.Element {
  return (
    <html lang="en">
      <body>
        {children}

        {process.env.NEXT_PUBLIC_GA_ID ? (
          <GoogleAnalytics gaId={process.env.NEXT_PUBLIC_GA_ID} />
        ) : null}
      </body>
    </html>
  )
}
```
