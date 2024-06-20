# Diesel

<!--
path:packages path:Cargo.toml content:diesel
-->

<!--
https://github.com/dani-garcia/vaultwarden
https://github.com/barthofu/playshelf/blob/dev/apps/server

https://github.com/is-it-ayush/lune/tree/master/apps/backend
-->

## Links

- [Code Repository](https://github.com/diesel-rs/diesel)
- [Main Website](https://diesel.rs)
- Guides
  - [Configuring Diesel CLI](https://diesel.rs/guides/configuring-diesel-cli)

## Library

### Installation

```sh
cargo add diesel -F postgres
```

## CLI

### Installation

```sh
cargo install diesel_cli --no-default-features --features postgres
```

### Usage

```sh
#
diesel setup

#
diesel migration generate <name>

#
diesel migration run
```
