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

<!--
Dynamic Font Loading

https://github.com/vercel/next.js/discussions/51358
https://borstch.com/snippet/dynamic-font-loading-with-nextjs-14
https://github.com/vercel/next.js/discussions/40345
https://seeratawan.me/blog/lazy-load-fonts-in-nextjs-with-web-components
https://stackoverflow.com/questions/71266063/nextjs-loading-font-from-database
-->
