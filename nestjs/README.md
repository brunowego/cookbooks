# NestJS

<!--
nest start -w --preserveWatchOutput

https://github.com/search?o=desc&q=path%3Apackage.json+%22nestjs%22+path%3Aapps&s=indexed&type=code
-->

## Links

- [Code Repository](https://github.com/nestjs/nest)
- [Main Website](https://nestjs.com)
- [Docs](https://docs.nestjs.com)

<!--
https://github.com/nestjs/nest/issues/1006
-->

## Docs

- [Configuration](https://docs.nestjs.com/techniques/configuration)
- [Controllers](https://docs.nestjs.com/controllers)

## Library

### Installation

```sh
# Using Yarn
yarn add @nestjs/cli --dev

# Using pnpm
pnpm add @nestjs/cli -D
```

<!-- ### Issues

#### TBD

```log
ERROR [ExceptionHandler] Cannot set property metadata of #<Repository> which has only a getter
TypeError: Cannot set property metadata of #<Repository> which has only a getter
```

**Refer:** `./package.json`

```json
{
  // ...
  "resolutions": {
    "tslib": "2.2.0"
  }
}
``` -->

## CLI

### Execute

```sh
# Using NPX
npx nest -h
# or
npx @nestjs/cli -h
```

### Installation

```sh
# Using NPM
npm install -g @nestjs/cli
```

### Commands

```sh
npx nest -h
```

### Usage

```sh
#
npx nest info

#
npx nest generate -h
npx nest g class config
```
