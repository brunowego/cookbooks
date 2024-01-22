# Extend with cronjob

## Links

- [Docs](https://elysiajs.com/plugins/cron)

## Installation

```sh
# Using Bun
bun add @elysiajs/cron
```

## Configuration

**Refer:** `./src/http/server.ts`

```ts
import { cron } from '@elysiajs/cron'

const app = new Elysia()

app
  // ...
  .use(
    cron({
      pattern: '0 0 * * *', // Every day at 00:00
      name: 'deleteFiles',
      async run() {
        // ...
      },
    })
  )
```
