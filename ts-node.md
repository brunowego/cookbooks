# ts-node

## Links

- [Code Repository](https://github.com/TypeStrong/ts-node)
- [Main Website](https://typestrong.org/ts-node/)

## Alternative

- [TypeScript Execute (tsx)](/tsx.md)

## Library

### Installation

```sh
# Using NPM
npm install ts-node --save-dev

# Using Yarn
yarn add ts-node --dev
```

## CLI

### Commands

```sh
# Using Yarn DLX
yarn dlx ts-node -h

# Using Local
ts-node -h
```

### Usage

```sh
#
ts-node --showConfig # --files

#
ts-node ./index.ts
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
#
ts-node --showConfig

#
tsc --pretty --noEmit
```
