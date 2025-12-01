# Extend with Health Check

<!--
https://github.com/kikuchi0790/ukfr-smbc-app/blob/main/app/api/health/route.ts | https://ukfr-smbc-app.vercel.app/api/health

https://github.com/I360I/CloudGreet-Website/blob/main/app/api/admin/health/route.ts | https://cloud-greet-website.vercel.app/api/admin/health
https://github.com/phombal/voicebun/blob/main/app/api/health/route.ts | https://www.voicebun.com/api/health
https://github.com/andrew-freeland/estimator/blob/main/src/app/api/health/route.ts
https://github.com/Abdulmuiz44/Nexa/blob/main/app/api/health/route.ts | https://nexa-agent.vercel.app/api/health
https://github.com/TaylorHuston/yourbench-v1-poc/blob/main/apps/web/app/api/health/route.ts
-->

## Configuration

**Refer:** `./src/app/api/health/route.ts`

```ts
import { NextResponse } from 'next/server'

type Healthcheck = { status: string }

export function GET() {
  const body: Healthcheck = { status: 'OK' }

  return NextResponse.json(body)
}
```

**Refer:** `./src/app/api/ping/route.ts`

```ts
import { NextResponse } from 'next/server'

export const dynamic = 'force-dynamic'

export const maxDuration = 25

export async function GET() {
  return NextResponse.json({ ping: 'pong' }, { status: 200 })
}

export async function POST(req: Request) {
  const body = await req.json()

  return NextResponse.json({ ping: body }, { status: 200 })
}
```
