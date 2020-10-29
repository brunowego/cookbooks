# GraphQL

<!--
https://github.com/njNafir/react-cheatsheets/blob/master/graphql.md
https://github.com/Maelstroms38/django-book/blob/master/chapter-7.md
https://github.com/mehulagg/gitlab/blob/master/doc/development/fe_guide/graphql.md
-->

## Tools

- [Altair GraphQL](/altair-graphql.md)

## CLI

### Installation

#### Homebrew

```sh
brew install graphql-cli
```

```gql
{
  __schema {
    types {
      name
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

<!-- ## Host

### Tips

#### Caddy Configuration

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
