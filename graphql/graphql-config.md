# GraphQL Config

## Notes

- [GraphQL Code Generator](/graphql/graphql-codegen.md) uses GraphQL Config

## Links

- [Code Repository](https://github.com/kamilkisiela/graphql-config)
- [Main Website](https://graphql-config.com/)

## Library

### Installation

```sh
# Using NPM
npm install graphql-config --save-dev

# Using Yarn
yarn add graphql-config --dev
```

### Configuration

**Refer:** `./graphql.config.js`

```ts
const graphqlRC = {
  schema: 'http://localhost:3000/api/graphql',
}

module.exports = graphqlRC
```

<!--
documents: './src/**/*.{graphql,js,ts,jsx,tsx}'
documents: './src/graphql/**/*.graphql',
-->

### Tips

#### With dotENV

```sh
# Using NPM
npm install dotenv --save-dev

# Using Yarn
yarn add dotenv --dev
```

**Refer:** `./graphql.config.js`

```ts
const path = require('path')

require('dotenv').config({ path: path.join(__dirname, '.env') })

const graphqlRC = {
  schema: process.env.GRAPHQL_URL,
}

module.exports = graphqlRC

```

```sh
#
echo 'GRAPHQL_URL=http://localhost:3000/api/graphql' >> ./.env
```

### Issues

#### Missing Config File

```log
Error: graphql operation failed t: GraphQL Config file is not available in the provided config directory: ./ Please check the config directory.
```

Just install and configure GraphQL Config.

#### TBD

```log
Error: graphql operation failed TypeScriptCompileError: Failed to compile TypeScript: Unexpected token 'export'
```

TODO
