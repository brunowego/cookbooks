# Extend with OpenAPI (a.k.a. Swagger)

<!--
https://github.com/honojs/middleware/tree/main/packages/swagger-ui

@hono/swagger-ui
@hono/zod-openapi
-->

## Links

- [Code Repository](https://github.com/honojs/middleware/tree/main/packages/zod-openapi)
- [Snippets](https://hono.dev/snippets/zod-openapi)

## Installation

```sh
# Using Bun
bun add @hono/zod-openapi
```

## Issues

### Missing IPv6 Loopback for `localhost`

```log
ConnectionRefused: Unable to connect. Is the computer able to access the url?
```

<!--
https://github.com/oven-sh/bun/issues/1425
-->

```sh
#
cat /etc/hosts | grep '::1'
```

### TBD

```log
Property 'openapi' does not exist on type 'Hono<Env, {}, "/api/v1">'. ts(2339)
```

TODO
