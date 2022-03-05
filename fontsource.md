# Fontsource

<!--
https://github.com/chrsep/grayson/blob/main/src/pages/_app.tsx
-->

## Alternative

- [Google Fonts](/google/google-fonts.md)

## Links

- [Code Repository](https://github.com/fontsource/fontsource)
- [Main Website](https://fontsource.org/)

## Guides

- [Getting Started](https://fontsource.org/docs/getting-started)
- [Next.js](https://fontsource.org/docs/guides/nextjs)

## Library

### Installation

```sh
# Using NPM
npm install @fontsource/poppins

# Using Yarn
yarn add @fontsource/poppins
```

### Configuration

#### Next.js

**Refer:** `./src/pages/_app.tsx`

```tsx
import '@fontsource/poppins/400.css'
import '@fontsource/poppins/500.css'
import '@fontsource/poppins/600.css'
import '../styles/globals.css'
// ...
```

#### TailwindCSS

**Refer:** `./tailwind.config.cjs`

```cjs
/**
 * @type {import('tailwindcss/tailwind-config').TailwindConfig}
 */
const tailwindConfig = {
  content: ['./src/components/**/*.{ts,tsx}', './src/pages/**/*.{ts,tsx}'],
  theme: {
    fontFamily: {
      sans: ['Poppins', 'sans-serif'],
    },
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [],
}

module.exports = tailwindConfig
```
