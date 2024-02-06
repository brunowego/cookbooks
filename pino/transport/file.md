# Extend with File

## Library

### Configuration

**Refer:** `./src/lib/logger.ts`

```ts
import pino from 'pino'

const transport = pino.transport({
  targets: [
    {
      target: 'pino/file',
      options: {
        destination: `${process.cwd()}/logs/main.log`,
        mkdir: true,
      },
      level: 'trace',
    },
    {
      target: 'pino/file',
      options: {
        destination: `${process.cwd()}/logs/error.log`,
        mkdir: true,
      },
      level: 'error',
    },
    {
      target: 'pino-pretty',
      options: {
        colorize: true,
      },
      level: 'trace',
    },
  ],
})

export const logger = pino(
  {
    timestamp: pino.stdTimeFunctions.isoTime,
  },
  transport
)
```

```sh
echo '/logs' >> .gitignore
```
