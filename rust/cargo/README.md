# Cargo

<!--
path:packages path:Cargo.toml
-->

**Keywords:** Rust Package Manager

## Links

- [The Cargo Book](https://doc.rust-lang.org/cargo)

## CLI

### Dependencies

- [Rust](/rust/README.md)

### Installation

#### Darwin

Included in Rust install.

#### APT

```sh
sudo apt update
sudo apt -y install cargo
```

#### YUM

```sh
yum check-update

# Repo: EPEL
sudo yum -y install cargo
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Cargo
export PATH="$HOME/.cargo/bin:$PATH"
```

```sh
sudo su - "$USER"
```

### Commands

```sh
cargo -h
```

### Usage

```sh
#
cat "$HOME"/.cargo/env

#
cargo init
# or
cargo new ./<project-name>

#
cargo fmt

#
cargo search <package>

#
cargo add <package>
cargo add <package> --dry-run
cargo add <package> -F x # non-standard way to show all features
cargo add <package> -F <features>

#
cargo install

#
cargo run

#
carbo build
cargo build --release

#
cargo test
```

<!--
cargo watch --exec run
-->

### Issues

#### TBD

```log
warning: spurious network error (3 tries remaining): [6] Couldn't resolve host name (Could not resolve host: index.crates.io)
```

<!--
https://github.com/rust-lang/cargo/issues/7515
-->

```sh
CARGO_HTTP_MULTIPLEXING=false cargo add <package>
```
