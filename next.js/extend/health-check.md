# Extend with Health Check

## Configuration

**Refer:** `./src/app/api/health/route.ts`

```ts
import { NextResponse } from 'next/server'

type Healthcheck = { status: string }

export function GET(_request: Request) {
  const body: Healthcheck = { status: 'OK' }

  return NextResponse.json(body)
}
```
