# Extend with MinIO

## Links

- [Code Repository](https://github.com/medusajs/medusa/tree/master/packages/medusa-file-minio)
- [Plugin](https://medusajs.com/plugins/medusa-file-minio)
- [Docs](https://docs.medusajs.com/plugins/file-service/minio)

## Dependencies

- [MinIO](/minio/README.md)

## Installation

```sh
# Using Yarn
yarn add medusa-file-minio
```

## Configuration

**Refer:** `./.env`

```env
MINIO_ENDPOINT=http://127.0.0.1:9002
MINIO_BUCKET=medusa
MINIO_ACCESS_KEY=
MINIO_SECRET_KEY=
```

**Refer:** `./medusa-config.js`

```js
const plugins = [
  // ...
  {
    resolve: 'medusa-file-minio',
    options: {
      endpoint: process.env.MINIO_ENDPOINT,
      bucket: process.env.MINIO_BUCKET,
      access_key_id: process.env.MINIO_ACCESS_KEY,
      secret_access_key: process.env.MINIO_SECRET_KEY,
    },
  },
]
```

## Issues

### 403 Forbidden

1. Administrator -> Buckets
2. Select `medusa` bucket
3. Summary -> Access Policy: `public`
