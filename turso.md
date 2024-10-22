# Turso (k.a. libSQL)

## Links

- [Code Repository](https://github.com/tursodatabase/libsql)
- [Main Website](https://turso.tech)

<!--
https://github.com/libsql/libsql
-->

## CLI

### Installation

#### Homebrew

```sh
brew tap tursodatabase/tap
brew install turso
```

<!--
brew tap libsql/sqld
brew install sqld
-->

### Commands

```sh
turso -h
```

### Configuration

```sh
#
turso auth login

#
turso auth whoami

#
turso auth token

#
turso auth api-tokens list

#
turso auth api-tokens mint <name>

#
turso auth api-tokens revoke <name>
```

<!--
turso config set <key> <value>
-->

### Usage

```sh
#
turso db create <name>

#
turso db list

#
turso db shell <name>

#
turso db show --url <name>

#
turso db tokens create <name>

#
turso db destroy <name>
```

### Tips

#### TBD

```sh
#
turso dev --db-file ./local.db
```

### Issues

#### TBD

```log
Error: could not create database local: cannot create database on group default because it is sleeping
```

TODO
