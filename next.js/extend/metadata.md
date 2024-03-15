# Extend with Metadata

## Configuration

```tsx
import type { Metadata } from 'next'
// ...

export const metadata: Metadata = {
  title: {
    default: 'ACME',
    template: '%s — ACME',
  },
  description: 'TBD',
  icons: {
    icon: [{ url: '/favicon.svg', type: 'image/svg+xml' }],
  },
}

// ...
```

<!--
page.tsx

export { generateMetadata } from './generate-metadata'

generate-metadata.ts
-->

<!-- ```tsx
// 'use client'

import type { Metadata } from 'next'

// import { useLingui } from '@lingui/react'

export async function generateMetadata(): Promise<Metadata> {
  // const { i18n } = useLingui()

  return {
    // title: t(i18n)`Active Sales Platform`,
    // title: i18n._('Active Sales Platform'),
    title: 'Active Sales Platform',
  }
}
``` -->

## Issues

### TBD

```log
⚠ metadataBase property in metadata export is not set for resolving social open graph or twitter images, using "http://localhost:3000". See https://nextjs.org/docs/app/api-reference/functions/generate-metadata#metadatabase
```

TODO
