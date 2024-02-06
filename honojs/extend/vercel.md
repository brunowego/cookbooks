# Extend with Vercel

<!--
https://github.com/SnowSuno/syncroom-auth-api
https://github.com/thecuvii/hobun
https://github.com/xiaosongfu/abui-api

https://github.com/asa1984/asa1984.dev/blob/main/packages/frontend/src/app/api/%5B%5B...route%5D%5D/route.ts
https://github.com/yicru/board/blob/main/web/src/app/api/%5B...route%5D/route.ts
https://github.com/yicru/otomo/blob/main/web/src/app/api/%5B...route%5D/route.ts
https://github.com/yicru/find-my-qrcode/blob/main/web/src/app/api/%5B...route%5D/route.ts
https://github.com/shinaps/next-hono-web/blob/main/src/app/api/%5B%5B...route%5D%5D/route.ts
https://github.com/tariqs26/next-hono-template/blob/main/src/app/api/%5B%5B...slug%5D%5D/route.ts
https://github.com/AmoabaKelvin/ishortn.ink/blob/main/src/app/api/%5B%5B...route%5D%5D/route.ts
https://github.com/kazuph/cf-samples/blob/main/cf-next-hono-auth-pages/src/app/api/%5B...route%5D/route.ts
https://github.com/fukata/gateway360/blob/main/src/app/api/%5B%5B...route%5D%5D/route.ts
https://github.com/Mkalo/request-header-parser-microservice/blob/main/api/index.ts
-->

## Installation

```sh
# Using Bun
bun add vercel -D
```

## Configuration

**Refer:** `./package.json`

```json
{
  // ...
  "scripts": {
    "start": "vercel dev",
    "deploy": "vercel"
  }
}
```

**Refer:** `./vercel.json`

```json
{
  "rewrites": [
    {
      "source": "/api/(.*)",
      "destination": "/api"
    }
  ]
}
```

<!--
{
  "compilerOptions": {
    "target": "ESNext",
    "module": "ESNext",
    "moduleResolution": "node",
    "esModuleInterop": true,
    "skipLibCheck": true,
    "strict": true,
  },
}
-->

<!--
import { Hono } from 'hono'
import { handle } from 'hono/vercel'

export const config = {
  runtime: 'edge'
}

const app = new Hono().basePath('/api')

app.get('/', (c) => {
  return c.json({ message: 'Hello Hono!' })
})

export default handle(app)
-->
