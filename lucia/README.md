# Lucia

## Links

- [Code Repository](https://github.com/lucia-auth/lucia)
- [Main Website](https://lucia-auth.com)
- [Examples](https://github.com/lucia-auth/examples)
- [Packages](https://github.com/lucia-auth/lucia/tree/main/packages)

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

#### Wrong PostgreSQL Adapter

```log
⨯ TypeError: date.getTime is not a function
```

<!--
https://github.com/lucia-auth/lucia/issues/1424
-->

Change PostgreSQL adapter, from `@lucia-auth/adapter-postgresql` to `@lucia-auth/adapter-drizzle`.

#### Missing Email

```log
Error: UNDEFINED_VALUE: Undefined values are not allowed
```

TODO

<!--
./src/app/api/auth/google/callback/route.ts

console.log(googleUser)

https://stackoverflow.com/questions/24442668/google-oauth-api-to-get-users-email-address
https://stackoverflow.com/questions/57315197/add-user-email-scope-to-google-oauth

https://console.cloud.google.com/apis/credentials/consent
-->
