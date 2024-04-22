# Drizzle Kit

## Links

- [Code Repository](https://github.com/drizzle-team/drizzle-kit-mirror)

## CLI

### Installation

```sh
# Using NPM
npm install drizzle-kit -g
```

### Commands

```sh
drizzle-kit -h
```

### Usage

```sh
#
drizzle-kit introspect:pg
```

### Issues

#### Locked stdin

<!--
https://github.com/vercel/turbo/issues/1235
-->

```sh
( cd ./packages/db; npx drizzle-kit generate:pg )
```
