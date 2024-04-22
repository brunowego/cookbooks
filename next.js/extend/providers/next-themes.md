# next-themes

## Dependencies

- [next-themes](/next.js/plugins/next-themes.md)

**Refer:** `./packages/ui/src/providers/next-themes.ts`

```tsx
export type { ThemeProviderProps } from 'next-themes/dist/types'
export { ThemeProvider } from 'next-themes'
```

## Configuration

**Refer:** `./src/app/providers/next-themes.tsx`

```tsx
'use client'

import type { JSX } from 'react'

import {
  type ThemeProviderProps,
  ThemeProvider,
} from '@acme/ui/providers/next-themes'

export default function NextThemesProvider({
  children,
  ...props
}: ThemeProviderProps): JSX.Element {
  return <ThemeProvider {...props}>{children}</ThemeProvider>
}
```

**Refer:** `./src/app/providers/index.tsx`

```tsx
import type { ReactNode, JSX } from 'react'

import NextThemesProvider from './next-themes'

interface ProvidersProps {
  defaultTheme?: 'system' | 'light' | 'dark'
  children: ReactNode
}

export default function Providers({
  defaultTheme = 'system',
  children,
}: ProvidersProps): JSX.Element {
  return (
    <NextThemesProvider
      attribute="class"
      defaultTheme={defaultTheme}
      enableSystem
      disableTransitionOnChange
    >
      {children}
    </NextThemesProvider>
  )
}
```
