# GraphQL Queries

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
