# @giraphql/plugin-directives

## Installation

```sh
# Using Yarn
yarn add @giraphql/plugin-directives
```

## Configuration

**Refer:** `./src/graphql/builder.ts`

```ts
// ...
import DirectivePlugin from '@giraphql/plugin-directives'

export const builder = new SchemaBuilder<{
  // ....
}>({
  // ...
  useGraphQLToolsUnorderedDirectives: true,
  plugins: [
    // ...
    DirectivePlugin,
  ],
})
```
