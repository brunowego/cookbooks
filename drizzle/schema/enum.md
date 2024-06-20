# Schema with Enum

<!--
Zod Example | https://github.com/search?q=repo%3AArish-Shah%2Fx-2008%20replyEnumValues&type=code
-->

## Implementation

```ts
export const USER_ROLES = ['admin', 'owner', 'member'] as const

export const userRoleEnum = pgEnum('user_role', USER_ROLES)

export const users = pgTable('users', {
  // ...
  role: userRoleEnum('role').notNull(),
  // role: varchar('role', { enum: USER_ROLES }).notNull().default('member'),
})

export type UserRole = (typeof userRoleEnum.enumValues)[number]
```

Reflect in the SQL schema:

```sql
DO $$ BEGIN
 CREATE TYPE "public"."payment_method_type" AS ENUM('manual_pix');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "payment_methods" (
  -- ...
  "type" "payment_method_type" NOT NULL,
);
```
