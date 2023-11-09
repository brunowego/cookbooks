# Medusa Admin

<!--
MEDUSA_ADMIN_ONBOARDING_TYPE=default
PORT=7001
-->

## Links

- [Code Repository](https://github.com/medusajs/medusa/tree/master/packages/admin-ui)
- Docs
  - [Quickstart](https://docs.medusajs.com/admin/quickstart)
  - [API](https://docs.medusajs.com/api/admin)
  - [Deploy Admin to Vercel](https://docs.medusajs.com/deployments/admin/deploying-on-vercel)

<!--
https://github.com/medusajs/medusa/blob/develop/www/apps/docs/content/admin/configuration.md?plain=1
-->

## Library

### Installation

```sh
# Using pnpm
pnpm add @medusajs/admin
```

### Configuration

```sh
#
pnpm config set --local node-linker 'hoisted'

#
echo 'OPEN_BROWSER=false' ./.env
```

**Refer:** `./medusa-config.js`

```ts
const plugins = [
  // ...
  {
    resolve: '@medusajs/admin',
    /** @type {import('@medusajs/admin').PluginOptions} */
    options: {
      autoRebuild: true,
      develop: {
        open: process.env.OPEN_BROWSER !== 'false',
      },
    },
  },
]
```

## CLI

### Commands

```sh
npx @medusajs/admin -h
```

### Commands

```sh
medusa-admin -h
```

### Usage

```sh
#
medusa-admin develop

#
medusa-admin bundle

#
medusa-admin build
```

<!--
MEDUSA_ADMIN_BACKEND_URL= medusa-admin build --deployment
-->

## Issues

### TBD

```log
Invalid Host header
```

<!--
https://github.com/medusajs/medusa/pull/5548

https://github.com/medusajs/medusa/issues/4904
https://github.com/medusajs/medusa/discussions/4822

https://github.com/medusajs/medusa/pull/5548

https://v4.webpack.js.org/configuration/dev-server/#devserverdisablehostcheck
-->

TODO
