# GraphQL

<!--
https://www.youtube.com/watch?v=E3NHd-PkLrQ
https://www.linkedin.com/learning/graphql-essential-training/learn-graphql-essentials

https://github.com/njNafir/react-cheatsheets/blob/master/graphql.md
https://github.com/Maelstroms38/django-book/blob/master/chapter-7.md
https://github.com/mehulagg/gitlab/blob/master/doc/development/fe_guide/graphql.md
-->

## Tools

- [Altair GraphQL](/altair-graphql.md)
- [Apollo](/apollo.md)

## CLI

### Installation

#### Homebrew

```sh
brew install graphql-cli
```

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

### Tips

#### Visual Studio Code

```sh
code --install-extension GraphQL.vscode-graphql
```

<!-- #### Caddy Configuration

```sh
# Homebrew
cat << EOF > /usr/local/etc/Caddyfile
:80 {
  proxy / 127.0.0.1:8080 {
    websocket
  }
}
EOF
```

```sh
# Homebrew
brew services restart caddy
``` -->
