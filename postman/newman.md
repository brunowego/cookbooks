# Newman

<!--
https://github.com/stonith404/pingvin-share/blob/main/backend/test/newman-system-tests.json
-->

## Links

- [Code Repository](https://github.com/postmanlabs/newman)

## Package

### Installation

```sh
# Using pnpm
pnpm add newman -D
```

## CLI

### Installation

```sh
# Using NPM
npm install newman -g
```

### Commands

```sh
newman -h
```

### Structure

```sh
#
mkdir -p ./.postman

#
touch ./.postman/<app-name>.postman_collection.json
touch ./.postman/env.dev.json
```

### Usage

```sh
#
newman run \
  -e ./.postman/env.dev.json \
  -r html,cli,json,junit \
  ./.postman/<app-name>.postman_collection.json
```
