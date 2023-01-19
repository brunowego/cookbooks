# Performant NPM (pnpm)

<!--
https://github.com/antribute/open-source
-->

**Keywords:** Node.js Package Manager

## Links

- [Code Repository](https://github.com/pnpm/pnpm)
- [Main Website](https://pnpm.io/)

## CLI

### Installation

#### Homebrew

```sh
brew install pnpm
```

#### Chocolatey

```sh
choco install -y pnpm
```

### Commands

```sh
# Using NPX
npx pnpm -h

# Using Local
pnpm -h
```

### Configuration

```sh
#
pnpm config set save-prefix '~'

#
pnpm config list
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

### Issues

#### TBD

```log
 ERR_PNPM_PREPARE_PKG_FAILURE  Command failed with exit code 1: npm install
```

TODO
