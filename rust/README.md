# Rust

<!--
https://www.youtube.com/watch?v=lzKeecy4OmQ

https://github.com/soundise/soundise-backend

.rs
.rlib

https://github.com/search?o=desc&q=filename%3ACargo.toml+path%3Aapps&s=indexed&type=Code
-->

<!--
https://github.com/bkonkle/rust-example-caster-api
https://github.com/aerox0/rust-tweeter
https://github.com/ddanielsantos/rust-commerce
-->

## Links

- [Code Repository](https://github.com/rust-lang/rust)
- [Main Website](https://rust-lang.org)
- [Awesome Alternatives in Rust](https://github.com/TaKO8Ki/awesome-alternatives-in-rust)
- Rust Package Registry
  - [crates.io](https://crates.io)

## References

<!--
- [asdf Rust](/asdf/rust.md) or [rustup](/rustup.md)
-->

- [Cargo](/cargo.md)
- [WebAssembly](/wasm.md)

## Web Framework

- [Actix web](https://github.com/actix/actix-web)
- [Iron](https://github.com/iron/iron)
- [Rocket](https://github.com/SergioBenitez/Rocket)
- [Yew](https://github.com/yewstack/yew)

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
