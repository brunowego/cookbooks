# Extend with Middleware for API Subdomain

## Configuration

**Refer:** `./.env`

```env
NEXT_PUBLIC_ROOT_DOMAIN=acme.localhost

NEXT_PUBLIC_BASE_URL=http://acme.localhost:3000
NEXT_PUBLIC_API_URL=http://api.acme.localhost:3000
```

**Refer:** `./src/middleware.ts`

```ts
import { type NextRequest, NextResponse } from 'next/server'

export const parse = (req: NextRequest) => {
  const host = req.headers.get('host')?.split(':')[0]
  const path = req.nextUrl.pathname

  return { host, path }
}

export default async function middleware(req: NextRequest) {
  const { host, path } = parse(req)

  if (host === `api.${process.env.NEXT_PUBLIC_ROOT_DOMAIN}`) {
    return NextResponse.rewrite(new URL(`/api${path}`, req.url))
  }
}

export const config = {
  matcher: [
    /*
     * Match all paths except for:
     * 1. /api routes
     * 2. /_next (Next.js internals)
     * 3. /_static (inside /public)
     * 4. all root files inside /public (e.g. /favicon.ico)
     */
    '/((?!api/|_next/|_static/|_vercel|[\\w-]+\\.\\w+).*)',
  ],
}
```

**Refer:** `./next.config.mjs`

```mjs
/**
 * @type { import('next').NextConfig }
 */
const nextConfig = {
  async redirects() {
    return [
      {
        source: '/api/:path*',
        destination: `${process.env.NEXT_PUBLIC_BASE_URL}/docs`,
        permanent: false,
      },
    ]
  },

  // ...
}

export default nextConfig
```
