# Assets

## Configuration

```sh
#
mkdir ./src/assets

#
mv ./src/images ./src/assets
```

```js
module.exports = {
  build: {
    templates: {
      // ...
      assets: {
        source: './src/assets',
        destination: './assets',
      },
    },
  },
}
```
