# Bun

**Keywords:** Runtime, Node.js Package Manager, Compiler

## Links

- [Code Repository](https://github.com/oven-sh/bun)
- [Main Website](https://bun.sh)
- [Docs](https://bun.sh/docs)

## CLI

### Installation

#### Homebrew

```sh
brew tap oven-sh/bun
brew install bun
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
