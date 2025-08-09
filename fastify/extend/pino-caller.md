# Extend with pino-caller

TODO

<!-- ```ts
import pretty from 'pino-pretty'
import caller from 'pino-caller'
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

const logger = isProduction
  ? pino(loggerOptions)
  : caller(
      pino(loggerOptions, stream).child({
        method: 'test',
      }),
      {
        relativeTo: process.cwd(),
      },
    )

export default logger
``` -->
