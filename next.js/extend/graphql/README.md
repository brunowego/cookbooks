# GraphQL

<!--
Examples

https://github.com/belgattitude/mindfulness/tree/main
https://github.com/Gateway-DAO/network-ui
-->

## Dependencies

### Installation

```sh
# Using Yarn
yarn add @graphql-codegen/cli @graphql-codegen/typescript @graphql-codegen/typescript-operations --dev
```

### Configuration

**Refer:** `./package.json`

```json
{
  "scripts": {
    "codegen": "graphql-codegen --config ./codegen.yml"
    // ...
  }
}
```

**Refer:** `./codegen.yml`

```yml
---
overwrite: true
errorsOnly: true
schema: ./src/graphql/schema.graphql
# documents: ./src/**/!(*.d).{ts,tsx}

generates:
  ./src/graphql/types.generated.ts:
    plugins:
      - typescript
      - typescript-operations
    config:
      scalars:
        DateTime: string

hooks:
  afterAllFileWrite:
    - eslint --fix
    - prettier --write
```

## Issues

### Missing Nullable

```log
types.d.ts(104, 5): The expected type comes from property 'resolve' which is declared here on type 'PrismaFieldOptions<ExtendDefaultTypes<{ Context: Context; PrismaTypes: PrismaTypes; Scalars: { DateTime: { Input: Date; Output: Date; }; }; }>, {}, ... 6 more ..., "Mutation">'
```

```ts
// ...

builder.mutationField('createPost', (t) =>
  t.prismaField({
    // ...
    nullable: true,
    // ...
  })
)
```
