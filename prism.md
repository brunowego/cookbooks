# Prism

**Keywords:** Mocking

## Links

- [Code Repository](https://github.com/stoplightio/prism)
- [Main Website](https://stoplight.io/open-source/prism)

## CLI

### Installation

```sh
# Using NPM
npm install @stoplight/prism-cli -g

# Using Yarn
yarn global add @stoplight/prism-cli
```

### Commands

```sh
prism -h
```

### Usage

<!--
https://docs.stoplight.io/docs/prism/beeaad4dc0227-prism-cli
-->

```sh
#
prism mock https://raw.githack.com/OAI/OpenAPI-Specification/master/examples/v3.0/petstore-expanded.yaml

#
curl -s 'http://127.0.0.1:4010/pets/123' | jq

#
curl -v 'http://127.0.0.1:4010/pets/123' -H 'Prefer: code=404'
```
