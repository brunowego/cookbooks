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
  "browserslist": [
    "defaults"
  ]
}
```

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
