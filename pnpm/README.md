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

```sh
# Using NPM
npm install pnpm -g

# Using Yarn
yarn global add pnpm
```

### Commands

```sh
# Using NPX
npx pnpm -h

# Using Local
pnpm -h
```

### Environment

#### macOS

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Performant NPM (pnpm)
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
```

```sh
source ~/.zshrc
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

# Clean cache
pnpm store prune
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

#### Git Attributes

Add [text rules](/gitattributes.md#text)

```sh
cat << EOF >> ./.gitattributes
/pnpm-lock.yaml -diff
/pnpm-lock.yaml linguist-generated=true
EOF
```

#### Upgrade

```sh
pnpm add -g pnpm
```

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
