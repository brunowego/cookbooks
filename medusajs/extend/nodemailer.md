# Extend with Nodemailer

## Links

- [Code Repository](https://github.com/Blechlawine/medusa-plugin-nodemailer)
- [Plugin](https://medusajs.com/plugins/medusa-plugin-nodemailer)

## Dependencies

- [Mailpit](/mailpit.md)

## Installation

```sh
# Using Yarn
yarn add medusa-plugin-nodemailer
```

## Configuration

**Refer:** `./medusa-config.js`

```js
const plugins = [
  {
    resolve: `medusa-plugin-nodemailer`,
    options: {
      transport: {
        host: '127.0.0.1',
        port: 1025,
        secureConnection: false,
      },
    },
  },
]
```
