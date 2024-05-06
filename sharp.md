# sharp

## Links

- [Code Repository](https://github.com/lovell/sharp)

## Library

### Installation

```sh
# Using pnpm
pnpm add sharp

# Using Bun
bun add sharp
```

### Issues

#### TBD

```log
Module not found: Can't resolve 'child_process'
...
⨯ ../../node_modules/.pnpm/detect-libc@2.0.3/node_modules/detect-libc/lib/detect-libc.js:6:1
```

<!--
https://stackoverflow.com/questions/72219192/unable-to-import-sharp-into-next-js-project-module-not-found-cant-resolve
-->

<!--
Only works on backend, not in frontend
-->

TODO

#### Wrong Build of sharp

**Dependencies:** [trash](/trash.md)

```log
Cannot find module '../build/Release/sharp-darwin-x64.node'
```

```sh
trash ./node_modules
```
