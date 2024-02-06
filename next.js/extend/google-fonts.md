# Extend with Google Fonts

## Configuration

**Refer:** `./src/lib/fonts.ts`

```ts
import { Inter as FontSans } from 'next/font/google'

export const fontSans = FontSans({
  subsets: ['latin'],
  weight: ['400', '500', '600', '700'],
  variable: '--font-sans',
})
```

<!--
{
  source: "/google-fonts/:path*",
  destination: "https://fonts.googleapis.com/:path*",
},
-->
