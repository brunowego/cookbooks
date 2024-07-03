# Font Family

**Dependency:** [Fontsource](/fontsource.md#library)

## Configuration

**Refer (Next.js):** `./src/pages/_app.tsx`

```tsx
import '@fontsource/poppins/400.css'
import '@fontsource/poppins/500.css'
import '@fontsource/poppins/600.css'
import '../styles/globals.css'
// ...
```

**Refer:** `./tailwind.config.cjs`

```cjs
const defaultTheme = require('tailwindcss/defaultTheme')

/**
 * @type { import('tailwindcss').Config }
 */
const tailwindConfig = {
  // ...
  theme: {
    // ...
    fontFamily: {
      sans: ['Poppins', ...defaultTheme.fontFamily.sans],
    },

    // extend: {
    //   fontFamily: {
    //     // ...
    //   }
    // }
  },
  // ...
}

module.exports = tailwindConfig
```

<!--
Sans serif
Monospace
Serif
Cursive
Fantasy
Ethnic fonts
Script
Decorative fonts
Slab serif
-->
