# Extend with Meilisearch

## Links

- [Code Repository](https://github.com/medusajs/medusa/tree/master/packages/medusa-plugin-meilisearch)
- [Plugin](https://medusajs.com/plugins/medusa-plugin-meilisearch)

## Dependencies

- [Meilisearch](/meilisearch/README.md)

## Installation

```sh
# Using Yarn
yarn add medusa-plugin-meilisearch
```

## Configuration

**Refer:** `./.env`

```env
MEILISEARCH_HOST=http://127.0.0.1:7700
MEILISEARCH_API_KEY=masterKey
```

**Refer:** `./medusa-config.js`

```js
const plugins = [
  // ...
  {
    resolve: 'medusa-plugin-meilisearch',
    options: {
      config: {
        host: process.env.MEILISEARCH_HOST,
        apiKey: process.env.MEILISEARCH_API_KEY,
      },
      settings: {
        products: {
          indexSettings: {
            searchableAttributes: ['title', 'description', 'variant_sku'],
            displayedAttributes: [
              'title',
              'description',
              'variant_sku',
              'thumbnail',
              'handle',
            ],
          },
          primaryKey: 'id',
          transform: (product) => ({
            id: product.id,
            // other attributes...
          }),
        },
      },
    },
  },
]
```
