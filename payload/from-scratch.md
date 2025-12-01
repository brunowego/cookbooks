# From Scratch

<!--
https://github.com/svetlyr/asg-club/tree/master/apps/cms
https://github.com/Syoongy/nakamichi-v2/tree/main/apps/cms/src
-->

## Bootstrap

```sh
#
npx create-next-app@latest \
  --ts \
  --use-pnpm \
  <app-name> && \
    "$_"

#
pnpm add payload @payloadcms/db-postgres @payloadcms/next @payloadcms/richtext-lexical sharp graphql

#
pnpm payload -h
```

<!--
pnpm payload migrate:status
pnpm payload generate:db-schema
pnpm payload migrate
-->

<!--
https://payloadcms.com/docs/getting-started/installation
-->

## Issues

### TBD

```log
[ Server ] Error: there is no unique or exclusion constraint matching the ON CONFLICT specification
```

TODO

### TBD

```log
Hydration failed because the server rendered HTML didn't match the client. As a result this tree will be regenerated on the client. This can happen if a SSR-ed Client Component used
```

<!--
https://github.com/payloadcms/payload/issues/10520

https://github.com/payloadcms/payload/blob/main/packages/next/src/layouts/Root/index.tsx#L103
-->

```ts
export default buildConfig({
  admin: {
    // ...
    suppressHydrationWarning: true,
  },
})
```

### TBD

```log
In HTML, <html> cannot be a child of <body>.
This will cause a hydration error.
```

<!--
https://github.com/payloadcms/payload/issues/9354
-->

TODO

### TBD

```log
[error: there is no parameter $1] {
  length: 95,
  severity: 'ERROR',
  code: '42P02',
  detail: undefined,
  hint: undefined,
  position: '175',
  internalPosition: undefined,
  internalQuery: undefined,
  where: undefined,
  schema: undefined,
  table: undefined,
  column: undefined,
  dataType: undefined,
  constraint: undefined,
  file: 'parse_expr.c',
  line: '864',
  routine: 'transformParamRef'
}
```

<!--
https://github.com/payloadcms/payload/issues/6094
-->

TODO
