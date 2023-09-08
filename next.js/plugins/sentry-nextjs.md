# Sentry + Next.js

<!--
enabled: process.env.NODE_ENV !== 'development',
-->

<!--
Refer: src/app/layout.tsx

throw new Error('Sentry Example API Route Error')
-->

## Installation

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

#
yarn workspace [@package/name] dlx @sentry/wizard -i nextjs
```

```sh
#
mv ./next.config.js ./next.config.mjs
mv ./src/pages/_error.js ./src/pages/_error.tsx
mv ./sentry.client.config.js ./sentry.client.config.ts
mv ./sentry.server.config.js ./sentry.server.config.ts
```

**Refer:** `./next.config.mjs`

```mjs
import { withSentryConfig } from '@sentry/nextjs'

const IS_DEVELOPMENT = process.env.NODE_ENV === 'development'

/**
 * @type { import('next').NextConfig }
 */
const nextConfig = {
  // ...
  sentry: {
    disableServerWebpackPlugin: IS_DEVELOPMENT,
    disableClientWebpackPlugin: IS_DEVELOPMENT,
  },
}

const SentryWebpackPluginOptions = {
  silent: true,
}

export default withSentryConfig(nextConfig, SentryWebpackPluginOptions)
```

**Refer:** `./sentry.client.config.ts`

```ts
import * as Sentry from '@sentry/nextjs'

const SENTRY_DSN = process.env.SENTRY_DSN || process.env.NEXT_PUBLIC_SENTRY_DSN

Sentry.init({
  enabled: process.env.NODE_ENV !== 'development',
  dsn: SENTRY_DSN,
  tracesSampleRate: 1.0,
})
```

**Refer:** `./sentry.properties`

```ini
defaults.url=https://sentry.io/
defaults.org=[organization]
defaults.project=[project]
```

**Refer:** `./sentry.server.config.ts`

```ts
import * as Sentry from '@sentry/nextjs'

const SENTRY_DSN = process.env.SENTRY_DSN || process.env.NEXT_PUBLIC_SENTRY_DSN

Sentry.init({
  enabled: process.env.NODE_ENV !== 'development',
  dsn: SENTRY_DSN,
  tracesSampleRate: 1.0,
})
```

**Refer:** `./src/pages/_error.tsx`

```tsx
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

  Sentry.captureException(
    new Error(`_error.js getInitialProps missing data at path: ${asPath}`)
  )

  await Sentry.flush(2000)

  return errorInitialProps
}

export default ErrorPage
```

### Environment Variables

```sh
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
```

## Issues

### Source Maps Not Uploaded

```log
It looks like you're creating, but not uploading your source maps. Read our docs for troubleshooting help.
```

```js
// ...
const nextConfig = {
  // ...
  sentry: {
    widenClientFileUpload: true,
    // ...
  }
}
// ...
```

### Source Map File Doesn't Exist

```log
Sentry couldn't fetch the source map file for this event. Read our docs for troubleshooting help.
```

<!--
https://docs.sentry.io/platforms/javascript/guides/nextjs/sourcemaps/
https://docs.sentry.io/platforms/javascript/guides/nextjs/manual-setup/
-->

TODO

### Missing Auth Token Environment Variable

```log
error - No Sentry auth token configured. Source maps will not be uploaded.
```

Missing `SENTRY_AUTH_TOKEN` environment variable.

### TBD

```log
ReferenceError: wpforms is not defined
```

TODO

### TBD

```log
SyntaxError: Named export 'withSentryConfig' not found. The requested module '@sentry/nextjs' is a CommonJS module, which may not support all module.exports as named exports.
```

TODO
