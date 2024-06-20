# rustup

**Keywords:** Rust Toolchain

## Links

- [Code Repository](https://github.com/rust-lang/rustup)
- [Main Website](https://rustup.rs)

## CLI

### Installation

#### Homebrew

```sh
brew install rustup-init

rustup-init -y
```

#### Unix-like

```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# rustup
source "$HOME"/.cargo/env
```

```sh
sudo su - "$USER"
```

### Commands

```sh
rustup help
```

### Usage

```sh
#
rustup install stable # nightly

#
rustup update stable
```

<!--
#
rustup component add rust-src

#
rustup run nightly cargo install rustfmt-nightly
-->
