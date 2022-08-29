# ts-node

<!--
tsx
-->

## Links

- [Code Repository](https://github.com/TypeStrong/ts-node)
- [Main Website](https://typestrong.org/ts-node/)

## Library

### Installation

```sh
# Using Yarn
yarn add ts-node --dev
```

## CLI

### Usage

```sh
#
npx ts-node
yarn dlx ts-node

#
yarn dlx ts-node --showConfig # --files

#
yarn dlx ts-node ./index.ts
```

### Tips

#### TSConfig

**Refer:** `./tsconfig.json`

```json
{
  // ...
  "ts-node": {
    "compilerOptions": {
      "module": "commonjs",
      "target": "esnext"
    },
    "transpileOnly": true,
    "files": true
  }
}
```

```sh
yarn dlx ts-node --showConfig
```
