# Extend with X

## Configuration

**Refer:** `./.env.local`

```env
X_CLIENT_ID=
X_CLIENT_SECRET=
X_REDIRECT_URI=http://localhost:3000/api/auth/x/callback
```

**Refer:** `./apps/web/src/app/(auth)/sign-in/x/route.ts`

```ts
import { cookies } from 'next/headers'

import { generateState, generateCodeVerifier, x } from '@acme/auth/providers'

export async function GET(): Promise<Response> {
  const state = generateState()
  const codeVerifier = generateCodeVerifier()
  const url = await x.createAuthorizationURL(state, codeVerifier, {
    scopes: ['users.read'],
  })

  cookies().set('x_oauth_state', state, {
    path: '/',
    httpOnly: true,
    maxAge: 60 * 10,
    sameSite: 'lax',
    secure: process.env.NODE_ENV === 'production',
  })

  cookies().set('x_oauth_code_verifier', codeVerifier, {
    path: '/',
    httpOnly: true,
    maxAge: 60 * 10,
    sameSite: 'lax',
    secure: process.env.NODE_ENV === 'production',
  })

  return Response.redirect(url)
}
```

**Refer:** `./apps/web/src/app/api/auth/x/callback/route.ts`

```ts
import { cookies } from 'next/headers'
import { OAuth2RequestError } from 'arctic'

import { generateId } from '@acme/id'

import { x } from '@acme/auth/providers'
import { auth } from '@acme/auth'
import { db } from '@acme/db'
import { usersTable } from '@acme/db/schema'
import { eq } from '@acme/db/orm'

interface XUser {
  id: string
  // picture: string
  email: string
  name: string
}

export async function GET(request: Request): Promise<Response> {
  const url = new URL(request.url)
  const code = url.searchParams.get('code')
  const state = url.searchParams.get('state')
  const storedState = cookies().get('x_oauth_state')?.value ?? null
  const storedCodeVerifier =
    cookies().get('x_oauth_code_verifier')?.value ?? null

  if (
    !code ||
    !state ||
    !storedState ||
    state !== storedState ||
    !storedCodeVerifier
  ) {
    return new Response(null, {
      status: 400,
    })
  }

  try {
    const tokens = await x.validateAuthorizationCode(code, storedCodeVerifier)

    console.log('tokens', tokens)

    const xUserResponse = await fetch('https://api.twitter.com/2/users/me', {
      headers: {
        Authorization: `Bearer ${tokens.accessToken}`,
      },
    })

    console.log('xUserResponse', await xUserResponse.json())

    const xUser: XUser = await xUserResponse.json()
    console.log('xUser', xUser)
    const existingUser = await db.query.usersTable.findFirst({
      where: eq(usersTable.xId, xUser.id),
    })

    if (existingUser) {
      // @ts-ignore
      const session = await auth.createSession(existingUser.id, {})
      const sessionCookie = auth.createSessionCookie(session.id)

      cookies().set(
        sessionCookie.name,
        sessionCookie.value,
        sessionCookie.attributes
      )

      return new Response(null, {
        headers: {
          Location: '/',
        },
        status: 302,
      })
    }

    const userId = generateId()

    await db.insert(usersTable).values({
      id: userId,
      email: xUser.email,
      firstName: xUser.name,
      // avatar: xUser.picture,
      xId: xUser.id,
    })

    // @ts-ignore
    const session = await auth.createSession(userId, {})
    const sessionCookie = auth.createSessionCookie(session.id)

    cookies().set(
      sessionCookie.name,
      sessionCookie.value,
      sessionCookie.attributes
    )

    return new Response(null, {
      headers: {
        Location: '/',
      },
      status: 302,
    })
  } catch (error) {
    console.error(error)

    if (
      error instanceof OAuth2RequestError &&
      error.message === 'bad_verification_code'
    ) {
      return new Response(null, {
        status: 400,
      })
    }

    return new Response(null, {
      status: 500,
    })
  }
}
```

**Refer:** `./packages/auth/src/providers/index.ts`

```ts
export { generateState, generateCodeVerifier } from 'arctic'

// ...
export * from './x'
```

**Refer:** `./packages/auth/src/providers/x.ts`

```ts
import { Twitter } from 'arctic'

export const x = new Twitter(
  process.env.X_CLIENT_ID,
  process.env.X_CLIENT_SECRET,
  process.env.X_REDIRECT_URI
)
```

## Issues

### TBD

```log
You weren’t able to give access to the App. Go back and try logging in again.
```

<!--
users.read
tweet.read
follows.read
follows.write
offline.access
-->

TODO
