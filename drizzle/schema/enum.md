# Schema with Enum

<!--
Zod Example | https://github.com/search?q=repo%3AArish-Shah%2Fx-2008%20replyEnumValues&type=code
-->

<!-- ```ts
export const USER_ROLES = ['admin', 'owner', 'member'] as const

export const userRoleEnum = pgEnum('user_role', USER_ROLES)

role: userRoleEnum('role').notNull(),

export type UserRole = (typeof userRoleEnum.enumValues)[number]
``` -->

<!-- ```ts
export const USER_ROLES = ['admin', 'owner', 'member'] as const

role: varchar('role', { enum: USER_ROLES }).notNull().default('member'),
``` -->

TODO
