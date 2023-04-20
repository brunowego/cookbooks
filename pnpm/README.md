# Performant NPM (pnpm)

<!--
https://github.com/antribute/open-source

shared-workspace-lockfile=false
engine-strict=true
auto-install-peers=true
shamefully-hoist=true
dedupe-peer-dependents=true
-->

**Keywords:** Node.js Package Manager

## Links

- [Code Repository](https://github.com/pnpm/pnpm)
- [Main Website](https://pnpm.io/)
- Docs
  - [Scripts](https://pnpm.io/scripts)

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
pnpm install </absolute/path/to/folder>

#
pnpm link </absolute/path/to/folder>

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

#### Autocomplete

```sh
pnpm install-completion zsh
```

#### Add Pre-Post Scripts

```sh
echo 'enable-pre-post-scripts=true' >> ./.npmrc
```

#### Update

```sh
#
pnpm up

# Latest
pnpm up -L
# with Recursive
pnpm up -Lr
```

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

## Dockerfile

```Dockerfile
FROM docker.io/library/node:18.12.1

RUN corepack enable pnpm
```
