# Configuration

**Refer:** `./mikro-orm.config.ts`

```ts
import type { Options } from '@mikro-orm/core'
import { type PostgreSqlDriver, defineConfig } from '@mikro-orm/postgresql'
import // ...
'@acme/models'

const options: Options<PostgreSqlDriver> = {
  clientUrl: 'postgres://acme:acme@localhost:5432/acme',
  entities: [
    // ...
  ],
}

export default defineConfig(options)
```
