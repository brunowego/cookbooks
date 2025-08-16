# Extend with Pino

## Snippet

```ts
import pretty from 'pino-pretty'
import pino, { type LoggerOptions } from 'pino'

const isProduction = process.env.NODE_ENV === 'production'

const stream = pretty({
  colorize: true,
  ignore: 'pid,hostname',
})

export const loggerOptions: LoggerOptions = {
  level: isProduction ? 'info' : 'debug',
  redact: [],
}

const logger = isProduction ? pino(loggerOptions) : pino(loggerOptions, stream)

export default logger
```
