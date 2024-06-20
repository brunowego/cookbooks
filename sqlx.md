# SQLx

## Links

- [Code Repository](https://github.com/launchbadge/sqlx)

## Library

### Installation

```sh
#
cargo add sqlx --no-default-features -F macros,postgres
```

<!--
cargo add sqlx --no-default-features -F x
-->

## CLI

### Installation

```sh
#
cargo install sqlx-cli

# Only for postgres
cargo install sqlx-cli --no-default-features --features native-tls,postgres
```

<!--
https://github.com/aakash-rajur/sqlxgen
-->

### Commands

```sh
cargo-sqlx -h
sqlx -h
```

### Usage

```sh
#
sqlx database create
sqlx database drop

#
sqlx migrate add -r <name>
sqlx migrate add -r init

sqlx migrate info --source ./db/migrations

#
sqlx migrate run

#
cargo sqlx prepare
```

<!--
sqlx database setup

sqlx migrate revert

cargo sqlx prepare --workspace
-->
