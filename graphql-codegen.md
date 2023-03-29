# GraphQL Code Generator (codegen)

<!--
https://github.com/lensterxyz/lenster/blob/main/packages/lens/codegen.yml
https://github.com/hoppscotch/hoppscotch/blob/main/packages/hoppscotch-common/gql-codegen.yml
-->

## Links

- [Code Repository](https://github.com/dotansimha/graphql-code-generator)
- [Main Website](https://the-guild.dev/graphql/codegen)

## CLI

### Installation

```sh
# Using NPM
npm install @graphql-codegen/cli @graphql-codegen/typescript -D
```

<!-- ### Commands

```sh
# Using NPM
npx graphql-codegen help

# Using Yarn
yarn dlx graphql-codegen help

# Using pnpm
pnpm dlx graphql-codegen help
``` -->

### Issues

#### IPv6 Address

```log
Error: connect ECONNREFUSED ::1:3000
```

Look to `::1             localhost` in /etc/hosts:

```sh
#
cat /etc/hosts

#
telnet ::1 3000
```

Avoid using `localhost` in `codegen.ts`.

#### TBD

```log
Invalid Codegen Configuration!
  Please make sure that your codegen config file contains either the "schema" field
  or every generated file has its own "schema" field.
  It should looks like that:
  schema:
  - my-schema.graphql
  or:
  generates:
  path/to/output:
  schema: my-schema.graphql
◼ Generate outputs
```

TODO

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
