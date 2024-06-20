# Shuttle

## Links

- [Console](https://console.shuttle.rs)

## CLI

### Installation

```sh
cargo install cargo-shuttle
```

### Commands

```sh
cargo shuttle -h
```

### Initialize

```sh
cargo shuttle login
```

### Usage

```sh
#
cargo shuttle init --create-env

#
cargo shuttle run

#
cargo shuttle project start
cargo shuttle project status

#
cargo shuttle deployment list

#
cargo shuttle resource list --show-secrets

#
cargo shuttle deploy
cargo shuttle deploy --ad
```

## Library

### Installation

```sh
# axum
cargo add shuttle-axum shuttle-runtime

# sqlx, postgres
cargo add shuttle-shared-db -F postgres,sqlx
```
