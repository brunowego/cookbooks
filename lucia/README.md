# Lucia

<!--
https://github.com/QuiiBz/ogstudio
https://github.com/odicho/next-lucia-auth-example
https://github.com/sainseni/what-i-read-today
https://github.com/antoninpire/kanban
https://github.com/bricesuazo/scrtmsg
https://github.com/thantko20/memcards

https://github.com/Darkness-2/realworld-approuter-trpc
https://github.com/antoninpire/analytics
-->

<!--
Theme Example
https://github.com/juliankoehn/nextjs-saas-starter/blob/main/src/app/providers.tsx
-->

## Links

- [Code Repository](https://github.com/lucia-auth/lucia)
- [Main Website](https://lucia-auth.com)
- [Examples](https://github.com/lucia-auth/examples)
- [Packages](https://github.com/lucia-auth/lucia/tree/main/packages)

<!--
https://blog.logrocket.com/password-based-authentication-next-js-lucia/
https://lucia-auth.com/database-adapters/prisma/
https://v3.lucia-auth.com/guides/email-and-password/2fa
-->

## Library

### Installation

```sh
# Using pnpm
pnpm add @lucia-auth/adapter-postgresql @lucia-auth/oauth lucia
```

<!--
csrfProtection:
  process.env.NODE_ENV === 'production'
    ? {
        host: 'ei.sweaties.net',
      }
    : false,

experimental: {
  debugMode: process.env.DEBUG === 'true',
},

sessionCookie: {
  attributes: {
    domain:
      process.env.NODE_ENV === 'production'
        ? 'sweaties.net'
        : ip.address(undefined, 'ipv4'),
  },
},
-->

### Issues

#### Missing Email

```log
Error: UNDEFINED_VALUE: Undefined values are not allowed
```

<!--
./src/app/api/auth/google/callback/route.ts

console.log(googleUser)

https://stackoverflow.com/questions/24442668/google-oauth-api-to-get-users-email-address
https://stackoverflow.com/questions/57315197/add-user-email-scope-to-google-oauth

https://console.cloud.google.com/apis/credentials/consent
-->
