# Extend with CORS

<!--
https://github.com/kojikawazu/trip-web-app/blob/main/src/app/api/mail/send/route.ts

https://codingwithmanny.medium.com/3-ways-to-configure-cors-for-nextjs-13-app-router-api-route-handlers-427e10929818
https://stackoverflow.com/questions/70995299/allow-cors-from-one-next-js-app-to-another
-->

<!--
requestHeaders.set('Access-Control-Allow-Credentials', 'true')

requestHeaders.set(
  'Access-Control-Allow-Methods',
  'GET, POST, PUT, PATCH, DELETE, OPTIONS',
)
-->

## Configuration

**Refer:** `./next.config.mjs`

```mjs
/**
 * @type { import('next').NextConfig }
 */
const nextConfig = {
  async headers() {
    return [
      {
        source: '/:path*',
        headers: [
          { key: 'Access-Control-Allow-Credentials', value: 'true' },
          { key: 'Access-Control-Allow-Origin', value: '*' },
          {
            key: 'Access-Control-Allow-Methods',
            value: 'GET, POST, PUT, PATCH, DELETE, OPTIONS',
          },
          {
            key: 'Access-Control-Allow-Headers',
            value: 'Authorization, Content-Type, Date',
          },
        ],
      },
    ]
  },

  // ...
}

export default nextConfig
```

## Issues

### Missing `Access-Control-Allow-Origin` Header

```log
Access to XMLHttpRequest at 'http://api.acme.localtest.me:13000/auth/sign-in' from origin 'http://auth.acme.localtest.me:13000' has been blocked by CORS policy: Response to preflight request doesn't pass access control check: No 'Access-Control-Allow-Origin' header is present on the requested resource.
```

**Refer:** `./src/middleware.ts`

```ts
export default async function middleware(req: NextRequest) {
  const requestHeaders = new Headers(req.headers)
  requestHeaders.set('Access-Control-Allow-Origin', '*')

  // ...

  if (hasSubdomain('api', domain)) {
    return NextResponse.rewrite(new URL(`/api${path}`, req.url), {
      headers: requestHeaders,
    })
  }

  return NextResponse.next({
    request: {
      headers: requestHeaders,
    },
  })
}
```

### Missing `Access-Control-Allow-Headers` Header

```log
Access to XMLHttpRequest at 'http://api.acme.localtest.me:13000/auth/sign-in' from origin 'http://auth.acme.localtest.me:13000' has been blocked by CORS policy: Request header field content-type is not allowed by Access-Control-Allow-Headers in preflight response.
```

**Refer:** `./src/middleware.ts`

```ts
export default async function middleware(req: NextRequest) {
  const requestHeaders = new Headers(req.headers)
  requestHeaders.set(
    'Access-Control-Allow-Headers',
    'Accept, Authorization, Content-Type, Next-Router-Prefetch, Next-Router-State-Tree, Next-Url, RSC'
  )

  // ...

  if (hasSubdomain('api', domain)) {
    return NextResponse.rewrite(new URL(`/api${path}`, req.url), {
      headers: requestHeaders,
    })
  }

  return NextResponse.next({
    request: {
      headers: requestHeaders,
    },
  })
}
```

### TBD

```log
Access to fetch at 'http://app.acme.localtest.me:13000/api/test' (redirected from 'http://auth.acme.localtest.me:13000/api/auth/redirect?_rsc=i4rls') from origin 'http://auth.acme.localtest.me:13000' has been blocked by CORS policy: No 'Access-Control-Allow-Origin' header is present on the requested resource. If an opaque response serves your needs, set the request's mode to 'no-cors' to fetch the resource with CORS disabled.
```

<!-- ```sh
curl \
  -I \
  -X OPTIONS \
  -H 'Origin: http://auth.acme.localtest.me:13000' \
  http://app.acme.localtest.me:13000/api/test
``` -->

**Refer:** `./src/app/api/.../route.ts`

```ts
export function GET(): Response {
  return Response.json(
    {},
    {
      headers: {
        'Access-Control-Allow-Origin': '*',
      },
    }
  )
}
```

### TBD

```log
Access to XMLHttpRequest at 'http://api.acme.localtest.me:13000/redirect' (redirected from 'http://api.acme.localtest.me:13000/auth/sign-in') from origin 'http://auth.acme.localtest.me:13000' has been blocked by CORS policy: Response to preflight request doesn't pass access control check: It does not have HTTP ok status.
```

<!--
Invalid URL: http://api.acme.localtest.me:13000/auth/redirect
-->

TODO

<!--
export async function OPTIONS(): Promise<Response> {
  return new Response(null, {
    status: 200,
  })
}
-->

### TBD

```log
Access to fetch at 'http://app.acme.localtest.me:13000/' (redirected from 'http://auth.acme.localtest.me:13000/redirect?_rsc=1nyh2') from origin 'http://auth.acme.localtest.me:13000' has been blocked by CORS policy: Request header field rsc is not allowed by Access-Control-Allow-Headers in preflight response.
```

TODO

### TBD

```log
Access to fetch at 'http://app.acme.localtest.me:13000/' (redirected from 'http://auth.acme.localtest.me:13000/redirect?_rsc=i4rls') from origin 'http://auth.acme.localtest.me:13000' has been blocked by CORS policy: Response to preflight request doesn't pass access control check: Redirect is not allowed for a preflight request.
```

TODO

### TBD

```log
Access to fetch at 'http://app.acme.localtest.me:13000/api/test' (redirected from 'http://auth.acme.localtest.me:13000/api/auth/redirect?_rsc=i4rls') from origin 'http://auth.acme.localtest.me:13000' has been blocked by CORS policy: Request header field next-router-state-tree is not allowed by Access-Control-Allow-Headers in preflight response.
```

TODO

### Missing `Access-Control-Allow-Origin` Header on OPTIONS Handler

```log
Access to fetch at 'http://app.acme.localtest.me:13000/api/test' (redirected from 'http://auth.acme.localtest.me:13000/api/auth/redirect?_rsc=i4rls') from origin 'http://auth.acme.localtest.me:13000' has been blocked by CORS policy: Response to preflight request doesn't pass access control check: No 'Access-Control-Allow-Origin' header is present on the requested resource. If an opaque response serves your needs, set the request's mode to 'no-cors' to fetch the resource with CORS disabled.
```

**Refer:** `./src/app/api/.../route.ts`

```ts
export function OPTIONS(): Response {
  return new Response(null, {
    status: 200,
    headers: {
      'Access-Control-Allow-Origin': '*',
    },
  })
}
```

### Missing OPTIONS Handler

```log
Access to XMLHttpRequest at 'http://app.acme.localtest.me:13000/' (redirected from 'http://api.acme.localtest.me:13000/auth/sign-up') from origin 'http://auth.acme.localtest.me:13000' has been blocked by CORS policy: Response to preflight request doesn't pass access control check: Redirect is not allowed for a preflight request.
```

**Refer:** `./src/app/api/.../route.ts`

```ts
export function OPTIONS(): Response {
  return new Response(null, {
    status: 200,
  })
}
```

**Refer:** `./src/middleware.ts`

```ts
export default async function middleware(req: NextRequest) {
  const requestHeaders = new Headers(req.headers)

  // ...

  if ('OPTIONS' === req.method) {
    return new Response(null, {
      status: 200,
      headers: requestHeaders,
    })
  }

  // ...
}
```
