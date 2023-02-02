# @giraphql/plugin-scope-auth

## Installation

```sh
# Using Yarn
yarn add @giraphql/plugin-scope-auth
```

## Configuration

**Refer:** `./src/graphql/builder.ts`

```ts
// ...
import { Session } from '@prisma/client'
import ScopeAuthPlugin from '@giraphql/plugin-scope-auth'

export interface Context {
  // ...
  session?: Session | null
}

export function createGraphQLContext(
  // ...
  session?: Session | null
): Context {
  return {
    // ...
    session,
  }
}

export const builder = new SchemaBuilder<{
  // ....
  AuthScopes: {
    public: boolean
    user: boolean
    unauthenticated: boolean
    staff: boolean
  }
}>({
  // ...
  plugins: [
    // ...
    ScopeAuthPlugin,
  ],
  authScopes: ({ session }) => ({
    public: true,
    user: !!session,
    unauthenticated: !session,
    staff: !!session?.isStaff,
  }),
})

builder.mutationType({
  authScopes: { user: true },
})
```
