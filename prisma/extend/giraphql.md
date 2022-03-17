# GiraphQL

## Links

- [Code Repository](https://github.com/hayes/pothos/tree/main/packages/plugin-prisma)

## Dependencies

- [GiraphQL](/giraphql.md#library)

## Installation

```sh
# Using Yarn
yarn add @giraphql/plugin-prisma  --dev
```

### Configuration

**Refer:** `./db/prisma/schema.prisma`

```prisma
// ...

generator giraphql {
  provider     = "prisma-giraphql-types"
  clientOutput = "@prisma/client"
  output       = "./giraphql-types.ts"
}

// ...
```

```sh
#
echo '/db/prisma/giraphql-types.ts' >> ./.gitignore

#
npx prisma generate
yarn dlx prisma generate
```

## Issues

### Missing `node_modules` Binary Path

```log
Error: Generator at prisma-giraphql-types could not start:

/bin/sh: prisma-giraphql-types: command not found
```

**Workaround:** Try use with `npx` instead of `yarn dlx`.

```sh
npx prisma generate
```
