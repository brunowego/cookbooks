# React Hook Form Resolvers

## Issues

### TBD

```log
Type 'number | undefined' is not assignable to type 'number'.
Type 'undefined' is not assignable to type 'number'.
```

<!--
Change from `z.number().default(0)` to `z.number().default(0).nullish()`
-->

TODO

### TBD

```log
@acme/app:build: ./node_modules/.pnpm/@hookform+resolvers@5.2.2_react-hook-form@7.65.0_react@19.0.0_/node_modules/@hookform/resolvers/zod/dist/zod.mjs:1:127
@acme/app:build: Module not found: Can't resolve 'zod/v4/core'
```

<!--
https://github.com/colinhacks/zod/issues/4879
-->

TODO
