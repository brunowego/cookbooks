# Scalar

## Links

- [Swagger Editor](https://docs.scalar.com/swagger-editor)
- [Main Website](https://github.com/scalar/scalar)
- [Sandbox](https://sandbox.scalar.com)

## CLI

### Links

- [Code Repository](https://github.com/scalar/cli/tree/main/packages/cli)

### Installation

```sh
# Using NPM
npm install @scalar/cli -g

# Using Bun
bun add @scalar/cli -g
```

### Comands

```sh
scalar -h
#
npx @scalar/cli -h
```

<!-- ### Initialize

```sh
#
scalar init
cat ./scalar.config.json
``` -->

### Usage

```sh
#
scalar validate <path|url>

#
scalar format <path|url> --output ./openapi.json

#
scalar share ./openapi.json

#
scalar reference <path|url> -wp 3000
```

<!--
scalar mock <path|url> --watch
-->

### Isseus

#### Conflict with Git Scalar

Conflict with another package with same name.

```sh
#
where scalar
scalar help

#
unlink /usr/local/bin/scalar
```
