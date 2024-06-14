# NextAuth.js

<!--
https://github.com/Rocketseat/nivo.video/blob/main/packages/auth/package.json
-->

<!--
hashed_password: $2a$12$GITVPHJe/jAReisR0xTwsOKW5kY8mOE7/FDWm9KkgbdDpWNmh1eny | password: Pa$$w0rd!
-->

## Learn

- [Installing Auth.js](https://authjs.dev/getting-started/installation?framework=next.js)

## Library

### Installation

```sh
# Using pnpm
pnpm add next-auth@beta
```

### Configuration

```sh
#
npx auth secret

#
echo 'AUTH_SECRET=<secret>' > ./.env.local
```

<!--
https://generate-secret.vercel.app/32
-->

<!-- ```tsx
'use client'

import type { PropsWithChildren, JSX } from 'react'
import type { Session } from 'next-auth'

import { SessionProvider } from 'next-auth/react'

type NextAuthProviderProps = PropsWithChildren<{
  session: Session | null
}>

export default function NextAuthProvider({
  session,
  children,
}: NextAuthProviderProps): JSX.Element {
  return <SessionProvider session={session}>{children}</SessionProvider>
}
``` -->

### Issues

#### TBD

```log
Types of property 'transports' are incompatible.
```

**Refer:** `./package.json`

```json
{
  // ...
  "pnpm": {
    "overrides": {
      "@auth/core": "0.20.0"
    }
  }
}
```

#### Missing Secret

```log
[auth][error] MissingSecret: Please define a `secret`.. Read more at https://errors.authjs.dev#missingsecret
```

```env
AUTH_SECRET=
```

#### Missing Trust Host

```log
[auth][error] UntrustedHost: Host must be trusted. URL was: http://app.sellit.localtest.me:3000/api/auth/session. Read more at https://errors.authjs.dev#untrustedhost
```

<!--
https://github.com/nextauthjs/next-auth/issues/6113
-->

```ts
import type { NextAuthConfig } from 'next-auth'

export default {
  // ...
  trustHost: true,
} satisfies NextAuthConfig
```

#### Allow Dangerous Email Account Linking

```log
[auth][error] OAuthAccountNotLinked: Another account already exists with the same e-mail address. Read more at https://errors.authjs.dev#oauthaccountnotlinked
```

```ts
import GitHubProvider, { type GitHubProfile } from 'next-auth/providers/github'

export default GitHubProvider({
  // ...
  allowDangerousEmailAccountLinking: true,
})
```

#### TBD

```log
[auth][error] CredentialsSignin: Read more at https://errors.authjs.dev#credentialssignin
```

TODO

#### TBD

```log
[auth][error] CallbackRouteError: Read more at https://errors.authjs.dev#callbackrouteerror
[auth][cause]: Error: UNDEFINED_VALUE: Undefined values are not allowed
```

<!--
https://github.com/nextauthjs/next-auth/issues/8954
-->

TODO

#### TBD

```log
[auth][error] JWTSessionError: Read more at https://errors.authjs.dev#jwtsessionerror
[auth][cause]: Error: The edge runtime does not support Node.js 'net' module.
```

TODO

#### TBD

```log
[auth][error] CredentialsSignin: Read more at https://errors.authjs.dev#credentialssignin
```

TODO

#### TBD

```log
Error: The edge runtime does not support Node.js 'crypto' module.
...
../../node_modules/.pnpm/pg@8.11.5/node_modules/pg/lib/crypto/utils-webcrypto.js (21:1)
```

<!--
https://github.com/brianc/node-postgres/issues/3206
https://github.com/vercel/next.js/discussions/62985 | https://github.com/haocloo/issue
https://github.com/nextauthjs/next-auth/issues/10540
-->

TODO

#### TBD

```log
[auth][error] InvalidCheck: PKCE code_verifier cookie was missing.. Read more at https://errors.authjs.dev#invalidcheck
```

TODO

#### Missing Session Strategy

```log
[auth][error] JWTSessionError: Read more at https://errors.authjs.dev#jwtsessionerror
[auth][cause]: JWEInvalid: Invalid Compact JWE
```

<!--
https://github.com/nextauthjs/next-auth/discussions/4255
-->

**Refer:** `./src/lib/auth/config.ts`

```ts
import type { NextAuthConfig } from 'next-auth'

export default {
  // ...
  session: {
    strategy: 'jwt',
  },
} satisfies NextAuthConfig
```

#### TBD

```log
The inferred type of 'middleware' cannot be named without a reference to '../node_modules/next-auth/lib/types'. This is likely not portable. A type annotation is necessary. ts(2742)
```

<!--
https://github.com/nextauthjs/next-auth/issues/10568
-->

**Refer: (Workaround)** `./tsconfig.json`

```json
{
  // ...
  "compilerOptions": {
    "declaration": false,
    "declarationMap": false
    // ...
  }
  // ...
}
```

#### TBD

```log
Error: Client network socket disconnected before secure TLS connection was established
```

TODO

#### TBD

```log
no authorization code in "callbackParameters"
```

TODO
