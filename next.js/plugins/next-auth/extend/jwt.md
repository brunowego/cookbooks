# JWT

TODO

<!-- **Refer:** `./packages/auth/src/config.ts`

```ts
  callbacks: {
    jwt({ token, user }) {
      if (user) {
        token.id = user.id
      }

      return token
    },
    session({ session, token }) {
      session.user.id = token.id

      return session
    },
  },
``` -->

<!-- **Refer:** `./packages/auth/src/next-auth.d.ts`

```ts
import type { DefaultSession } from 'next-auth'

declare module 'next-auth' {
  interface Session {
    user: {
      id: string
    } & DefaultSession['user']
  }
}
``` -->

<!--
import 'next-auth'

declare module 'next-auth' {
  interface User {
    id: string
    givenName: string
    familyName: string
    email: string
    emailVerified: string
  }

  // interface Account {}

  // interface Session {}
}

// declare module 'next-auth/jwt' {}
-->
