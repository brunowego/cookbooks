# TypeORM

## Links

- [Code Repository](https://github.com/typeorm/typeorm)
- [Main Website](https://typeorm.io/)

## Docs

- [Using CLI](https://orkhan.gitbook.io/typeorm/docs/using-cli)

## CLI

### Commands

```sh
# Using NPM
npx typeorm -h

# Using Yarn
yarn dlx typeorm -h
```

### Usage

```sh
#
typeorm migration:generate -n

#
typeorm migration:create -n init

#
typeorm migration:run

#
typeorm migration:revert
```

<!--
npx typeorm migration:create src/migrations/PostCreate
-->
