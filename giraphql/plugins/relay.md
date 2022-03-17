# @giraphql/plugin-relay

## Installation

```sh
# Using Yarn
yarn add @giraphql/plugin-relay
```

## Configuration

**Refer:** `./src/graphql/builder.ts`

```ts
// ...
import RelayPlugin from '@giraphql/plugin-relay'

export const builder = new SchemaBuilder<{
  // ....
}>({
  // ...
  relayOptions: {
    clientMutationId: 'omit',
    cursorType: 'String',
  },
  plugins: [
    // ...
    RelayPlugin,
  ],
})
```

## Issues

### Missing Plugin Relay

```log
(property) GiraphQLSchemaTypes.RootFieldBuilder<Types extends SchemaTypes, ParentShape, Kind extends "Object" | "Query" | "Mutation" | "Subscription" | "Interface" = "Object" | "Query" | "Mutation" | "Subscription" | "Interface">.prismaConnection: "@giraphql/plugin-relay is required to use this method"
This expression is not callable.
Type 'String' has no call signatures. ts(2349)
```

Just install this plugin.
