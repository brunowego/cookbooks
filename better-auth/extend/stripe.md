# Extend with Stripe

TODO

<!--
https://github.com/search?q=path%3A.ts%20content%3A%22%40better-auth%2Fstripe%22&type=code

https://github.com/indieceo/Indiesaas
https://github.com/kirklin/boot-nextjs

https://github.com/simstudioai/sim/blob/main/apps/sim/lib/auth.ts
https://github.com/R44VC0RP/agenda.dev/blob/main/lib/auth.ts
https://github.com/openlaunch-org/Open-Launch/blob/main/lib/auth.ts
-->

```sh
# Using pnpm
pnpm add stripe
```

**Refer:** `./package.json`

```json
{
  // ...
  "scripts": {
    // ...
    "stripe:login": "stripe login",
    "stripe:listen": "stripe listen --forward-to localhost:3000/api/auth/stripe/webhook",
    "stripe:fixtures": "stripe fixtures ./stripe-fixtures.json"
    // ...
  }
}
```
