# Extend with Zod

**Refer:** `./src/app/api/.../route.ts`

```ts
import { z } from 'zod'
import { NextResponse } from 'next/server'

export async function POST(request: Request): Promise<Response> {
  try {
    // ...
  } catch (err) {
    console.error(err)

    if (err instanceof z.ZodError) {
      return NextResponse.json(
        { message: err.issues[0]?.message },
        { status: 400 }
      )
    }

    return new Response(null, {
      status: 500,
    })
  }
}
```
