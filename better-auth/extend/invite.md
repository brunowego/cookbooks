# Extend with Invite

<!--
https://github.com/salvinoto/nextjs-ultimate-saas
https://github.com/quanphm/hoalu
https://github.com/devchaudhary24k/vidcastx

tRPC

https://github.com/000alen/spaces

Custom Plugin

https://github.com/iambrunopereira/petabook-web/blob/master/packages/auth/plugins/invitation-only/index.ts

Plugin

https://github.com/aris-2/better-auth-nile
-->

**Refer:** `packages/auth/src/plugins/invitation-only.ts`

```ts
import { createAuthMiddleware } from 'better-auth/plugins'
import { APIError } from 'better-auth/api'
import type { BetterAuthPlugin } from 'better-auth'

import db, { count, invitations, and, eq } from '@autlin/db'

import { config } from '../server'

const invitationOnlyPlugin = () =>
  ({
    id: 'invitationOnlyPlugin',
    hooks: {
      before: [
        {
          matcher: (context) => context.path.startsWith('/sign-in'),
          handler: createAuthMiddleware(async (ctx) => {
            if (config.socialProviders.google?.disableSignUp) {
              return
            }

            const { email } = ctx.body

            if (!email) {
              return
            }

            const hasInvitation = await db
              .select({ count: count() })
              .from(invitations)
              .where(
                and(
                  eq(invitations.email, email),
                  eq(invitations.status, 'pending')
                )
              )

            if (!hasInvitation) {
              throw new APIError('BAD_REQUEST', {
                code: 'INVALID_INVITATION',
                message: 'No invitation found for this email',
              })
            }
          }),
        },
      ],
    },
    $ERROR_CODES: {
      INVALID_INVITATION: 'No invitation found for this email',
    },
  } satisfies BetterAuthPlugin)

export default invitationOnlyPlugin
```
