# Query Builder

```ts
import db, { qb, schema } from '@acme/db'

import { withErrorHandling } from '@/lib/error-handling'

export async function GET(): Promise<Response> {
  return withErrorHandling(
    async () => {
      const query = qb
        .select({
          id: schema.users.id,
        })
        .from(schema.users)

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
