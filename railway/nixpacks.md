# Nixpacks

<!--
https://github.com/search?q=path%3Anixpacks.toml&type=code

https://github.com/NixOS/nixpkgs/commit/2d67382acbdc2aea9bc2743fc3c40815375a0078
nixpkgsArchive = '2d67382acbdc2aea9bc2743fc3c40815375a0078'
-->

**Keywords:** Build Pack

## Links

- [Code Repository](https://github.com/railwayapp/nixpacks)
- [Docs](https://nixpacks.com/docs)
  - [Getting Started](https://nixpacks.com/docs/getting-started)

<!--
https://github.com/railwayapp/nixpacks/blob/main/docs/pages/docs/configuration/environment.md?plain=1
-->

## CLI

### Installation

#### Homebrew

```sh
brew tap railwayapp/tap
brew install nixpacks
```

### Commands

```sh
nixpacks -h
```

### Configuraiton

**Refer:** `./nixpacks.toml`

```toml

```

### Usage

```sh
#
nixpacks build \
  --name <app-name> \
  ./<path/to/app> \
  -v
```
