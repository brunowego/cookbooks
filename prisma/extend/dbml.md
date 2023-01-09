# Database Markup Language (DBML)

## Links

- [Code Repository](https://github.com/notiz-dev/prisma-dbml-generator)

## Related

- [Database Markup Language (DBML)](/dbml.md)

## Installation

```sh
# Using Yarn
yarn add prisma-dbml-generator --dev

# Using pnpm
pnpm add prisma-dbml-generator -D
```

## Configuration

**Refer:** `./db/prisma/schema.prisma`

```prisma
// ...

generator dbml {
  provider = "prisma-dbml-generator"
  output   = "../dbml"
}

// ...
```

```sh
#
npx prisma generate
yarn dlx prisma generate
```

### Missing `node_modules` Binary Path

```log
Error: Generator at prisma-dbml-generator could not start:

/bin/sh: prisma-dbml-generator: command not found
```

**Workaround:** Try use with `npx` instead of `yarn dlx`.

```sh
npx prisma generate
```
