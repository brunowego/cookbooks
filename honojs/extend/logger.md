# Extend with Logger

## Default

```ts
const app = new Hono()

app.use('*', logger())
```

## Simple

**Refer:** `./src/lib/custom-logger.ts`

```ts
export function customLogger(message: string, ...rest: string[]) {
  console.log(message, ...rest)
}
```

**Refer:** `./src/http/server.ts`

```ts
import { customLogger } from '@/http/lib/custom-logger'

const app = new Hono()

app.use('*', logger(customLogger as unknown as Parameters<typeof logger>[0]))
```

<!-- ## Pino

**Refer:** `./src/http/server.ts`

```ts
const appLogger = iocContainer.get<AppLogger>(SERVICE_IDENTIFIER.Logger)

export function customLogger(message: string, ...rest: string[]) {
  appLogger.pino.info(message, ...rest)
}
``` -->

<!-- ## AppSignal

**Refer:** `./src/lib/appsignal.ts`

```ts
import { Appsignal } from '@appsignal/nodejs'
import { config } from '@acme/config'

import { env } from '@/env'

export const appSignal = new Appsignal({
  active: env.NODE_ENV === 'production',
  name: config.name,
  pushApiKey: env.APPSIGNAL_BACKEND_KEY,
})
```

**Refer:** `./src/http/server.ts`

```ts
import { appSignal } from '@/lib/appsignal'

type Severity = 'trace' | 'debug' | 'info' | 'log' | 'warn' | 'error'

const apiSignalLogger = appSignal.logger('log', 'info')

export const customLogger = (
  message: string,
  data?: Parameters<(typeof apiSignalLogger)['info']>[1],
  severity: Severity = 'info'
) => {
  if (data) {
    console[severity](message, data)

    apiSignalLogger[severity](message, data)
  } else {
    console[severity](message)

    apiSignalLogger[severity](message)
  }
}
``` -->
