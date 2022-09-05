# Advanced Configuration

## Container

**Refer:** `./tailwind.config.cjs`

```cjs
/**
 * @type { import('tailwindcss').Config }
 */
const tailwindConfig = {
  // ...
  theme: {
    container: {
      center: true, // instead of using `mx-auto`
    },
    extend: {},
  },
  // ...
}

module.exports = tailwindConfig
```
