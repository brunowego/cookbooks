# Extend with Hono

<!--
path:src/app/api path:route.ts content:hono
-->

<!--
https://github.com/search?q=path%3Aapi%2F%5B%5B...route%5D%5D%2Froute.ts&type=code&p=3

https://github.com/jeffersonbraster/finance-sass/tree/main/app/api/%5B%5B...route%5D%5D

https://www.youtube.com/watch?v=2Y3A4deNs9A

https://github.com/TheBinaryGuy/next-hono-lucia

https://github.com/cloudflare/workers-sdk/blob/main/packages/turbo-r2-archive/src/routes.ts

https://github.com/yicru/board/blob/main/web/src/app/api/%5B...route%5D/route.ts
https://github.com/yicru/otomo/blob/main/web/src/app/api/%5B...route%5D/route.ts
https://github.com/LightBounded/poosd_mern_assignment/blob/main/src/app/api/%5B%5B...route%5D%5D/route.ts
https://github.com/yicru/find-my-qrcode/blob/main/web/src/app/api/%5B...route%5D/route.ts

https://github.com/paraform/next-hono-rpc/tree/main/src/server/api
https://github.com/jacobgad/todo-list-api/tree/main/src/server
-->

**Refer:** `./src/app/api/v1/[[...route]]/route.ts`

```ts
import { Hono } from 'hono'
import { handle } from 'hono/vercel'

export const runtime = 'edge'

const app = new Hono().basePath('/api/v1')

const router = app.get('/ping', (c) => c.json({ ping: 'pong' }))

export type AppType = typeof router

export const GET = handle(app)
// export const POST = handle(app)
// export const PUT = handle(app)
// export const DELETE = handle(app)
```
