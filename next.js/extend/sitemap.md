# Extend with Sitemap

<!--
https://github.com/openstatusHQ/openstatus/blob/main/apps/web/src/app/sitemap.ts

https://github.com/sadmann7/skateshop/blob/main/src/app/sitemap.ts
-->

## Configuration

**Refer:** `./src/app/sitemap.ts`

```ts
import type { MetadataRoute } from 'next'

type Page = MetadataRoute.Sitemap[number]

export default function sitemap(): MetadataRoute.Sitemap {
  const routes = ['/', '/terms', '/privacy'].map(
    (route): Page => ({
      url: `${process.env.NEXT_PUBLIC_BASE_URL}${route}`,
      lastModified: new Date().toISOString().split('T')[0],
    })
  )

  return [...routes]
}
```
