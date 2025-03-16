# Extend with Region Not Available

## Snippet

**Refer:** `./apps/web/src/middleware.ts`

```tsx
import { type NextRequest, NextResponse } from 'next/server'
import { geolocation } from '@vercel/functions'

export function middleware(req: NextRequest) {
  const geo = geolocation(req)
  const country = geo.country || 'BR'

  if (req.nextUrl.pathname !== '/region-not-available' && country !== 'BR') {
    return NextResponse.redirect(new URL('/region-not-available', req.url), 303)
  }

  return NextResponse.next()
}

export const config = {
  matcher: [
    '/((?!api|_next/static|_next/image|favicon.ico|sitemap.xml|robots.txt).*)',
  ],
}
```
