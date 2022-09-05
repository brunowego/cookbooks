# GraphQL

**Keywords:** REST Alternative

<!--
https://github.com/hoppscotch/hoppscotch

Underfitting and Overfitting

Playground
GET query missing.
-->

<!--
https://www.linkedin.com/learning/building-a-graphql-project-with-react-js

https://www.youtube.com/watch?v=E3NHd-PkLrQ
https://www.youtube.com/watch?v=QrEOvHdH2Cg
-->

## Links

- [Code Repository](https://github.com/graphql/graphql-spec)
- [Main Website](https://graphql.org/)
- [Who’s using GraphQL?](https://graphql.org/users/)
- [Cheatsheets](https://github.com/njNafir/react-cheatsheets/blob/master/graphql.md)
- [Code using GraphQL](https://graphql.org/code/)
- [GraphQL Server](/graphql/graphql-server.md)

## Alternatives

- [Simple Object Access Protocol (SOAP)](/rest.md)
- [Representational State Transfer (REST)](/rest.md)

## Content

- [How Netflix Scales its API with GraphQL Federation (Part 1)](https://netflixtechblog.com/how-netflix-scales-its-api-with-graphql-federation-part-1-ae3557c187e2)

## Tools

- [GraphiQL IDE](/graphql/graphql-ide.md)
- [GraphQL Faker](https://github.com/APIs-guru/graphql-faker)
- [GraphQL Voyager](https://apis.guru/graphql-voyager/)
- [GraphQLEditor](https://github.com/graphql-editor/graphql-editor)

## Terms

- Schema Definition Language (SDL)

## Specification

### Core Concepts

- Fields
- Arguments
- Alias
- Fragments
- Operation Name
- Variables

## Library

### Installation

```sh
# Using NPM
npm install graphql

# Using Yarn
yarn add graphql
```

### Extend With

#### Eslint

```sh
# Using Yarn
yarn add eslint-plugin-graphql --dev
```

```ts
/**
 * @type { import('@types/eslint').Linter.Config }
 */
const eslintRC = {
  // ...
  overrides: [
    {
      files: ['./src/graphql/queries/*.graphql'],
      parser: '@graphql-eslint/eslint-plugin',
      plugins: ['@graphql-eslint'],
      rules: {
        '@graphql-eslint/known-type-names': 'error',
      },
    },
  ],
}

module.exports = eslintRC
```

### Tips

#### Visual Studio Code

```sh
#
code --install-extension 'GraphQL.vscode-graphql'

#
jq '."recommendations" += ["GraphQL.vscode-graphql"]' "$PWD/.vscode/extensions.json" | sponge "$PWD/.vscode/extensions.json"
```

### Issues

#### TBD

```log
Query root type must be provided.
```

TODO

<!-- ## CLI

### Installation

#### Homebrew

```sh
brew install graphql-cli
```

### Commands

```sh
graphql
```

### Usage

```sh
#
graphql get-schema -p database
``` -->
