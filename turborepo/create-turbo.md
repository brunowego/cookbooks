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
#
npx create-turbo@latest \
  --no-install \
  ./<app-name> && \
    cd "$_"

# Use pnpm
npx create-turbo@latest \
  --use-pnpm \
  --no-install \
  ./<app-name> && \
    cd "$_"
```

## Issues

### Yarn Plug’n’Play (PnP) Not Support Yet

```log
Error: Qualified path resolution failed - none of those files can be found on the disk.
```

```sh
#
yarn config set nodeLinker node-modules

#
yamllint ./

#
sed -i '1s;^;/**/node_modules\n;' ./.gitignore
sed -i '/\/.pnp.*/d' ./.gitignore

#
yarn install
```

#### Remnants of Plug’n’Play (PnP)

- Remove `"./**/.pnp.*": true` from `./.vscode/settings.json`.
