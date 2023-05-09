# Moment.js

## Links

- [Code Repository](https://github.com/moment/moment)
- [Main Website](https://momentjs.com)

## Library

### Issues

#### TBD

```log
@acme/api:dev:     13 import * as moment from 'moment'
@acme/api:dev:        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@acme/api:dev:     Type originates at this import. A namespace-style import cannot be called or constructed, and will cause a failure at runtime. Consider using a default import or import require here instead.
```

**Refer:** `./tsconfig.json`

```json
{
  "compilerOptions": {
    // ...
    "strictNullChecks": true
  }
}
```

Or, change syntax to:

```ts
import moment from 'moment'
```
