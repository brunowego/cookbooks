# GraphQL Server

In simple terms, a GraphQL Server receives the query from the client and responds back.

## Core Concepts

- Schema and Resolver Functions
  - Resolver function is a function that resolves a value for a type/field in the GraphQL Schema.
- Network Layer
- GraphQL Execution Engine
  - Parses query from client
  - Validate schema
  - Return JSON response
  - Executes resolvers from each field
- Batched Resolving

## Popular Servers

- [Apollo Server](/apollo/server.md)
- [Express GraphQL](https://graphql.org/graphql-js/express-graphql/)
- [GraphQL Helix](/graphql-helix.md)
- [GraphQL Yoga](/graphql-yoga.md)
- [Hasura GraphQL Engine](/hasura/graphql-engine.md)

<!--
https://github.com/dgraph-io/dgraph
https://github.com/99designs/gqlgen
-->
