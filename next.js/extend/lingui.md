# Lingui

<!--
https://github.com/vercel/examples/tree/main/edge-functions/i18n

https://github.com/sushiswap/sushiswap-interface/blob/master/.github/workflows/translations.yaml

https://bravo-kernel.com/blog/2023/05/how-to-build-a-fully-internationalized-nextjs-application-using-lingui-v4
-->

## Links

- [Next.js / Internationalized Routing](https://nextjs.org/docs/advanced-features/i18n-routing)

## Dependencies

- [Liqui](/lingui.md#library)

## Configuration

```sh
#
cat << EOF > ./.babelrc
{
  "presets": ["next/babel"],
  "plugins": ["macros"]
}
EOF

#
echo '/src/locales/*/*.js' >> ./.gitignore
```

**Refer:** `./lingui.config.js`

```js
/**
 * @type { import('@lingui/conf').LinguiConfig }
 */
const linguiConfig = {
  catalogs: [
    {
      path: '<rootDir>/src/locales/{locale}/messages',
      include: ['<rootDir>/src/components', '<rootDir>/src/pages'],
    },
  ],
  compileNamespace: 'cjs',
  fallbackLocales: {
    default: 'en',
  },
  format: 'po',
  formatOptions: {
    lineNumbers: false,
  },
  locales: ['en', 'es', 'pt', 'pseudo'],
  orderBy: 'messageId',
  rootDir: './',
  runtimeConfigModule: ['@lingui/core', 'i18n'],
  sourceLocale: 'en',
  pseudoLocale: 'pseudo',
}

module.exports = linguiConfig
```

**Refer:** `./next.config.mjs`

```mjs
import linguiConfig from './lingui.config.js'

const { locales, sourceLocale: defaultLocale } = linguiConfig

/**
 * @type { import('next').NextConfig }
 */
const nextConfig = {
  // ...
  trailingSlash: true,
  i18n: {
    localeDetection: true,
    locales,
    defaultLocale,
  },
  webpack: (config) => {
    config.module.rules.push({
      test: /\.po/,
      use: ['@lingui/loader'],
    })

    return config
  },
}

export default nextConfig
```

**Refer:** `./src/pages/_app.tsx`

```tsx
import type { AppProps } from 'next/app'
import { useRouter } from 'next/router'
import { useEffect } from 'react'
import { I18nProvider } from '@lingui/react'
import { i18n } from '@lingui/core'

function App({ Component, pageProps }: AppProps) {
  const { locale } = useRouter()

  useEffect(() => {
    async function load(lang: any) {
      const { messages } = await import(`../locales/${lang}/messages.po`)

      i18n.load(lang, messages)
      i18n.activate(lang)
    }

    load(locale)
  }, [locale])

  return (
    <I18nProvider i18n={i18n} forceRenderOnLocaleChange={false}>
      <Component {...pageProps} />
    </I18nProvider>
  )
}

export default App
```

<!-- ```tsx
import { Trans } from '@lingui/macro'

<Trans>...</Trans>
``` -->

**Refer:** `./src/pages/_document.tsx`

```tsx
import NextDocument, { Html, Head, Main, NextScript } from 'next/document'

class Document extends NextDocument {
  render() {
    return (
      <Html lang={this.props.locale}>
        <Head />

        <body>
          <Main />

          <NextScript />
        </body>
      </Html>
    )
  }
}

export default Document
```

## Issues

### Missing Babel

```log
Module not found: Can't resolve 'fs'
```

Try create `.babelrc` file with the following content:

```json
{
  "presets": ["next/babel"],
  "plugins": ["macros"]
}
```

### Missing I18n Provider

```log
Error: useLingui hook was used without I18nProvider.
```

Missing `I18nProvider` component on `./src/pages/_app.tsx`.

### Force Render On Locale Change

```log
I18nProvider did not render. A call to i18n.activate still needs to happen or forceRenderOnLocaleChange must be set to false.
```

```tsx
<I18nProvider i18n={i18n} forceRenderOnLocaleChange={false}>
  {/* ... */}
</I18nProvider>
```

### TBD

```log
I18nProvider rendered `null`. A call to `i18n.activate` needs to happen in order for translations to be activated and for the I18nProvider to render. This is not an error but an informational message logged only in development.
```

TODO

### TBD

```log
Invalid dependencies have been reported by plugins or loaders for this module. All reported dependencies need to be absolute paths.
```

TODO
