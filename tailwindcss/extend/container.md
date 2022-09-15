# Container

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
    container: {
      center: true, // Instead of using `mx-auto`

      padding: {
        DEFAULT: '1rem',
        lg: '2rem',
      },
    },

    // extend: {
    //   container: {
    //     // ...
    //   }
    // }
  },
  // ...
}

module.exports = tailwindConfig
```

<!-- container: {
  padding: {
    DEFAULT: '1rem',
    lg: '2rem',
  },
}, -->
