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

## Commands

```sh
cargo -h
```

## Usage

```sh
#
cargo init
# or
cargo new <project-name>

#
cargo fmt

#
cargo install

#
cargo run

#
carbo build

#
cargo test
```
