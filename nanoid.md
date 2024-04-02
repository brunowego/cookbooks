# Nano ID

**Keywords:** Identification (ID)

## Links

- [Code Repository](https://github.com/ai/nanoid)
- [Main Website](https://zelark.github.io/nano-id-cc)

## Library

### Installation

```sh
# Using pnpm
pnpm add @types/nanoid nanoid
```

### Issues

#### Require ES Module

```log
const nanoid_1 = require("nanoid");

Error [ERR_REQUIRE_ESM]: require() of ES Module /path/to/app/node_modules/.pnpm/nanoid@4.0.2/node_modules/nanoid/index.js from /path/to/app/apps/api/dist/src/modules/auth/auth.service.js not supported.
```

Try use version 3.
