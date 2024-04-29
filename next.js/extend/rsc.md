# React Server Components (RSC)

## Issues

### TBD

```log
Failed to fetch RSC payload for http://localhost:13000/sign-in/github. Falling back to browser navigation. TypeError: Failed to fetch
```

<!--
https://github.com/vercel/next.js/issues/60549
-->

TODO

### Ignore Prefetch

```log
GET https://acme.tld/sign-in/google?_rsc=1nyh2 404 (Not Found) fetch-server-response.ts:106
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
