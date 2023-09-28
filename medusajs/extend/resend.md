# [WIP] Extend with Resend

## Links

- [Code Repository](https://github.com/pevey/medusa-plugin-resend)

## Dependencies

- [Resend](/resend.md)

## Installation

```sh
# Using Yarn
yarn add medusa-plugin-resend
```

## Configuration

**Refer:** `./.env`

```env
RESEND_API_KEY=re_{...}
RESEND_FROM=
RESEND_TEMPLATE_PATH=data/templates
```

**Refer:** `./medusa-config.js`

```js
const plugins = [
  // ...
  {
    resolve: 'medusa-plugin-resend',
    options: {
      api_key: process.env.RESEND_API_ID,
      from: process.env.RESEND_FROM,
      template_path: process.env.RESEND_TEMPLATE_PATH,
    },
  },
]
```

<!-- ## Templates

### User Invite

**Refer:** `./src/subscribers/invite.ts`

```ts

``` -->
