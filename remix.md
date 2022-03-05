# Remix

<!--
https://github.com/darenmalfait/daren.be
-->

## Links

- [Code Repository](https://github.com/remix-run/remix)
- [Main Website](https://remix.run/)
- [Alternatives](/alternatives.md#react-framework)

## Library

### Installation

```sh
# Using NPM
# TODO

# Using Yarn
yarn add remix @remix-run/node @remix-run/react @remix-run/serve
yarn add @remix-run/dev --dev
```

## Configuration

**Refer:** `./package.json`

```json
{
  "scripts": {
    "postinstall": "remix setup node",
    "dev": "remix-serve build",
    "build:remix": "remix build",
    // ...
  }
}
```
