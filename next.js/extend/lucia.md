# Extend with Lucia

<!--
https://github.com/teo-goulois/nextjs-lucia-auth-drizzle-orm-template
https://github.com/mugnavo/saas
https://github.com/adamspicedev/mad-fit
-->

TODO

<!--
Good Examples
https://github.com/flojoy-ai/cloud/tree/main

Passwordless / Magic Link

https://github.com/moinulmoin/chadnext/blob/main/src/app/api/auth/email-verify/route.ts

https://github.com/deadcoder0904/next-13-lucia-auth-drizzle-turso-sqlite-magic-link/blob/main/src/app/api/resend/route.ts
https://github.com/ocluf/justship/blob/main/src/routes/(login)/login/email-verification/%2Bserver.ts
https://lucia-auth.com/guides/email-and-password/email-verification-codes
https://github.com/lucia-auth/lucia/discussions/257
https://github.com/deadcoder0904/next-13-lucia-auth-drizzle-turso-sqlite-magic-link

https://github.com/dilmaheu/dilmahtea.me/blob/dev/functions/account/send-magic-link.ts

Auth with Phone

https://github.com/Dawidu7/spoonarium/blob/main/src/app/api/auth/sign-in/route.ts

tRPC

https://github.com/iamtouha/next-lucia-auth/blob/main/src/server/api/routers/post.ts

As a Package

https://github.com/noxify/t3-turbo-lucia/blob/main/packages/auth/src/index.ts
-->

<!--
Authorization

https://github.com/CUPUM/aipithet/blob/main/src/lib/auth/authorization.ts
-->

## Issues

### TBD

```log
Uncaught (in promise) SyntaxError: Unexpected identifier '__webpack_async_dependencies__'
```

<!--
https://github.com/pilcrowOnPaper/oslo/issues/21
-->

TODO

### TBD

```log
tI [Error]: Cookies can only be modified in a Server Action or Route Handler. Read more: https://nextjs.org/docs/app/api-reference/functions/cookies#cookiessetname-value-options
```

<!--
https://github.com/ap-1/bionic-reading/blob/main/src/app/signup/action.tsx
https://github.com/larsniet/server-actions-bug-report/blob/main/src/app/layout.tsx
-->

TODO

### Missing CORS Headers

```log
Access to fetch at 'https://accounts.google.com/o/oauth2/v2/auth?response_type=code&client_id=<client-id>&state=<state>&scope=email+profile+openid&redirect_uri=http%3A%2F%2Fapi.acme.localtest.me%3A3000%2Fauth%2Fcallback%2Fgoogle&code_challenge=<code-challenge>&code_challenge_method=S256' (redirected from 'http://auth.acme.localtest.me:3000/sign-in/google?_rsc=1nyh2') from origin 'http://auth.acme.localtest.me:3000' has been blocked by CORS policy: Response to preflight request doesn't pass access control check: No 'Access-Control-Allow-Origin' header is present on the requested resource. If an opaque response serves your needs, set the request's mode to 'no-cors' to fetch the resource with CORS disabled.
```

**Refer:** `./next.config.mjs`

```mjs
/**
 * @type { import('next').NextConfig }
 */
const nextConfig = {
  async headers() {
    return [
      {
        source: '/:path*',
        headers: [
          { key: 'Access-Control-Allow-Origin', value: '*' },
          {
            key: 'Access-Control-Allow-Methods',
            value: 'GET',
            // value: 'GET,POST,PUT,PATCH,DELETE,OPTIONS',
          },
          {
            key: 'Access-Control-Allow-Headers',
            value: 'Content-Type',
          },
        ],
      },
    ]
  },
}

export default nextConfig
```
