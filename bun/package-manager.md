# Bun Package Manager

<!--
https://dev.to/equiman/npm-vs-yarn-vs-pnpm-commands-cheatsheet-3el8
-->

## Links

- [Main Website](https://bun.sh/package-manager)

## CLI

### Usage

```sh
#
bun pm bin
bun pm ls
bun pm cache

#
bun init

#
bun install

#
bun dev
bun --cwd ./<path/to/package> dev

#
bun add <package-name>
bun add --cwd ./<path/to/package> <package-name>

#
bun build
bun --cwd ./<path/to/package> build

#
bun update
bun update -f
```

<!--
{
  "$schema": "https://json.schemastore.org/package.json",
  // ...
  "engines": {
    "node": ">=18"
  },
  "packageManager": "bun@1.0.21",
  "workspaces": [
    "apps/*",
    "packages/*",
    "tooling/*"
  ]
}
-->
