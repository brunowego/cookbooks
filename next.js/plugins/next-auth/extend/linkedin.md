# Extend with LinkedIn

## Issues

### Wrong Issuer

```log
[auth][error] OperationProcessingError: "response" is not a conform Authorization Server Metadata response
```

<!--
https://github.com/nextauthjs/next-auth/issues/7809
https://github.com/nextauthjs/next-auth/issues/8831
https://github.com/nextauthjs/next-auth/issues/8316
-->

```ts
import LinkedInProvider from 'next-auth/providers/linkedin'

export default LinkedInProvider({
  issuer: 'https://www.linkedin.com/oauth',
  // ...
})
```

### TBD

```log
[auth][error] CallbackRouteError: Read more at https://errors.authjs.dev#callbackrouteerror
[auth][cause]: Error: TODO: Handle OIDC response body error
```

<!--
https://github.com/nextauthjs/next-auth/issues/8831
-->

TODO
