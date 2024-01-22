# TypeORM

**Keywords:** TypeScript ORM, SQL, NoSQL

## Links

- [Code Repository](https://github.com/typeorm/typeorm)
- [Main Website](https://typeorm.io)

## Docs

- [Using CLI](https://orkhan.gitbook.io/typeorm/docs/using-cli)

## Library

### Installation

```sh
# Using Bun
bun add typeorm
```

## CLI

### Commands

```sh
# Using NPM
npx typeorm -h

# Using Yarn
yarn dlx typeorm -h

# Using pnpm
pnpm dlx typeorm -h
```

### Initialization

```sh
npx typeorm init -n ./ --db postgres
```

<!--
mysql, mariadb, postgres, cockroachdb, sqlite, mssql, sap, spanner, oracle, mongodb, cordova, react-native, expo, nativescript
-->

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

<!-- ### Issues -->

<!-- #### TBD -->

<!-- https://stackoverflow.com/questions/71803499/typeorm-when-trying-to-run-migrations-missing-required-argument-datasource?source=post_page-----42f781267563-------------------------------- -->
