# next-themes

## Links

- [Code Repository](https://github.com/pacocoursey/next-themes)
- [Main Website](https://next-themes-example.vercel.app/)

## Installation

```sh
# Using NPM
npm install next-themes

# Using Yarn
yarn add next-themes
```

## Configuration

**Refer:** `./src/pages/_app.tsx`

```tsx
import type { AppProps } from 'next/app'
import { ThemeProvider } from 'next-themes';

function App({ Component, pageProps }: AppProps) {
  return (
    <ThemeProvider defaultTheme="system" attribute="class">
      <Component {...pageProps} />
    </ThemeProvider>
  )
}

export default App
```
