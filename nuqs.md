# nuqs

<!--
https://github.com/lucasbaquinoo/nextjs-template
https://github.com/sujjeee/starter
https://github.com/okazawa0929/nuqs-demo
https://github.com/zakiego/nuqs-playground
-->

## Links

- [Code Repository](https://github.com/47ng/nuqs)
- [Main Website](https://nuqs.47ng.com)
- Docs
  - [Debugging](https://nuqs.47ng.com/docs/debugging)

## Demos

- [Next.js with nuqs](https://github.com/brunowego/nextjs-journey/tree/with-nuqs)

## Library

### Installation

```sh
# Using pnpm
pnpm add nuqs
```

### Issues

#### TBD

<!--
Normally associated with monorepos.
-->

```log
Error: [nuqs] nuqs requires an adapter to work with your framework.
```

<!--
https://github.com/47ng/nuqs/issues/798
https://github.com/47ng/nuqs/blob/next/errors/NUQS-303.md?plain=1
https://blog.gitcode.com/5991ea0c1d7872b5717f243004240d75.html
-->

<!--
1. Try redeploying the app.
2. Try enable the debug mode. https://nuqs.47ng.com/docs/debugging
-->

TODO

<!--
https://github.com/pubpub/platform/commit/8846ac932c10cf5642e8f2235433fcd67a022a09 | https://github.com/47ng/nuqs/issues/798#issuecomment-3069601994
-->

#### TBD

```log
use-data-table.ts:21 [nuqs] Multiple adapter contexts detected. This might happen in monorepos.
```

<!--
https://medium.com/@ramunarasinga/error-handling-in-nuqs-source-code-ab56bda3f1f1
https://github.com/47ng/nuqs/blob/next/errors/NUQS-303.md | https://github.com/47ng/nuqs/issues/798
-->

TBD

#### TBD

```log
TypeError: Cannot read properties of null (reading 'toString')
```

TODO

#### TBD

```log
Page Unresponsive
```

<!--
https://github.com/47ng/nuqs/issues/423
-->

<!--
const tableData = useMemo(() => results ?? [], [results]);

const { getHeaderGroups, getRowModel } = useReactTable({
  data: tableData,
  // ...
})
-->

TODO
