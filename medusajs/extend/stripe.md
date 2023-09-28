# Extend with Stripe

## Links

- [Code Repository](https://github.com/medusajs/medusa/tree/master/packages/medusa-payment-stripe)
- [Plugin](https://medusajs.com/plugins/medusa-payment-stripe)
- [Docs](https://docs.medusajs.com/plugins/payment/stripe)

## Dependencies

- [Stripe](/stripe/README.md)

## Installation

```sh
# Using Yarn
yarn add medusa-payment-stripe
```

## Configuration

**Refer (app):** `./.env`

```env
STRIPE_API_KEY=sk_{...}
# STRIPE_WEBHOOK_SECRET=whsec_{...} # Only in production
```

**Refer (storefront):** `./.env`

```env
NEXT_PUBLIC_STRIPE_KEY=pk_{...}
```

**Refer:** `./medusa-config.js`

```js
const plugins = [
  // ...
  {
    resolve: 'medusa-payment-stripe',
    options: {
      api_key: process.env.STRIPE_API_KEY,
      // webhook_secret: process.env.STRIPE_WEBHOOK_SECRET,
    },
  },
]
```
