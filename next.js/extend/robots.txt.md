# Extend with Robots.txt

## Configuration

**Refer:** `./src/app/robots.ts`

```tsx
import type { MetadataRoute } from 'next'

type Rules = MetadataRoute.Robots['rules']

const rules: Rules = {
  userAgent: '*',
  allow: '/',
  disallow: ['/api/', '/static/'],
}

export default function robots(): MetadataRoute.Robots {
  return {
    rules,
    sitemap: new URL('/sitemap.xml', process.env.NEXT_PUBLIC_BASE_URL).href,
  }
}
```

### Allow Robots

**Refer:** `./src/app/robots.ts`

```tsx
import type { MetadataRoute } from 'next'

type Rules = MetadataRoute.Robots['rules']

const allowRules: Rules = {
  userAgent: '*',
  allow: '/',
}

const disallowRules: Rules = {
  userAgent: '*',
  disallow: '/',
}

export default function robots(): MetadataRoute.Robots {
  return {
    rules: process.env.ALLOW_ROBOTS === 'true' ? allowRules : disallowRules,
    sitemap: new URL('/sitemap.xml', process.env.NEXT_PUBLIC_BASE_URL).href,
  }
}
```
