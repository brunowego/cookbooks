# Schema with Enum

<!--
Zod Example | https://github.com/search?q=repo%3AArish-Shah%2Fx-2008%20replyEnumValues&type=code
-->

```ts
export const ROLES = ['admin', 'customer'] as const

export const userRoleEnum = pgEnum('user_role', ROLES)

export type Role = (typeof userRoleEnum.enumValues)[number]
```
