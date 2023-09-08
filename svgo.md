# SVG Optimizer (SVGO)

## Links

- [Code Repository](https://github.com/svg/svgo)

## CLI

### Installation

```sh
npm install svgo -g
```

### Commands

```sh
svgo -h
```

<!-- ### Configuration

**Refer:** `./svgo.config.js`

```js
module.exports = {
  plugins: [
    {
      name: 'preset-default',
      params: {
        overrides: {
          removeViewBox: false,
          sortAttrs: true,
          removeOffCanvasPaths: true,
        },
      },
    },
  ],
}
```
 -->

### Usage

```sh
#
svgo ./
```


## Tips

### Trunk Ignore

```yml
---
# ...
lint:
  # ...
  ignore:
    - linters: [svgo]
      paths:
        - path/to/image.svg
```
