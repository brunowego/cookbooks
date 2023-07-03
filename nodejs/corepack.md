# Corepack

## Links

- [Docs](https://nodejs.org/api/corepack.html)

## CLI

### Configuration

```sh
#
corepack enable

#
corepack prepare pnpm@latest --activate
```

### Issues

#### Wrong Package Manager

```log
Usage Error: This project is configured to use yarn
```

```sh
cat ./package.json | jq '.packageManager'
```
