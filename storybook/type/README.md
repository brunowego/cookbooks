# Storybook Type

## Issues

### OpenSSL Legacy Provider

```log
10% building 1/12 modules 11 active ...dules/.pnpm/webpack-hot-middleware@2.25.3/node_modules/webpack-hot-middleware/client.js?reload=true&quiet=false&noInfo=undefinednode:internal/crypto/hash:71
  this[kHandle] = new _Hash(algorithm, xofLen);
  ...
  opensslErrorStack: [ 'error:03000086:digital envelope routines::initialization error' ],
  library: 'digital envelope routines',
  reason: 'unsupported',
  code: 'ERR_OSSL_EVP_UNSUPPORTED'
}
```

Solution [here](/nodejs/README.md#openssl-legacy-provider)

### ESLint Ignore Pattern

```log
File ignored by default.  Use a negated ignore pattern (like "--ignore-pattern '!<relative/path/to/filename>'") to override.
```

**Refer:** `./.eslintrc.cjs`

```cjs
/**
 * @type { import('@types/eslint').Linter.Config }
 */
const eslintRC = {
  // ...
  ignorePatterns: ['!.storybook'],
}

module.exports = eslintRC
```

###

```log
Uncaught (in promise) Error: No `docs.container` set, did you run `addon-docs/preset`?
```
