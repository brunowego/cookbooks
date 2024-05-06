# Reka.js

<!--
https://craft.js.org

https://github.com/nicolas-angelo/page-builder
-->

## Links

- [Code Repository](https://github.com/prevwong/reka.js)
- [Main Website](https://reka.js.org)
- [Docs](https://reka.js.org/docs)

## Library

### Installation

```sh
# Using pnpm
pnpm add @rekajs/core @rekajs/react @rekajs/types
```

### Issues

#### Missing `'use client'`

```log
Error: mobx-react-lite requires React with Hooks support
```

Add `use client` on top of the file.

```ts
'use client'

// ...
```

#### Missing `evaluateImmediately` to `createFrame`

```log
Error: Hydration failed because the initial UI does not match what was rendered on the server.
See more info here: https://nextjs.org/docs/messages/react-hydration-error
```

<!--
https://github.com/prevwong/reka.js/issues/78
-->

```tsx
reka.createFrame({
  // ...
  evaluateImmediately: true,
})
```
