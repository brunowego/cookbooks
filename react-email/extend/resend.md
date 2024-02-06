# Extend with Resend

## Installation

```sh
# Using Bun
bun add resend
```

## Configuration

**Refer:** `./packages/email/send-email.ts`

```ts
import { type CreateEmailOptions, Resend } from 'resend'

const defaultOptions = {
  from: process.env.SMTP_FROM as string,
} satisfies Pick<CreateEmailOptions, 'from'>

type CreateEmailOptionsWithoutFrom = Omit<CreateEmailOptions, 'from'>

export async function sendEmail({
  ...options
}: Partial<CreateEmailOptionsWithoutFrom>) {
  const resend = new Resend(process.env.RESEND_API_KEY)

  const payload = {
    ...defaultOptions,
    ...options,
  } as CreateEmailOptions

  return await resend.emails.send(payload)
}

export type { CreateEmailOptionsWithoutFrom as CreateEmailOptions }
```
