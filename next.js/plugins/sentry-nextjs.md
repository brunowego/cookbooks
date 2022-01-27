# Sentry + Next.js

## Installation

### NPM or Yarn

```sh
# Using NPM
npm install @sentry/nextjs --save

# Using Yarn
yarn add @sentry/nextjs
```

### Dependencies

- [next-compose-plugins](/next.js/ext)
- [Page 404](/next.js/extend/page-404.md)

### Configuration

```sh
#
npx @sentry/wizard -i nextjs
```

**Refer:** `./next.config.mjs`

```mjs
import withPlugins from 'next-compose-plugins'
import { withSentryConfig } from '@sentry/nextjs'

/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  sentryWebpackPluginOptions: {
    silent: true,
  },
}

export default withPlugins([[withSentryConfig]], nextConfig)
```

```sh
#
rm ./src/pages/_error.js

#
cat << \EOF > ./src/pages/_error.tsx
import { ReactElement } from 'react'
import { NextPageContext } from 'next'
import NextErrorComponent, { ErrorProps as NextErrorProps } from 'next/error'
import * as Sentry from '@sentry/nextjs'

type ErrorPageProps = {
  err: Error
  statusCode: number
  hasGetInitialPropsRun: boolean
  children?: ReactElement
}

type ErrorProps = {
  hasGetInitialPropsRun: boolean
} & NextErrorProps

function ErrorPage({ statusCode, hasGetInitialPropsRun, err }: ErrorPageProps) {
  if (!hasGetInitialPropsRun && err) {
    Sentry.captureException(err)
  }

  return <NextErrorComponent statusCode={statusCode} />
}

ErrorPage.getInitialProps = async ({ res, err, asPath }: NextPageContext) => {
  const errorInitialProps = (await NextErrorComponent.getInitialProps({
    res,
    err,
  } as NextPageContext)) as ErrorProps

  errorInitialProps.hasGetInitialPropsRun = true

  if (err) {
    Sentry.captureException(err)

    await Sentry.flush(2000)

    return errorInitialProps
  }

  Sentry.captureException(new Error(`_error.js getInitialProps missing data at path: ${asPath}`))

  await Sentry.flush(2000)

  return errorInitialProps
}

export default ErrorPage
EOF

#
export SENTRY_DSN=''
export SENTRY_AUTH_TOKEN=''

#
cat << EOF >> ./env
SENTRY_DSN=$SENTRY_DSN
SENTRY_AUTH_TOKEN=$SENTRY_AUTH_TOKEN
EOF

#
cat << EOF >> ./.example.env
SENTRY_DSN=
SENTRY_AUTH_TOKEN=
EOF

#
echo '/.env' >> ./.gitignore

#
echo '!/sentry.*.config.ts' >> ./.vercelignore
```
