# @giraphql/plugin-prisma

<!--
https://github.com/hayes/pothos/tree/main/packages/plugin-prisma
-->

## Installation

```sh
# Using Yarn
yarn add @giraphql/plugin-prisma
```

## Configuration

**Refer:** `./tsconfig.json`

```json
{
  // ...
  "compilerOptions": {
    // ...
    "paths": {
      "@/db/*": ["./db/*"]
      // ...
    }
  }
  // ...
}
```

**Refer:** `./src/graphql/builder.ts`

```ts
// ...
import PrismaTypes from '@/db/prisma/giraphql-types'
import { prisma } from '@/lib/prisma'
import PrismaPlugin from '@giraphql/plugin-prisma'

export const builder = new SchemaBuilder<{
  // ....
  PrismaTypes: PrismaTypes
}>({
  // ...
  prisma: {
    client: prisma,
  },
  plugins: [
    // ...
    PrismaPlugin,
  ],
})
```

## Issues

### Missing DateTime Type

```log
Type '"DateTime"' is not assignable to type 'TypeParam<ExtendDefaultTypes<{ Context: Context; PrismaTypes: PrismaTypes; }>>'.ts(2322)
```

**Refer:** `./src/graphql/builder.ts`

```ts
// ...
export const builder = new SchemaBuilder<{
  // ...
  Scalars: {
    // ...
    DateTime: { Input: Date; Output: Date }
  }
}>({
  // ...
})

builder.scalarType('DateTime', {
  serialize: (date: any) => date.toISOString(),
  parseValue: (date: any) => {
    return new Date(date)
  },
})
```
