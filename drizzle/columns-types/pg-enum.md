# PG Enum Column Type

## Configuration

```ts
export const userOnboardingStatus = [
  // 'PENDING_EMAIL_VERIFICATION',
  'PENDING_USERNAME',
  'PENDING_AVATAR',
  // 'PENDING_BIO',
  'PENDING_WORKSPACE',
  // 'PENDING_FEEDBACK',
  'COMPLETE',
] as const

export const userOnboardingStatusEnum = pgEnum(
  'user_onboarding_status',
  userOnboardingStatus
)

export const usersTable = pgTable('users', {
  onboardingStatus: userOnboardingStatusEnum('onboarding_status')
    .notNull()
    .default('PENDING_USERNAME'),
})
```
