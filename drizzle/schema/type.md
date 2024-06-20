# Schema with Type

## Implementation

```ts
type UserRole = 'admin' | 'user'

export const users = pgTable('users', {
  // ...
  role: varchar('role').$type<UserRole>().notNull(),
})
```

Reflect in the SQL schema:

```sql
CREATE TABLE IF NOT EXISTS "users" (
  -- ...
  "role" varchar NOT NULL,
);
```
