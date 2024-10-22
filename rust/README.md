# Rust

<!--
Ferris mascot
-->

<!--
https://github.com/bitswired/rustgpt/blob/main/justfile
-->

<!--
Rust + Next.js

https://github.com/FrancescoXX/fullstack-rust-nextjs
https://github.com/adamlh/habitus
https://github.com/danilhendrasr/dializer/tree/main
https://github.com/takaya-ishiyama/CustomStorage
https://github.com/ddanielsantos/rust-commerce
https://github.com/ColaYe1984/ryot/tree/main

Rust + Remix

https://github.com/takaya-ishiyama/bookRecommend

Rust + Vite

https://github.com/samueldurantes/chesu
https://github.com/mikotoIO/mikoto
https://github.com/lourw/schedulii
https://github.com/iAverages/sei
-->

## Links

- [Code Repository](https://github.com/rust-lang/rust)
- [Main Website](https://rust-lang.org)
- [Rust Playground](https://play.rust-lang.org)
- [Awesome Alternatives in Rust](https://github.com/TaKO8Ki/awesome-alternatives-in-rust)
- Rust Package Registry
  - [crates.io](https://crates.io)

## Learn

- [Are we web yet?](https://arewewebyet.org)
- [Next.js and Rust | An Innovative Approach to Full-Stack Development](https://shuttle.rs/blog/2023/03/23/nextjs-and-rust)
- [Clean and Scalable Architecture for Web Applications in Rust](https://kerkour.com/rust-web-application-clean-architecture)

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
rustc --version
```

### Tips

### EditorConfig

```sh
cat << EOF >> ./.editorconfig

[*.rs]
indent_size = 4
EOF
```

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
