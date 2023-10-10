# dotenv-cli

<!--
https://github.com/entropitor/dotenv-cli/issues/37
-->

## Links

- [Code Repository](https://github.com/entropitor/dotenv-cli)

## Library

### Installation

```sh
# Using pnpm
pnpm add dotenv-cli -D
```

### Configration

**Refer:** `./package.json`

```json
{
  "scripts": {
    "<command>": "dotenv -- <command>"
  }
}
```

## CLI

### Installation

```sh
# Using NPM
npm install dotenv-cli -g

# Using Yarn 1.x
yarn global add dotenv-cli
```

### Commands

```sh
# Using local
dotenv -h
```

### Usage

```sh
#
dotenv -- <command>
```
