# Browserslist

<!--
autoprefixer
-->

## Links

- [Code Repository](https://github.com/browserslist/browserslist)

## Library

### Configuration

**Refer:** `./package.json`

```json
{
  // ...
  "browserslist": ["defaults"]
}
```

## Issues

### TBD

```log
@acme/web:build: Browserslist: browsers data (caniuse-lite) is 6 months old. Please run:
@acme/web:build:   npx update-browserslist-db@latest
@acme/web:build:   Why you should do it regularly: https://github.com/browserslist/update-db#readme
```

<!--
https://github.com/browserslist/update-db/issues/20
-->

<!--
pnpm update caniuse-lite -r
-->

## CLI

### Commands

```sh
npx browserslist -h
```

### Usage

```sh
#
npx browserslist --coverage 'defaults'
npx browserslist --coverage '> 1%'
npx browserslist --coverage 'last 1 version, > 1%, IE 10'
```
