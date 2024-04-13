# MikroORM

<!--
https://github.com/medusajs/medusa/blob/develop/packages/store/mikro-orm.config.dev.ts
-->

## Links

- [Code Repository](https://github.com/mikro-orm/mikro-orm)
- [Main Website](https://mikro-orm.io)

## Library

### Installation

```sh
# Using pnpm
pnpm add @mikro-orm/core @mikro-orm/migrations
pnpm add @mikro-orm/cli ts-node -D
```

<!--
mikro-orm migration:generate
mikro-orm migration:create --initial
mikro-orm migration:create
mikro-orm migration:up
mikro-orm cache:clear
-->

### Issues

#### Missing TS Node Compiler Options

```log
error TS5095: Option 'bundler' can only be used when 'module' is set to 'preserve' or to 'es2015' or later.
```

<!--
https://github.com/cypress-io/cypress/issues/26308
-->

**Refer:** `./tsconfig.json`

```json
{
  // ...
  "ts-node": {
    "compilerOptions": {
      "module": "ESNext",
      "moduleResolution": "Node"
    }
  }
  // ...
}
```

## CLI

### Commands

```sh
npx @mikro-orm/cli -h
```
