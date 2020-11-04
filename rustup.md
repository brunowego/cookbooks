# rustup

## References

- [Rust](/rust.md)

## CLI

### Installation

#### Homebrew

```sh
brew install rustup-init

rustup-init -y
```

#### Linux

```sh
curl https://sh.rustup.rs -sSf | sh -s -- -y
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
rustup install stable
rustup install nightly

#
rustup component add rust-src

#
rustup run nightly cargo install rustfmt-nightly
```
