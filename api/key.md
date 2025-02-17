# API Key

## Tools

- [Generate Random / API key generator](https://generate-random.org/api-key-generator?count=1&length=64&type=mixed-numbers&prefix=)

<!--
https://github.com/fonoster/fonoster/blob/main/mods/identity/schema.prisma
-->

<!--
export const apiKeys = pgTable(
  'api_keys',
  {
    ...id,
    workspaceId: varchar('workspace_id')
      .references(() => workspaces.id, {
        onUpdate: 'cascade',
        onDelete: 'cascade',
      })
      .notNull(),
    userId: varchar('user_id')
      .references(() => users.id, {
        onUpdate: 'cascade',
        onDelete: 'cascade',
      })
      .notNull(),
    name: varchar('name').notNull(),
    hashedKey: varchar('hashed_key').notNull().unique(),
    lastUsedAt: timestamp('last_used_at', { mode: 'date' }),
    expiresAt: timestamp('expires_at', { mode: 'date' }),
    // domains: jsonb('domains').$type<string[]>().default([]).notNull(),
    // isRevoked: boolean('is_revoked').notNull().default(false),
    // scope: jsonb('scope').$type<string[]>().default([]).notNull(),
    ...timestamps,
  },
  (t) => [
    index('api_keys_workspace_id_idx').on(t.workspaceId),
    index('api_keys_hashed_key_idx').on(t.hashedKey),
  ],
)
-->

<!--
export const rateLimits = pgTable(
  'rate_limits',
  {
    ...id,
    name: varchar('name').notNull(),
    apiKeyId: varchar('api_key_id')
      .references(() => apiKeys.id, {
        // onUpdate: 'cascade',
        onDelete: 'cascade',
      })
      .notNull(),
    ttl: integer('ttl').notNull(),
    limit: integer('limit').notNull(),
    blockDuration: integer('block_duration').notNull(),
    ...timestamps,
  },
  (t) => [index('rate_limits_api_key_id_idx').on(t.apiKeyId)],
)
-->

<!--
import { ulid } from 'ulidx'
import { randomBytes } from 'node:crypto'

export const generateId = (): string => ulid()

export function generateApiKey(prefix = 'lr'): string {
  const identifier = randomBytes(6).toString('base64url')
  const secret = randomBytes(18).toString('base64url')

  return `${prefix}_${identifier}_${secret}`
}

export const obfuscateApiKey = (apiKey: string) => {
  const [prefix, identifier, secretPart] = apiKey.split('_') as [
    string,
    string,
    string,
  ]

  return `${prefix}_${identifier}_${'*'.repeat(secretPart.length)}`
}
-->
