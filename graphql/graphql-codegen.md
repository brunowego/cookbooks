# GraphQL Code Generator

<!--
@graphql-codegen/typescript
@graphql-codegen/typescript-operations
-->

## Links

- [Code Repository](https://github.com/dotansimha/graphql-code-generator)
- [Main Website](https://graphql-code-generator.com/)

## CLI

### Dependencies

- [GraphQL](/graphql/README.md)

### Configuration

<!--
graphql.config.js
-->

<!--
```sh
cat << EOF > ./codegen.yml
overwrite: true
errorsOnly: true
schema: src/graphql/schema.graphql
documents: 'src/**/!(*.d).{ts,tsx}'
hooks:
  afterOneFileWrite:
  - eslint --fix
  - prettier --write
generates:
  src/graphql/types.generated.ts:
    config:
      scalars:
        DateTime: string
    plugins:
    - typescript
    - typescript-operations
EOF
```
-->

**Refer:** `package.json`

```json
{
  "scripts": {
    // ...
    "codegen": "yarn codegen:schema && yarn codegen:graphql",
    "codegen:schema": "ts-node --transpile-only -r tsconfig-paths/register src/graphql/index.ts",
    "codegen:graphql": "graphql-codegen"
  }
}
```
