# Extend with Server Side

TODO

<!-- ```tsx
import type { GetServerSideProps } from 'next'

import { getAbsoluteUrl } from '@/utils/host'

export const getServerSideProps: GetServerSideProps = async ({ req }) => {
  const { origin } = getAbsoluteUrl(req)

  return {
    props: {
      origin,
    },
  }
}

export default function RootLayout(
  { children }: RootLayoutProps,
  { origin }: { origin: any },
): JSX.Element {
  // ...
}
``` -->

<!-- ```ts
import type { IncomingMessage } from 'node:http'

export function getAbsoluteUrl(
  req?: IncomingMessage,
  localhostAddress = 'localhost:13000',
) {
  let host =
    (req?.headers ? req.headers.host : window.location.host) || localhostAddress
  let protocol = /^localhost(:\d+)?$/.test(host) ? 'http:' : 'https:'

  if (
    req?.headers['x-forwarded-host'] &&
    typeof req.headers['x-forwarded-host'] === 'string'
  ) {
    host = req.headers['x-forwarded-host']
  }

  if (
    req?.headers['x-forwarded-proto'] &&
    typeof req.headers['x-forwarded-proto'] === 'string'
  ) {
    protocol = `${req.headers['x-forwarded-proto']}:`
  }

  return {
    protocol,
    host,
    origin: `${protocol}//${host}`,
  }
}
``` -->
