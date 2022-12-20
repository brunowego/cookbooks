# GiraphQL

## Links

- [Code Repository](https://github.com/hayes/giraphql)
- [Main Website](https://giraphql.com)

## Library

### Installation

```sh
# Using Yarn
yarn add @giraphql/core
```

### Configuration

**Refer:** `./src/graphql/builder.ts`

```ts
import { IncomingMessage, OutgoingMessage } from 'http'
import SchemaBuilder from '@giraphql/core'

export interface Context {
  req: IncomingMessage
  res: OutgoingMessage
}

export function createGraphQLContext(
  req: IncomingMessage,
  res: OutgoingMessage
): Context {
  return {
    req,
    res,
  }
}

export const builder = new SchemaBuilder<{
  Context: Context
}>({})
```

### Issues

#### Missing Required Default Input Field

```log
Type 'string | null | undefined' is not assignable to type 'string | undefined'.
  Type 'null' is not assignable to type 'string | undefined'.ts(2322)
index.d.ts(3544, 5): The expected type comes from property 'id' which is declared here on type 'PostWhereUniqueInput'
```

**Refer:** `./src/graphql/builder.ts`

```ts
// ...
export const builder = new SchemaBuilder<{
  DefaultInputFieldRequiredness: true
  // ...
}>({
  defaultInputFieldRequiredness: true,
  // ...
})
```
