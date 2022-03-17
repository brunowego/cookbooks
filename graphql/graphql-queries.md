# GraphQL Queries

## Basic CRUD

```gql
mutation CreateUser {
  createUser(input: { email: "admin@example.com", username: "admin" }) {
    id
  }
}

query GetUsers {
  users {
    edges {
      node {
        username
      }
    }
  }
}

query GetUser {
  user(id: "0f591484-fd1d-4aba-a3c4-5bf1f8cd5351") {
    email
    username
  }
}

mutation EditUser {
  editUser(input: { id: "0f591484-fd1d-4aba-a3c4-5bf1f8cd5351", username: "superuser" }) {
    username
  }
}

mutation DeleteUser {
  deleteUser(input: { id: "0f591484-fd1d-4aba-a3c4-5bf1f8cd5351" })
}
```

## Examples

```gql
query allSchemaTypes {
    __schema {
        types {
            name
            kind
            description
        }
    }
}

query availableQueries {
  __schema {
    queryType {
      fields {
        name
        description
      }
    }
  }
}

query liftType {
  __type(name: "<TYPE>") {
    fields {
      name
      description
    }
  }
}

query EnumerationValues {
  __type(name: "<ENUM TYPE>") {
    kind
    name
    description
    enumValues {
      name
      description
    }
  }
}

query UnionInterfaceTypes {
  __type(name: "<INTERFACE OR UNION TYPE>") {
    kind
    name
    description
    possibleTypes {
      name
      kind
      description
    }
  }
}
```

```gql
fragment FullType on __Type {
  kind
  name
  fields(includeDeprecated: true) {
    name
    args {
      ...InputValue
    }
    type {
      ...TypeRef
    }
    isDeprecated
    deprecationReason
  }
  inputFields {
    ...InputValue
  }
  interfaces {
    ...TypeRef
  }
  enumValues(includeDeprecated: true) {
    name
    isDeprecated
    deprecationReason
  }
  possibleTypes {
    ...TypeRef
  }
}

fragment InputValue on __InputValue {
  name
  type {
    ...TypeRef
  }
  defaultValue
}

fragment TypeRef on __Type {
  kind
  name
  ofType {
    kind
    name
    ofType {
      kind
      name
      ofType {
        kind
        name
        ofType {
          kind
          name
          ofType {
            kind
            name
            ofType {
              kind
              name
              ofType {
                kind
                name
              }
            }
          }
        }
      }
    }
  }
}

query IntrospectionQuery {
  __schema {
    queryType {
      name
    }
    mutationType {
      name
    }
    types {
      ...FullType
    }
    directives {
      name
      locations
      args {
        ...InputValue
      }
    }
  }
}
```

```gql
{
  me {
    id
    name
  }
}
```
