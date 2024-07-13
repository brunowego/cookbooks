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

# Using Corepack
corepack prepare pnpm@latest --activate
```

### Commands

```sh
# Using NPX
npx pnpm -h

# Using Local
pnpm -h
```

<!-- ### Environment

#### macOS

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Performant NPM (pnpm)
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
```

```sh
source ~/.zshrc
``` -->

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

#### Package Manager

```sh
pnpm -v
```

**Refer:** `./package.json`

```json
{
  // ...
  "packageManager": "pnpm@8.8.0"
}
```

#### Fix Vulnerabilities

```sh
#
pnpm audit

#
pnpm audit --fix

#
pnpm install
```

#### Corepack

```sh
#
corepack enable

#
corepack prepare pnpm@7.33.0 --activate
```

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
# Recursive
pnpm up -r
# with Latest and Recursive
pnpm up -Lr
#
pnpm up -L --filter <package-name>
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
ERR_PNPM_FETCH_401  GET https://npm.pkg.github.com/download/@acme/tailwind-config/0.0.1/7c5a3f84809d94bca8f1c427ce3b7fd1f5b3281c: Unauthorized - 401
```

<!--
Check if not have a package with the version instead of `workspace:~`
-->

TODO

#### Auto Install Peers Param Mismatch

```log
ERR_PNPM_LOCKFILE_CONFIG_MISMATCH  Cannot proceed with the frozen installation. The current "settings.autoInstallPeers" configuration doesn't match the value found in the lockfile
```

<!-- https://github.com/pnpm/pnpm/issues/6649 -->

```sh
cat ./.npmrc
cat ./pnpm-lock.yaml
```

#### Update Package Manager

```log
ERROR  [...] is an invalid relative dependency path
```

<!-- https://github.com/pnpm/pnpm/issues/6504 -->

**Refer:** `./package.json`

```json
{
  // ...
  "packageManager": "pnpm@7.33.0"
}
```

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

<!--
corepack prepare pnpm@8.6.3 --activate
-->
