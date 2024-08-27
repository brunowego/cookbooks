# With Sentry

<!--
SENTRY_ORG=sellit
SENTRY_PROJECT=web
SENTRY_DSN=
SENTRY_AUTH_TOKEN=
SENTRY_LOG_LEVEL=debug
-->

<!--
enabled: process.env.NODE_ENV !== 'development',
-->

<!--
Refer: src/app/layout.tsx

throw new Error('Sentry Example API Route Error')
-->

## Links

- [Code Repository](https://github.com/getsentry/sentry-javascript/tree/master/packages/nextjs)

## Library

### Installation

```sh
# Using NPM
npm install @sentry/nextjs --save

# Using Yarn
yarn add @sentry/nextjs

# Using pnpm
pnpm add @sentry/nextjs

# Using Bun
bun add @sentry/nextjs
```

<!-- ### Dependencies

- [next-compose-plugins](/next.js/plugins/next-compose-plugins.md)
- [Page 404](/next.js/extend/page-404.md) -->

### Configuration

<!-- ```sh
#
npx @sentry/wizard -i nextjs

#
yarn workspace [@package/name] dlx @sentry/wizard -i nextjs
``` -->

**Refer:** `./next.config.mjs`

```mjs
import { withSentryConfig } from '@sentry/nextjs'

const isDev = process.env.NODE_ENV === 'development'

/**
 * @type { import('next').NextConfig }
 */
const nextConfig = {
  // ...
  sentry: {
    disableServerWebpackPlugin: isDev,
    disableClientWebpackPlugin: isDev,
  },
}

const userSentryWebpackPluginOptions = {
  silent: true,
}

const sentryOptions = {
  hideSourceMaps: false,
}

export default withSentryConfig(
  nextConfig,
  userSentryWebpackPluginOptions,
  sentryOptions
)
```

**Refer:** `./sentry.client.config.ts`

```ts
import * as Sentry from '@sentry/nextjs'

const SENTRY_DSN = process.env.SENTRY_DSN || process.env.NEXT_PUBLIC_SENTRY_DSN

Sentry.init({
  enabled: process.env.NODE_ENV !== 'development',
  dsn: SENTRY_DSN,
  // tracesSampleRate: 1.0,
})
```

**Refer:** `./sentry.properties`

```ini
defaults.url=https://sentry.io
defaults.org=<organization>
defaults.project=<project>
```

**Refer:** `./sentry.server.config.ts`

```ts
import * as Sentry from '@sentry/nextjs'

const SENTRY_DSN = process.env.SENTRY_DSN || process.env.NEXT_PUBLIC_SENTRY_DSN

Sentry.init({
  enabled: process.env.NODE_ENV !== 'development',
  dsn: SENTRY_DSN,
  // tracesSampleRate: 1.0,
})
```

<!-- **Refer:** `./src/pages/_error.tsx`

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
``` -->

### Environment Variables

```sh
#
export SENTRY_DSN=''
# export SENTRY_AUTH_TOKEN=''

#
cat << EOF >> ./.env.local.sample
SENTRY_DSN=$SENTRY_DSN
# SENTRY_AUTH_TOKEN=$SENTRY_AUTH_TOKEN
EOF
```

<!--
const checkInId = Sentry.captureCheckIn({
  monitorSlug: "10-min-cron",
  status: "in_progress",
});

// ...

Sentry.captureCheckIn({
  checkInId,
  monitorSlug: "10-min-cron",
  status: "ok",
});
-->

## Tips

### Create User Auth Token

1. [Auth Tokens](https://sentry.io/settings/account/api/auth-tokens)
2. Create New User Auth Token
   - General -> Name: `local`
   - Permissions -> Project: `Read & Write`, Release: `Admin`, Issue & Event: `Read & Write`

<!--
event:read, event:write, project:read, project:releases, project:write
-->

## Issues

### TBD

```log
@acme/landing:build:       - warning: could not determine a source map reference (Could not auto-detect referenced sourcemap for ~/c8e7b438-6afe-46a5-8a1f-4ec115c877f6-3.js)
```

<!--
https://github.com/getsentry/sentry-cli/issues/364
-->

TODO

### TBD

```log
@acme/landing:build: [@sentry/nextjs - Node.js] Warning: No auth token provided. Will not create release. Please set the `authToken` option. You can find information on how to generate a Sentry auth token here: https://docs.sentry.io/api/auth/
```

**Refer:** `./apps/web/turbo.json`

```json
{
  "$schema": "https://turbo.build/schema.json",
  "extends": ["//"],
  "tasks": {
    // ...
    "build": {
      // ...
      "env": ["SENTRY_AUTH_TOKEN"]
    }
  }
}
```

### Missing Global Error File

```log
@acme/console:dev: warn  - It seems like you don't have a global error handler set up. It is recommended that you add a global-error.js file with Sentry instrumentation so that React rendering errors are reported to Sentry. Read more: https://docs.sentry.io/platforms/javascript/guides/nextjs/manual-setup/#react-render-errors-in-app-router
```

**Refer:** `./src/app/global-error.jsx`

```tsx
'use client'

import { captureException } from '@sentry/nextjs'
import { useEffect } from 'react'
// biome-ignore lint/suspicious/noShadowRestrictedNames: This is a Next.js component
import Error from 'next/error'

export default function GlobalError({ error }) {
  useEffect(() => {
    captureException(error)
  }, [error])

  return (
    <html lang="en">
      <body>
        <Error />
      </body>
    </html>
  )
}
```

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
  },
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
@acme/web:dev: [@sentry/nextjs] It appears you've configured a `sentry.server.config.ts` file. Please ensure to put this file's content into the `register()` function of a Next.js instrumentation hook instead. To ensure correct functionality of the SDK, `Sentry.init` must be called inside `instrumentation.ts`. Learn more about setting up an instrumentation hook in Next.js: https://nextjs.org/docs/app/building-your-application/optimizing/instrumentation. You can safely delete the `sentry.server.config.ts` file afterward.

@acme/web:dev: [@sentry/nextjs] It appears you've configured a `sentry.edge.config.ts` file. Please ensure to put this file's content into the `register()` function of a Next.js instrumentation hook instead. To ensure correct functionality of the SDK, `Sentry.init` must be called inside `instrumentation.ts`. Learn more about setting up an instrumentation hook in Next.js: https://nextjs.org/docs/app/building-your-application/optimizing/instrumentation. You can safely delete the `sentry.edge.config.ts` file afterward.
```

TODO

### TBD

```log
@acme/web:dev: [@sentry/nextjs] Setting a `sentry` property on the Next.js config object as a means of configuration is no longer supported. Please use the `sentryBuildOptions` argument of of the `withSentryConfig()` function instead.
```

TODO

### TBD

```log
SyntaxError: Named export 'withSentryConfig' not found. The requested module '@sentry/nextjs' is a CommonJS module, which may not support all module.exports as named exports.
```

TODO

### TBD

```log
@acme/web:build: [@sentry/nextjs - Node.js] Info: Sending error and performance telemetry data to Sentry. To disable telemetry, set `options.telemetry` to `false`.
```

TODO

### TBD

```log
@acme/web:build:   WARN    2024-06-08 20:56:43.487106 -03:00 Unrecognized auth token format!
```

TODO
