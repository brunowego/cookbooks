# Extend with Facebook

## Configuration

**Refer:** `./.env.local`

```env
FACEBOOK_CLIENT_ID=
FACEBOOK_CLIENT_SECRET=
FACEBOOK_REDIRECT_URI=http://localhost:3000/api/auth/facebook/callback
```

**Refer:** `./apps/web/src/app/(auth)/sign-in/facebook/route.ts`

```ts
import { cookies } from 'next/headers'

import { generateState, facebook } from '@acme/auth/providers'

export async function GET(): Promise<Response> {
  const state = generateState()
  const url = await facebook.createAuthorizationURL(state, {
    scopes: ['email'],
  })

  cookies().set('facebook_oauth_state', state, {
    path: '/',
    httpOnly: true,
    maxAge: 60 * 10,
    sameSite: 'lax',
    secure: process.env.NODE_ENV === 'production',
  })

  return Response.redirect(url)
}
```

**Refer:** `./apps/web/src/app/api/auth/facebook/callback/route.ts`

```ts
import { cookies } from 'next/headers'
import { OAuth2RequestError } from 'arctic'

import { facebook } from '@acme/auth/providers'
import { db } from '@acme/db'
import { usersTable } from '@acme/db/schema'
import { eq } from '@acme/db/orm'
import { generateId } from '@acme/id'
import { auth } from '@acme/auth'

interface FacebookUser {
  id: number
  // picture: { data: { url: string } };
  name: string
  email: string
}

export async function GET(request: Request): Promise<Response> {
  const url = new URL(request.url)
  const code = url.searchParams.get('code')
  const state = url.searchParams.get('state')
  const storedState = cookies().get('facebook_oauth_state')?.value ?? null

  if (!code || !state || !storedState || state !== storedState) {
    return new Response(null, {
      status: 400,
    })
  }

  try {
    const fields = ['id', 'name', 'email'].join(',')
    const tokens = await facebook.validateAuthorizationCode(code)
    const facebookUserResponse = await fetch(
      `https://graph.facebook.com/me?fields=${fields}&access_token=${tokens.accessToken}`
    )

    const facebookUser: FacebookUser = await facebookUserResponse.json()
    const existingUser = await db.query.usersTable.findFirst({
      where: eq(usersTable.facebookId, facebookUser.id),
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
      email: facebookUser.email,
      // username: facebookUser.login,
      firstName: facebookUser.name,
      // avatar: facebookUser.avatar_url,
      facebookId: facebookUser.id,
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
export * from './facebook'
```

**Refer:** `./packages/auth/src/providers/facebook.ts`

```ts
import { Facebook } from 'arctic'

export const facebook = new Facebook(
  process.env.FACEBOOK_CLIENT_ID,
  process.env.FACEBOOK_CLIENT_SECRET,
  process.env.FACEBOOK_REDIRECT_URI
)
```
