# ioredis

## Links

- [Code Repository](https://github.com/redis/ioredis)

## Library

### Issues

#### TBD

```log
@acme/web:dev: [ioredis] Unhandled error event: Error: connect ENOTSOCK /
@acme/web:dev:     at PipeConnectWrap.afterConnect [as oncomplete] (node:net:1636:16)
@acme/web:dev:     at PipeConnectWrap.callbackTrampoline (node:internal/async_hooks:130:17)
```

TODO

#### TBD

```log
2025-12-16 01:41:45.902 [error] [ioredis] Unhandled error event: ReplyError: ERR only (P)SUBSCRIBE / (P)UNSUBSCRIBE / PING / QUIT are allowed in this context
    at parseError (/var/task/node_modules/.pnpm/redis-parser@3.0.0/node_modules/redis-parser/lib/parser.js:179:12)
    at execute (/var/task/node_modules/.pnpm/redis-parser@3.0.0/node_modules/redis-parser/lib/parser.js:533:24)
```

<!--
https://blog.stackademic.com/resolving-redis-error-in-node-js-a549308df2d3
-->

TODO

<!--
Create a dedicated subscriber for the connection.
-->
