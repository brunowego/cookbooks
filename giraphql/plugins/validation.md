# @giraphql/plugin-validation

## Installation

```sh
# Using Yarn
yarn add @giraphql/plugin-validation zod
```

## Configuration

**Refer:** `./src/graphql/builder.ts`

```ts
// ...
import ValidationPlugin from '@giraphql/plugin-validation'

export const builder = new SchemaBuilder<{
  // ....
}>({
  // ...
  plugins: [
    // ...
    ValidationPlugin,
  ],
})
```

## Issues

### Missing Validation Plugin

```log
Argument of type '{ validate: { minLength: number; maxLength: number; }; }' is not assignable to parameter of type 'Omit<InputObjectFieldOptions<ExtendDefaultTypes<{ Context: Context; PrismaTypes: PrismaTypes; Scalars: { DateTime: { Input: Date; Output: Date; }; }; }>, "String", FieldRequiredness<...>>, "type">'.
  Object literal may only specify known properties, and 'validate' does not exist in type 'Omit<InputObjectFieldOptions<ExtendDefaultTypes<{ Context: Context; PrismaTypes: PrismaTypes; Scalars: { DateTime: { Input: Date; Output: Date; }; }; }>, "String", FieldRequiredness<...>>, "type">'.ts(2345)
```

Just install the validation plugin.
