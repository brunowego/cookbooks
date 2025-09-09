# React Query Keys

## Good Practices

```ts
// With filter
['workspace', 'resource', 'list', { visibility: 'private' }]

// Avoid empty object
['workspace', 'resource', 'list', {}]

// Good - This will invalidate all filters
['workspace', 'resources', 'list']
```
