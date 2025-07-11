# drizzle-zod

## Links

- [Docs](https://orm.drizzle.team/docs/zod)

<!--
https://github.com/antoniohauren/incentive-back/blob/develop/src/schemas/balance-schema.ts
https://github.com/antoniohauren/incentive-back/blob/develop/src/schemas/payment-schema.ts
https://github.com/jhonsfran1165/builderai/blob/main/packages/db/src/validators/price.ts
-->

## Issues

### TBD

```log
Type 'ZodObject<{ name: ZodString; email: ZodString; password: ZodString; }, { out: {}; in: {}; }>' does not satisfy the constraint 'ZodType<any, any, any>'.
```

<!--
https://github.com/drizzle-team/drizzle-orm/issues/4542
-->

<!--
Downgrade to `drizzle-zod@~0.7.0`
-->

```ts
// From
import type { z } from 'zod'

// To
import type { z } from 'zod/v4'
```

### TBD

```log
The inferred type of 'selectUserSchema' cannot be named without a reference to '../node_modules/drizzle-zod/schema.types.internal.mjs'. This is likely not portable. A type annotation is necessary.
```

TODO

<!-- ```json
{
  "$schema": "https://json.schemastore.org/tsconfig",
  "compilerOptions": {
    "declaration": false,
    "declarationMap": false,
    // ...
  }
}
``` -->
