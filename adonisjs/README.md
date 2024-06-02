# AdonisJS

<!--
https://github.com/CesarJrFontalvo/buen-comienzo-adonis-5/blob/main/Dockerfile
-->

<!--
{"message":"E_ROUTE_NOT_FOUND: Cannot GET:/ping"}

https://api.example.com/health
-->

**Keywords** Web Framework

## Links

- [Code Repository](https://github.com/adonisjs/core)
- [Main Website](https://adonisjs.com)
- [Docs](https://docs.adonisjs.com)
  - [Health check](https://docs.adonisjs.com/guides/health-check)

## Project

### Commands

```sh
yarn create adonis-ts-app -h
```

### Create

```sh
#
yarn create adonis-ts-app '<folder-name>' \
  --boilerplate 'api' \
  --name '<app-name>' \
  --eslint=true \
  --prettier=true \
  --encore=true

#
cd '<folder-name>'
```

## CLI

### Commands

```sh
node ace -h
```

### Usage

```sh
#
node ace generate:key

#
node ace serve --watch
```

<!--
node ace bull:listen

node ace dump:rcfile

yarn add @adonisjs/lucid
node ace configure @adonisjs/lucid
-->

#### Make

```sh
#
node ace make:model User

#
node ace make:controller User

#
node ace make:exception BadRequest

#
node ace make:validator CreateUser
```

#### Migration

```sh
#
node ace make:migration users

#
node ace migration:run
```

#### Seeder

```sh
#
node ace make:seeder User

#
node ace db:seed
```

#### Production Build

```sh
#
node ace build --production

#
cd ./build

# Using NPM
npm ci --production && \
  npm clean cache --force

# Using Yarn
yarn install --prod --frozen-lockfile && \
  yarn cache clean --all

#
node ./server.js
```

## Dockerfile

TODO

<!--
https://github.com/search?q=filename%3Adocker-entrypoint.sh+%22ace+migration%3Arun%22
-->
