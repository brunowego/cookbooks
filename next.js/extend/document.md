# Next.js Document

## Boilerplate

**Refer:** `./src/pages/_document.tsx`

```tsx
import Document, { Head, Html, Main, NextScript } from 'next/document'

class AppDocument extends Document {
  render() {
    return (
      <Html lang="en">
        <Head>
          <link rel="canonical" href="https://example.com" />
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
