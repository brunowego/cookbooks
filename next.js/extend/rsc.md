# React Server Components (RSC)

## Issues

### Ignore Prefetch

```log
Failed to fetch RSC payload for http://localhost:3000/api/auth/github. Falling back to browser navigation. TypeError: Failed to fetch
```

<!--
https://github.com/vercel/next.js/issues/60549
https://github.com/vercel/next.js/discussions/58357
-->

```tsx
<Link href="/api/auth/github" prefetch={false}>
  GitHub
</Link>
```
