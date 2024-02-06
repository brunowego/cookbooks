# Extend with CORS

## Installation

```sh
# Using Bun
bun add hono/cors
```

```ts
import { cors } from 'hono/cors'

const app = new Hono()

const route = app.use(
  '*',
  cors({
    origin: '*',
    exposeHeaders: [
      'Houston-ChatId',
      'Houston-AssistantMessageId',
      'Houston-UserMessageId',
    ],
  })
)
```
