# Rust

<!--
Ferris mascot
-->

## Links

- [Code Repository](https://github.com/rust-lang/rust)
- [Main Website](https://rust-lang.org)
- [Rust Playground](https://play.rust-lang.org)
- [Awesome Alternatives in Rust](https://github.com/TaKO8Ki/awesome-alternatives-in-rust)
- Rust Package Registry
  - [crates.io](https://crates.io)

## Learning

- [Are we web yet?](https://arewewebyet.org)

## Glossary

- Resource Acquisition Is Initialization (RAII)

## CLI

### Installation

#### Homebrew

```sh
brew install rust
```

#### APT

```sh
sudo apt update
sudo apt -y install rustc
```

#### YUM

```sh
yum check-update

# Repo: EPEL
sudo yum -y install rust
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
rustc --help
```

### Usage

```sh
# Version
rustc --version | head -1
```

### Tips

#### Visual Studio Code

```sh
#
code --install-extension rust-lang.rust

#
jq '."recommendations" += ["rust-lang.rust"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

<!--
"[rust]": {
  "editor.defaultFormatter": "rust-lang.rust-analyzer"
},
"rust-analyzer.procMacro.enable": true,
"rust-analyzer.diagnostics.experimental.enable": false
-->
