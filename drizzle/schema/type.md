# Schema with Type

```ts
type UserRole = 'admin' | 'user'

role: varchar('role').$type<UserRole>().notNull(),
```
