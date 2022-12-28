# Performant NPM (pnpm)

<!--
https://www.youtube.com/watch?v=uJqqddyzN3s
-->

## Links

- [Code Repository](https://github.com/pnpm/pnpm)
- [Main Website](https://pnpm.io/)

## CLI

### Installation

#### Homebrew

```sh
brew install pnpm
```

### Commands

```sh
# Using NPX
npx pnpm -h

# Using Local
pnpm -h
```

### Usage

```sh
#
pnpm init

#
pnpm install

#
pnpm <command>
```

<!--
pnpm --filter <package-name> <command>

pnpm add --filter shared-ui typescript -D
pnpm add shared-ui --filter my-remix-app --workspace

pnpm run -r build
pnpm run --parallel -r build
-->

### Execute

```sh
#
pnpx <command>
```

### Tips

#### Add Type Module

**Refer:** `./package.json`

```json
{
  // ...
  "type": "module"
  // ...
}
```
