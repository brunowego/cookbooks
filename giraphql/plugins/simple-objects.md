# @giraphql/plugin-simple-objects

## Installation

```sh
# Using Yarn
yarn add @giraphql/plugin-simple-objects
```

## Configuration

**Refer:** `./src/graphql/builder.ts`

```ts
// ...
import SimpleObjectsPlugin from '@giraphql/plugin-simple-objects'

export const builder = new SchemaBuilder<{
  // ....
}>({
  // ...
  plugins: [
    // ...
    SimpleObjectsPlugin,
  ],
})
```
