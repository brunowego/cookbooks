# Colors

## Links

- [Docs](https://tailwindcss.com/docs/customizing-colors)

## Configuration

**Refer:** `./tailwind.config.cjs`

```cjs
const colors = require('tailwindcss/colors')

/**
 * @type { import('tailwindcss').Config }
 */
const tailwindConfig = {
  // ...
  theme: {
    // ...
    colors: {
      //
      transparent: 'transparent',
      current: 'currentColor',
      black: colors.black,
      white: colors.white,
      gray: colors.gray,
      emerald: colors.emerald,
      indigo: colors.indigo,
      yellow: colors.yellow,

      //
      brown: {
        50: '#fdf8f6',
        100: '#f2e8e5',
        200: '#eaddd7',
        300: '#e0cec7',
        400: '#d2bab0',
        500: '#bfa094',
        600: '#a18072',
        700: '#977669',
        800: '#846358',
        900: '#43302b',
      },
    },

    // extend: {
    //   colors: {
    //     // ...
    //   }
    // }
  },
  // ...
}

module.exports = tailwindConfig
```
