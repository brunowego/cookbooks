# Extend with API

## GET

```ts
import { NextResponse } from 'next/server'

type GetProps = {
  params: { userId: string }
}

export async function GET(_: Request, { params }: GetProps): Promise<Response> {
  const userId = params.userId

  if (!userId) {
    return new Response(null, {
      status: 404,
    })
  }

  try {
    const response = await getProfileByUserId(userId)

    return NextResponse.json(response, {
      status: 200,
    })
  } catch (err) {
    if (process.env.NODE_ENV === 'development') {
      console.error(err)
    }

    return new Response(null, {
      status: 500,
    })
  }
}
```
