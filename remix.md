# Remix

<!--
https://github.com/manawiki/core
https://github.com/yyong008/remix-antd-admin
https://github.com/darenmalfait/daren.be
https://metronome.sh
-->

## Links

- [Code Repository](https://github.com/remix-run/remix)
- [Main Website](https://remix.run/)
- [Alternatives](/alternatives.md#react-framework)

## Learning

- [Remix Guide](https://remix.guide)

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
    "build:remix": "remix build"
    // ...
  }
}
```
