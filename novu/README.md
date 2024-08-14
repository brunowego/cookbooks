# Novu

<!--
https://github.com/dha-stix/novu-headless
https://github.com/novuhq/novu-headless-demo-app
https://github.com/cdub615/wordle-teams/tree/main/src/app/novu/workflows
-->

**Keywords:** Notification Framework

## Links

- [Code Repository](https://github.com/novuhq/novu)
- [Main Website](https://novu.co)
- [Docs](https://docs.novu.co)
- [Dashboard](https://dashboard.novu.co)
  - [Playground](https://dashboard.novu.co/playground)

## Library

### Installation

```sh
# Using pnpm
pnpm add @novu/headless
```

### Issues

#### Missing `zod-to-json-schema`

```log
@acme/web:dev:  ⨯ TypeError: zodToJsonSchema.zodToJsonSchema is not a function
```

```sh
# Using pnpm
pnpm add zod-to-json-schema
```

<!-- ## CLI

### Usage

```sh
npx novu@latest dev \
  -p 3000 \
  -r /api/novu

npx novu@latest sync \
  --bridge-url <bridge-url> \
  --secret-key <secret-key>
``` -->
