# Extend with preview-email

TODO

<!--
import type { CreateEmailOptions } from './type'
import { isDev } from './utils'
import { render } from '@react-email/render'

const defaultOptions = {
  from: process.env.SMTP_FROM as string,
} satisfies Pick<CreateEmailOptions, 'from'>

type CreateEmailOptionsWithoutFrom = Omit<CreateEmailOptions, 'from'>

export async function sendEmail({
  ...options
}: Partial<CreateEmailOptionsWithoutFrom>) {
  const payload = {
    ...defaultOptions,
    ...options,
  } as CreateEmailOptions

  if (isDev) {
    const previewEmail = (await import('preview-email')).default

    return previewEmail(
      {
        ...payload,
        html: render(payload.react, {}),
      },
      {
        openSimulator: false,
      },
    )
  }

  const Resend = (await import('resend')).Resend

  const resend = new Resend(process.env.RESEND_API_KEY)

  return await resend.emails.send(payload)
}

export type { CreateEmailOptionsWithoutFrom as CreateEmailOptions }
-->
