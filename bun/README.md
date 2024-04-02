# Bun

<!--
https://github.com/search?q=path%3ADockerfile%20content%3A%22bun%20build%22%20content%3A--compile&type=code

Dockerfiles

https://github.com/henrygd/ncaa-api/blob/master/dockerfile
https://github.com/RichDom2185/url-shortener/blob/main/Dockerfile
https://github.com/anaxios/CL4P-TP/blob/master/Dockerfile
-->

**Keywords:** Runtime, Node.js Package Manager, Compiler

## Links

- [Code Repository](https://github.com/oven-sh/bun)
- [Main Website](https://bun.sh)
- [Docs](https://bun.sh/docs)

## Learning

- [Bun HTTP Framework Benchmark](https://github.com/SaltyAom/bun-http-framework-benchmark)

## CLI

### Installation

```sh
# Using NPM
npm install bun -g
```

#### Homebrew

```sh
brew tap oven-sh/bun
brew install bun
```

<!-- #### Snap

```sh
sudo snap install bun-js
``` -->

## Environment

### Darwin

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Bun
export BUN_PATH="$HOME/.bun"
export BUN_BIN="$BUN_PATH/bin"
export PATH="$BUN_BIN:$PATH"
```

```sh
sudo su - "$USER"
```

### Commands

```sh
bun -h
```

### Usage

```sh
#
bun update -f

#
bun upgrade

#
bun build --compile --outfile ./<my-cli> ./src/index.ts
```

### Tips

#### Upgrade Dependencies

```sh
#
bun x npm-check-updates -ui

# Workspaces
bunx npm-check-updates -ui -ws
```

### Issues

#### TBD

```log
error: Browser build cannot import Node.js builtin: "perf_hooks". To use Node.js builtins, set target to 'node' or 'bun'
```

TODO
