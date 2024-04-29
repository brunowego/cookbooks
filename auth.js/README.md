# Auth.js (p.k.a. NextAuth.js)

<!--
https://github.com/pedroapfilho/acme-monorepo/tree/main
-->

## Links

- [Code Repository](https://github.com/nextauthjs/next-auth)
- [Main Website](https://authjs.dev)

## Guides

- [Tutorials and Explainers](https://next-auth.js.org/tutorials)
- [Configuration / Options](https://next-auth.js.org/configuration/options)
- [Configuration / Pages](https://next-auth.js.org/configuration/pages)

## Tools

- [Create GitHub Client](https://github-client-generator.vercel.app)

## Examples

- [NextAuth.js Typescript TypeScript - Example App](https://github.com/nextauthjs/next-auth-typescript-example)

## Library

### Installation

<!--
npm install @prisma/client @next-auth/prisma-adapter@canary
npm install prisma --save-dev
-->

```sh
# With NPM
npm install next-auth
npm install @types/next-auth --save-dev

# With Yarn
yarn add next-auth
yarn add @types/next-auth --dev

# With pnpm
pnpm add next-auth
pnpm add @types/next-auth -D
```

### Issues

#### TBD

```log
[next-auth][error][SESSION_ERROR]
@acme/web:dev: https://next-auth.js.org/errors#session_error Cannot read properties of undefined (reading 'session') TypeError: Cannot read properties of undefined (reading 'session')

@acme/web:dev: [next-auth][error][adapter_error_getSessionAndUser]
@acme/web:dev: https://next-auth.js.org/errors#adapter_error_getsessionanduser Cannot read properties of undefined (reading 'session') {
@acme/web:dev:   message: "Cannot read properties of undefined (reading 'session')",
```

#### TBD

```log
This expression is not callable. Type 'typeof import("/")' has no call signatures. ts(2349)
```

TODO

#### Any Type

```log
Binding element 'a' implicitly has an 'any' type. ts(7031)
```

```ts
function test({ a }: { a: any }) {
  // ...
}
```

<!--
next-auth.d.ts

import 'next-auth/jwt'

declare module 'next-auth/jwt' {
  interface JWT {
    userRole?: 'admin'
  }
}
-->
