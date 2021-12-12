# strapi-plugin-sentry

## Library

### Installation

#### NPM

```sh
npm install strapi-plugin-sentry --save
```

### Configuration

```js
module.exports = ({ env }) => ({
  sentry: {
    dsn: env('SENTRY_DSN'),
    sendMetadata: true,
    init: {
      environment: env('NODE_ENV'),
    },
  },
});
```
