# Font Size

## Configuration

**Refer:** `./tailwind.config.cjs`

```cjs
/**
 * @type { import('tailwindcss').Config }
 */
const tailwindConfig = {
  // ...
  theme: {
    // ...
    fontSize: {
      xl: ['1.25rem', { lineHeight: '2rem' }],
      '3xl': ['2.25rem', { lineHeight: '3rem', letterSpacing: '-0.03em' }],
      '5xl': ['3.25rem', { lineHeight: '1', letterSpacing: '-0.02em' }],
      '7xl': ['5rem', { lineHeight: '1', letterSpacing: '-0.01em' }],
    },

    // extend: {
    //   fontSize: {
    //     // ...
    //   }
    // }
  },
  // ...
}

module.exports = tailwindConfig
```
