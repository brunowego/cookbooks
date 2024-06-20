# Extend with Stripe

<!--
https://github.com/aliimam-in/aliimam/blob/main/apps/web/src/lib/stripe.ts

https://vercel.com/templates/next.js/subscription-starter

https://github.com/webprodigies/fuzzie-production/blob/main/src/app/api/payment/route.ts

https://github.com/vercel/nextjs-subscription-payments
-->

## Installation

```sh
# Using Bun
bun add @stripe/stripe-js stripe
```

## Configuration

**Refer:** `./.env.local`

```env
NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY=

STRIPE_SECRET_KEY=
STRIPE_WEBHOOK_SECRET=
```

**Refer:** `./package.json`

```json
{
  // ...
  "scripts": {
    // ...
    "stripe:login": "stripe login",
    "stripe:listen": "stripe listen --forward-to localhost:3000/api/webhooks",
    "stripe:fixtures": "stripe fixtures ./stripe-fixtures.json"
    // ...
  }
}
```
