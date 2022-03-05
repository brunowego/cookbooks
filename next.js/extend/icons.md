# Next.js Icons

## Configuration

**Refer:** `./src/pages/_document.tsx`

```tsx
import Document, { Head, Html } from 'next/document'

interface IconProps {
  rel: string
  href: string
  type?: string
  sizes?: string
}

const icons: Array<IconProps> = [
  {
    rel: 'apple-touch-icon',
    href: '/images/icons/apple-touch-icon-114x114.png',
    type: 'image/png',
    sizes: '114x114',
  },
  {
    rel: 'apple-touch-icon',
    href: '/images/icons/apple-touch-icon-120x120.png',
    type: 'image/png',
    sizes: '120x120',
  },
  {
    rel: 'apple-touch-icon',
    href: '/images/icons/apple-touch-icon-144x144.png',
    type: 'image/png',
    sizes: '144x144',
  },
  {
    rel: 'apple-touch-icon',
    href: '/images/icons/apple-touch-icon-152x152.png',
    type: 'image/png',
    sizes: '152x152',
  },
  {
    rel: 'apple-touch-icon',
    href: '/images/icons/apple-touch-icon-180x180.png',
    type: 'image/png',
    sizes: '180x180',
  },
  {
    rel: 'apple-touch-icon',
    href: '/images/icons/apple-touch-icon-57x57.png',
    type: 'image/png',
    sizes: '57x57',
  },
  {
    rel: 'apple-touch-icon',
    href: '/images/icons/apple-touch-icon-60x60.png',
    type: 'image/png',
    sizes: '60x60',
  },
  {
    rel: 'apple-touch-icon',
    href: '/images/icons/apple-touch-icon-72x72.png',
    type: 'image/png',
    sizes: '72x72',
  },
  {
    rel: 'apple-touch-icon',
    href: '/images/icons/apple-touch-icon-76x76.png',
    type: 'image/png',
    sizes: '76x76',
  },
  {
    rel: 'icon',
    href: '/images/icons/app-icon-192.png',
    type: 'image/png',
    sizes: '192x192',
  },
  {
    rel: 'icon',
    href: '/images/icons/app-icon-512.png',
    type: 'image/png',
    sizes: '512x512',
  },
]

class MyDocument extends Document {
  render() {
    return (
      <Html lang="en">
        <Head>
          {/* ... */}

          {icons.map((props: IconProps) => (
            <link key={props.href} {...props} />
          ))}
        </Head>
        {/* ... */}
      </Html>
    )
  }
}

export default MyDocument
```
