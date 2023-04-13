# Optic

<!--
https://github.com/opticdev/action

https://www.useoptic.com/docs/openapi/generate-from-traffic
-->

**Keywords:** OpenAPI Testing

## Links

- [Code Repository](https://github.com/opticdev/optic)
- [Main Website](https://useoptic.com)
- [Docs](https://useoptic.com/docs)

## CLI

### Links

- [Main Website](https://useoptic.com/cli)

### Installation

```sh
# Using NPM
npm install @useoptic/optic -g
```

### Commands

```sh
optic -h
```

### Configuration

```sh
#
optic login

#
cat ~/.config/optic/config.json
```

### Usage

```sh
#
optic api add ./openapi.yml

#
optic diff ./openapi.yml --base main
optic diff ./openapi.yml --base main --check
optic diff ./openapi.yml --base main --web
```

<!--
#
optic api add --all

#
optic capture ./openapi.yml http://127.0.0.1:3000

#
optic update ./openapi.yml --all

#
optic diff ./openapi.yaml --base main --check --ruleset ./optic.dev.yml
-->
