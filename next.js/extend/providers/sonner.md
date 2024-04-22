# Sonner (Toaster)

## Dependencies

- [Sonner](/sonner.md)

```sh
#
pnpx shadcn-ui@latest add -c ./packages/ui sonner
```

**Refer:** `./packages/ui/src/hooks/use-theme.ts`

```ts
export { useTheme } from 'next-themes'
```

**Refer:** `./packages/ui/src/providers/sonner.ts`

```ts
export { Toaster as default } from 'sonner'
```

## Configuration

**Refer:** `./src/app/providers/sonner.tsx`

```tsx
'use client'

import type { ComponentProps, JSX } from 'react'

import Sonner from '@sellit/ui/providers/sonner'
import { useTheme } from '@sellit/ui/hooks/use-theme'

type SonnerProviderProps = ComponentProps<typeof Sonner>

export default function SonnerProvider({
  ...props
}: SonnerProviderProps): JSX.Element {
  const { theme = 'system' } = useTheme()

  return (
    <Sonner
      theme={theme as SonnerProviderProps['theme']}
      className="toaster group"
      toastOptions={{
        classNames: {
          toast:
            'group toast group-[.toaster]:bg-background group-[.toaster]:text-foreground group-[.toaster]:border-border group-[.toaster]:shadow-lg',
          description: 'group-[.toast]:text-muted-foreground',
          actionButton:
            'group-[.toast]:bg-primary group-[.toast]:text-primary-foreground',
          cancelButton:
            'group-[.toast]:bg-muted group-[.toast]:text-muted-foreground',
        },
      }}
      {...props}
    />
  )
}
```

**Refer:** `./src/app/providers/index.tsx`

```tsx
import type { ReactNode, JSX } from 'react'

import SonnerProvider from './sonner'

interface ProvidersProps {
  children: ReactNode
}

export default function Providers({ children }: ProvidersProps): JSX.Element {
  return (
    <>
      {children}

      <SonnerProvider />
    </>
  )
}
```
