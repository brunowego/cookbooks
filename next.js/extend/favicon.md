# Favicon

## Configuration

**Refer:** `./src/pages/_document.tsx`

```tsx
import Document, { Html, Head, Main, NextScript } from 'next/document'

class AppDocument extends Document {
  render() {
    return (
      <Html lang="en">
        <Head>
          {/* ... */}
          <link
            rel="shortcut icon"
            type="image/png"
            href="/favicon-dark.png"
            media="(prefers-color-scheme: dark)"
          />
          <link
            rel="shortcut icon"
            type="image/png"
            href="/favicon.png"
            media="(prefers-color-scheme: light), (prefers-color-scheme: no-preference)"
          />
        </Head>
        <body>
          <Main />
          <NextScript />
        </body>
      </Html>
    )
  }
}

export default AppDocument
```

## Tips

### Rewrites

**Refer:** `./next.config.mjs`

```mjs
/**
 * @type { import('next').NextConfig }
 */
const nextConfig = {
  // ...
  rewrites: async () => {
    return [
      {
        source: '/favicon.ico',
        destination: 'https://domain.tld/favicon.ico',
      },
    ]
  },
}

export default nextConfig
```

## Issues

### Missing Favicon

```log
_error.js getInitialProps missing data at path: /favicon.ico
```

Just add a `favicon.ico` in `./public` folder.
