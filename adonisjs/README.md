# AdonisJS

<!--
https://github.com/CesarJrFontalvo/buen-comienzo-adonis-5/blob/main/Dockerfile
-->

## Links

- [Code Repository](https://github.com/adonisjs/core)
- [Main Website](https://adonisjs.com/)
- [Docs](https://docs.adonisjs.com)

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

#
node ace build --production

#
node ace make:migration users
node ace migration:run

#
node ace make:model User
node ace make:controller User
node ace make:exception BadRequest
node ace make:validator CreateUser

#
node ace make:seeder User
node ace db:seed
```

<!--
npm ci --production

node ace dump:rcfile

yarn add @adonisjs/lucid
node ace configure @adonisjs/lucid
-->

## Dockerfile

TODO
