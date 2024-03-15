# Extend with Compress

## Condiguration

```ts
import { Hono } from 'hono'
import { compress } from 'hono/compress'
// ...

const app = new Hono()

app.use(compress())
```
