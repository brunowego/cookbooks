# View

```ts
import db, { qb, schema } from '@autlin/db'

import { withErrorHandling } from '@/lib/error-handling'

export async function GET(): Promise<Response> {
  return withErrorHandling(
    async () => {
      const query = qb.select().from(schema.activeUsers)

      const users = await db.execute(query)

      return new Response(JSON.stringify(users), {
        status: 200,
      })
    },
    {
      endpoint: '/api/v1/export',
      method: 'GET',
    }
  )
}
```
