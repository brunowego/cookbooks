# NestJS

<!--
nest start -w --preserveWatchOutput

https://github.com/search?o=desc&q=path%3Apackage.json+path%3Aapps+content%3Anestjs&s=indexed&type=code

https://github.com/search?o=desc&q=path%3Asrc%2Fmodules+content%3Anestjs&s=indexed&type=code
-->

**Keywords:** Web Framework

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

### Issues

#### Missing Strict Property Initialization

```log
Property 'email' has no initializer and is not definitely assigned in the constructor
```

```json
{
  // ...
  "compilerOptions": {
    // ...
    "strictPropertyInitialization": false
  }
}
```

<!-- #### TBD

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

#### TBD

```log
SyntaxError: Cannot use import statement outside a module
```

TODO

#### TBD

```log
SyntaxError: Unexpected token 'export'
```

TODO

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
nest -h
```

### Usage

```sh
#
nest info

#
nest generate -h
#
nest g class config
```
