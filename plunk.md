# Plunk

## Links

- [Code Repository](https://github.com/useplunk/plunk)
- [Main Website](https://useplunk.com)
- [Dashboard](https://app.useplunk.com)
- Docs
  - [Self-hosting Plunk](https://docs.useplunk.com/getting-started/self-hosting)

<!--
https://github.com/resend/react-email/tree/canary/examples
-->

<!--
https://github.com/useplunk/node
-->

<!--
https://github.com/christran/create-2block-app/blob/main/packages/email/src/providers/plunk.ts
-->

<!-- ```ts
import env from '../env'

export type PlunkApiResponse = {
  success: boolean
  emails?: {
    contact: {
      id: string
      email: string
    }
  }[]
  timestamp?: string
  error?: string
  message?: string
  time?: string
}

export const sendEmailPlunk = async (
  to: string,
  subject: string,
  body: string,
) => {
  const options = {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      Authorization: `Bearer ${env.PLUNK_API_KEY}`,
    },
    body: JSON.stringify({
      name: env.EMAIL_FROM_NAME,
      from: env.EMAIL_FROM_ADDRESS,
      to,
      subject,
      body,
      subscribed: true,
    }),
  }

  const response = await fetch('https://resend.2block.co/api/v1/send', options)
  const data = (await response.json()) as PlunkApiResponse

  if (!response.ok) {
    throw new Error(`Error: ${response.status}\n${(data.error, data.message)}`)
  }

  if (!data.success) {
    throw new Error(data.error ?? data.message ?? 'Failed to send email')
  }

  console.log(`📨 Email sent successfully to: ${to}`, {
    contactId: data.emails?.[0]?.contact.id,
    email: data.emails?.[0]?.contact.email,
    timestamp: data.timestamp,
  })

  return data
}
``` -->
