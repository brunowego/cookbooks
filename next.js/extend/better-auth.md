# Extend with Better Auth

<!--
Multi Org.

https://github.com/Bekacru/nextjs-better-auth-SaaS-stater/blob/main/app/(dashboard)/dashboard/page.tsx
-->

<!--
2fa

https://github.com/pulgueta/nextjs-2fa-tutorial
-->

<!--
const auth = betterAuth({
  // ...
  rateLimit: {
    enabled: true,
    window: 30,
    max: 30,
  },

  trustedOrigins: [process.env.BETTER_AUTH_URL ?? ''],
});
-->

<!--
// plugins: [twoFactor({ issuer: 'Tutorial' }), nextCookies()],
-->

## Issues

### TBD

```log
TypeError: Invalid URL /get-session. Are you passing in a relative URL but not setting the baseURL?
```

<!--
https://github.com/better-auth/better-auth/issues/648
-->

TODO

### TBD

```log
Be careful!

The redirect_uri is not associated with this application.

The application might be misconfigured or could be trying to redirect you to a website you weren't expecting.
```

<!--
http://localhost:13000/api/auth/callback/github
-->

TODO

### TBD

```log
@acme/web:dev: TypeError: value.toISOString is not a function
```

<!--
https://github.com/drizzle-team/drizzle-orm/issues/1113
https://github.com/drizzle-team/drizzle-orm/discussions/2333
-->

TODO

### TBD

```log
@acme/web:dev:  ERROR   TypeError The "string" argument must be of type string or an instance of Buffer or ArrayBuffer. Received an instance of Date
```

TODO
