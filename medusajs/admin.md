# Medusa Admin

<!--
PORT=7001
-->

## Links

- [Code Repository](https://github.com/medusajs/medusa/tree/master/packages/admin-ui)
- Docs
  - [API](https://docs.medusajs.com/api/admin)
  - [Deploy Admin to Vercel](https://docs.medusajs.com/deployments/admin/deploying-on-vercel)

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
