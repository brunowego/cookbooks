# Rust

<!--
https://github.com/pat-St/cms-container/tree/master

https://benchmarksgame-team.pages.debian.net/benchmarksgame/fastest/rust.html

https://app.pluralsight.com/library/courses/rust-fundamentals/table-of-contents
https://www.linkedin.com/learning/first-look-rust/welcome
https://pragprog.com/titles/hwrust/hands-on-rust/

https://dev.to/davidedelpapa/yew-tutorial-01-introduction-13ce
https://medium.com/swlh/building-a-front-app-with-rust-yes-you-can-and-yew-11e7835d768f
-->

## References

- [rustup](/rustup.md)
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
code --install-extension rust-lang.rust
```
