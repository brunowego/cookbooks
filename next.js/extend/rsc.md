# React Server Components (RSC)

## Issues

### TBD

```log
Failed to fetch RSC payload for http://auth.acme.localtest.me:13000/sign-in/github. Falling back to browser navigation. TypeError: Failed to fetch
```

<!--
// export const dynamic = 'force-dynamic'

https://github.com/vercel/next.js/issues/48677
https://github.com/vercel/next.js/issues/60549
-->

TODO

### Ignore Prefetch

```log
GET https://acme.tld/sign-in/google?_rsc=1nyh2 404 (Not Found) fetch-server-response.ts:106
```

```log
Failed to fetch RSC payload for https://www.example.com/status. Falling back to browser navigation. TypeError: Failed to fetch
```

```log
Access to fetch at 'https://stats.uptimerobot.com/Tu7p9EAYgV?_rsc=1hap7' (redirected from 'https://www.example.com/status?_rsc=1hap7') from origin 'https://www.example.com' has been blocked by CORS policy: Response to preflight request doesn't pass access control check: No 'Access-Control-Allow-Origin' header is present on the requested resource. If an opaque response serves your needs, set the request's mode to 'no-cors' to fetch the resource with CORS disabled.
```

<!--
https://github.com/vercel/next.js/issues/60549
https://github.com/vercel/next.js/discussions/58357
-->

```tsx
import Link from 'next/link'
;<Link href="/api/auth/github" prefetch={false}>
  GitHub
</Link>
```
