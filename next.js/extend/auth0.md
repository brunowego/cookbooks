# Extend with Auth0

<!--
https://github.com/auth0-developer-hub/auth0-b2b-saas-starter | https://saastart.app
-->

## Links

- [Code Repository](https://github.com/auth0/nextjs-auth0)

## Library

### Installation

```sh
# Using pnpm
pnpm add @auth0/auth0-react @auth0/nextjs-auth0
```

### Issues

#### Wrong Middleware Configuration

```log
TypeError: Cannot read properties of undefined (reading 'auth0')
```

<!--
https://github.com/auth0/nextjs-auth0/issues/1361
-->

**Refer:** `/src/middleware.ts`

```ts
import { withMiddlewareAuthRequired } from '@auth0/nextjs-auth0/edge'

export default withMiddlewareAuthRequired()

export const config = {
  matcher: '/((?!api/auth).*)',
}
```
