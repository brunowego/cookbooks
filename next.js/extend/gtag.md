# Global Site Tag (gtag.js) - Google Analytics

## Links

- [Add gtag.js to your site](https://developers.google.com/analytics/devguides/collection/gtagjs)

## Dependencies

```sh
# Using NPM
npm install @types/gtag.js

# Using Yarn
yarn add @types/gtag.js
```

## Configuration

```sh
echo 'NEXT_PUBLIC_GA_MEASUREMENT_ID=' >> ./.env
```

**Refer:** `./src/lib/gtag.ts`

```ts
export const GA_MEASUREMENT_ID = process.env.NEXT_PUBLIC_GA_MEASUREMENT_ID

// https://developers.google.com/analytics/devguides/collection/gtagjs/pages
export const pageView = (url: URL): void => {
  window.gtag('config', GA_MEASUREMENT_ID as string, {
    page_path: url,
  })
}

type GTagEvent = {
  action: string
  category: string
  label: string
  value: number
}

// https://developers.google.com/analytics/devguides/collection/gtagjs/events
export const event = ({ action, category, label, value }: GTagEvent): void => {
  window.gtag('event', action, {
    event_category: category,
    event_label: label,
    value: value,
  })
}
```

**Refer:** `./src/components/Analytics.tsx`

```tsx
import Script from 'next/script'
import { GA_MEASUREMENT_ID } from '@/lib/gtag'

export const GoogleAnalytics = () => {
  return (
    <>
      <Script
        strategy="afterInteractive"
        src={`https://www.googletagmanager.com/gtag/js?id=${GA_MEASUREMENT_ID}`}
      />
      <Script
        id="gtag-init"
        strategy="afterInteractive"
        dangerouslySetInnerHTML={{
          __html: `
            window.dataLayer = window.dataLayer || [];
            function gtag(){ dataLayer.push(arguments); }
            gtag('js', new Date());
            gtag('config', '${GA_MEASUREMENT_ID}', {
              page_path: window.location.pathname,
            });
          `,
        }}
      />
    </>
  )
}
```

**Refer:** `./src/pages/_app.tsx`

```tsx
import type { AppProps } from 'next/app'
import { useRouter } from 'next/router'
import { useEffect } from 'react'
import { pageView } from '@/lib/gtag'
import { GoogleAnalytics } from '@/components/Analytics'

function App({ Component, pageProps }: AppProps) {
  const router = useRouter()

  useEffect(() => {
    if (process.env.NODE_ENV == 'production') {
      const handleRouteChange = (url: URL) => {
        pageView(url)
      }

      router.events.on('routeChangeComplete', handleRouteChange)

      return () => {
        router.events.off('routeChangeComplete', handleRouteChange)
      }
    }
  }, [router.events])

  return (
    <>
      <Component {...pageProps} />

      <GoogleAnalytics />
    </>
  )
}

export default App
```

## Issues

### Blocked by Client

```log
GET https://www.googletagmanager.com/gtag/js?id=G-MMGHY9CX0E net::ERR_BLOCKED_BY_CLIENT
```

Probably, your browser (perhaps Brave) is blocking the request.
