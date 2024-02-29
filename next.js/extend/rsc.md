# React Server Components (RSC)

## Issues

### Ignore Prefetch

```log
Failed to fetch RSC payload for http://localhost:3000/api/auth/github. Falling back to browser navigation. TypeError: Failed to fetch
```

```tsx
<Link prefetch={false} href="/api/auth/github">
  GitHub
</Link>
```
