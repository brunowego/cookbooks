# create-turbo

## Links

- [Code Repository](https://github.com/vercel/turborepo/tree/main/packages/create-turbo)

## Commands

```sh
#
npx create-turbo@latest -h
```

## Usage

```sh
# Use Yarn
yarn --version # >= 3.0.0

yarn dlx create-turbo@latest \
  ./<app-name> && \
    cd "$_"

# Use pnpm
pnpx create-turbo@latest \
  ./<app-name> && \
    cd "$_"
```

## Issues

### Yarn Plug’n’Play (PnP) Not Support Yet

```log
Error: Qualified path resolution failed - none of those files can be found on the disk.
```

Follow this [Using Node Modules](/yarn/migration.md#using-node-modules).

<!--
#
sed -i '1s;^;/**/node_modules\n;' ./.gitignore
sed -i '/\/.pnp.*/d' ./.gitignore
-->

#### Remnants of Plug’n’Play (PnP)

- Remove `"./**/.pnp.*": true` from `./.vscode/settings.json`.
