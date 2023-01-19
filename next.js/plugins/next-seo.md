# Next SEO

<!--
https://github.com/Kerosz/biolnk/blob/main/apps/web/web.seo.ts
-->

## Links

- [Code Repository](https://github.com/garmeeh/next-seo)
- [NextSeo Options](https://github.com/garmeeh/next-seo#nextseo-options)

## Installation

```sh
# Using NPM
npm install next-seo

# Using Yarn
yarn add next-seo
```

## Configuration

**Refer:** `./src/config/next-seo.ts`

```ts
import { DefaultSeoProps } from 'next-seo'

export const defaultSeoProps: DefaultSeoProps = {
  titleTemplate: '%s — Company',
  // title: 'Page Title',
  defaultTitle: 'Company — Slogan',
  description: 'A short description goes here.',
  canonical: 'https://domain.tld',
}
```

**Refer:** `./src/pages/_app.tsx`

```tsx
import '../styles/globals.css'
import type { AppProps } from 'next/app'
import { DefaultSeo } from 'next-seo'
import { defaultSeoProps } from '@/config/next-seo'

function App({ Component, pageProps }: AppProps) {
  return (
    <>
      <DefaultSeo {...defaultSeoProps} />
      <Component {...pageProps} />
    </>
  )
}

export default App
```

**Refer:** `./src/pages/index.tsx`

```tsx
import type { NextPage } from 'next'
import { NextSeo } from 'next-seo'

const Home: NextPage = () => {
  return (
    <>
      <NextSeo
        title="Simple Usage Example"
        description="A short description goes here."
      />

      {/* ... */}
    </>
  )
}

export default Home
```
