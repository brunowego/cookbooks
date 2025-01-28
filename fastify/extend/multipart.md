# Extend with Multipart

<!--
https://github.com/juanalopez1/formulario/blob/main/backend/src/plugins/multipart.ts
https://github.com/QuickBlox/q-consultation/blob/master/apps/api/src/plugins/multipart.ts
https://github.com/juanalopez1/clases-dw/blob/main/back/src/plugins/multipart.ts
https://github.com/jellydn/fastify-starter/blob/main/src/plugins/multipart.ts
-->

## Library

### Installation

```sh
pnpm add @fastify/multipart
```

### Snippet

**Refer:** `./src/plugins/multipart.ts`

```ts
import fp from 'fastify-plugin'
import fastifyMultipart, {
  type FastifyMultipartOptions,
} from '@fastify/multipart'

export default fp<FastifyMultipartOptions>(
  async (fastify) => {
    await fastify.register(fastifyMultipart, {
      // attachFieldsToBody: 'keyValues',
      limits: {
        fileSize:
          1024 * 1024 * Number.parseInt(process.env.MAX_FILE_SIZE || '10', 10), // 10MB
        files: Number.parseInt(process.env.MAX_NUMBER_OF_FILES || '1', 10), // 1 file
      },
    })
  },
  { name: 'multipart' }
)
```

### Issues

#### Missing `@fastify/multipart`

```log
{
    "statusCode": 415,
    "code": "FST_ERR_CTP_INVALID_MEDIA_TYPE",
    "error": "Unsupported Media Type",
    "message": "Unsupported Media Type: multipart/form-data; boundary=--------------------------308435371694463181020079"
}
```

Just install `@fastify/multipart` and it will work.

#### TBD

```log
{
    "statusCode": 400,
    "code": "FST_ERR_VALIDATION",
    "error": "Bad Request",
    "message": "body/type must be string"
}
```

TODO

#### TBD

```log
{"level":50,"time":1736852556696,"pid":23749,"hostname":"brunowego.macbook.pro","msg":"Failed to start server: fastify-plugin: Plugin did not start in time: '[object Promise]'. You may have forgotten to call 'done' function or to resolve a Promise"}
```

TODO

#### TBD

```log
{
    "code": "FST_INVALID_MULTIPART_CONTENT_TYPE",
    "error": "Not Acceptable",
    "message": "the request is not multipart",
    "statusCode": 406
}
```

```sh
# from
http POST http://localhost:13001/file_import type=user file=@./users.csv
# to
http POST http://localhost:13001/file_import type=user file=@./users.csv --multipart
```

#### TBD

```log
{
    "code": "FST_ERR_VALIDATION",
    "error": "Bad Request",
    "message": "body must be object",
    "statusCode": 400
}
```

TODO
