# libSQL

## Links

- [Code Repository](https://github.com/tursodatabase/libsql)
- [Main Website](https://turso.tech/libsql)

## Library

### Installation

```sh
# Using pnpm
pnpm add @libsql/client
```

### Issues

#### TBD

```log
⨯ LibsqlError: URL_SCHEME_NOT_SUPPORTED: The client that uses Web standard APIs supports only "libsql:", "wss:", "ws:", "https:" and "http:" URLs, got "file:". For more information, please read https://github.com/libsql/libsql-client-ts#supported-urls
```

TODO

#### TBD

```log
Module parse failed: Unexpected token (1:0)
You may need an appropriate loader to handle this file type, currently no loaders are configured to process this file. See https://webpack.js.org/concepts#loaders
```

<!--
https://github.com/tursodatabase/libsql/issues/1276
https://github.com/tursodatabase/libsql-client-ts/issues/201
https://github.com/tursodatabase/libsql-client-ts/issues/184
-->

```mjs
/**
 * @type { import('next').NextConfig }
 */
const nextConfig = {
  // transpilePackages: ['@acme/db'],
  // webpack: (config) => {
  //   config.externals.push('@libsql/client')
  //   return config
  // },
}

export default nextConfig
```

TODO
