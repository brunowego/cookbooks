# GraphQL Code Generator

## Links

- [Code Repository](https://github.com/dotansimha/graphql-code-generator)
- [Main Website](https://graphql-code-generator.com)

<!-- ## Providers

- []() -->

### Issues

#### Missing Type

```log
Cannot query field "link" on type "Query".GraphQL: Validation
```

**Refer:** `./src/types/index.ts`

```ts
export type Link = {
  title: String
  slug: String
  description: String
  link: String
}
```

## CLI

### Commands

```sh
# Using NPM
npx graphql-codegen help

# Using Yarn
yarn dlx graphql-codegen help
```
