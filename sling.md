# Sling

<!--
https://docs.slingdata.io/sling-cli/github-actions
-->

**Keywords:** Data Integration

## Links

- [Org. Repository](https://github.com/slingdata-io)
- [Main Website](https://slingdata.io)
- [Connectors](https://slingdata.io/en/connectors)
- [Docs](https://docs.slingdata.io)

## Learn

- [How to Quickly Import Local JSON files into PostgreSQL](https://blog.slingdata.io/import-local-json-files-into-postgresql)

## CLi

### Links

### Installation

```sh
# Using Homebrew
brew tap slingdata-io/sling
brew install sling
```

### Commads

```sh
sling -h
```

### Usage

```sh
#
sling conns list

#
sling conns discover LOCAL

#
sling conns test LOCAL
```

### Issues

#### TBD

```log
pq: invalid input syntax for type json
```

TODO

#### TBD

```log
fatal:
~ could not connect to database(try adding `sslmode=require` or `sslmode=disable`)
pq: SSL is not enabled on the server
```

TODO
