# Bun Package Manager

<!--
https://dev.to/equiman/npm-vs-yarn-vs-pnpm-commands-cheatsheet-3el8
-->

## Links

- [Main Website](https://bun.sh/package-manager)

## CLI

### Configuration

```sh
#
bun init

# Or
cat << EOF > ./package.json
{
  "\$schema": "https://json.schemastore.org/package.json",
  "private": true,
  "license": "COPYRIGHT",
  "devDependencies": {
    "@types/bun": "latest"
  },
  "peerDependencies": {
    "typescript": "latest"
  },
  "engines": {
    "node": ">=$(node --version | sed -E 's/^v//')"
  },
  "packageManager": "bun@$(bun --version)"
}
EOF

#
echo  '/node_modules' > .gitignore

#
bun install

#
bun x npm-check-updates -ui
```

**Tips:** Prefer use [Volta](/volta.md)

### Usage

```sh
#
bun pm bin
bun pm ls
bun pm cache

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

### Tips

#### Workspaces

```json
{
  "$schema": "https://json.schemastore.org/package.json",
  // ...
  "workspaces": ["apps/*", "packages/*", "services/*", "tooling/*"]
}
```
