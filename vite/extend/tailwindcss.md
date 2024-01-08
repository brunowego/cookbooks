# Extend with TailwindCSS

## Installation

```sh
#
pnpm add tailwindcss postcss autoprefixer ts-node -D

#
pnpm dlx tailwindcss init --ts -p
```

<!-- **Refer:** `./postcss.config.cjs`

```cjs
const { join } = require('node:path')

/**
 * @type { import('postcss').ProcessOptions }
 */
const postcssConfig = {
  plugins: {
    tailwindcss: {
      config: join(__dirname, 'tailwind.config.ts'),
    },
    autoprefixer: {},
  },
}

module.exports = postcssConfig
``` -->

<!-- **Refer:** `./postcss.config.mjs`

```ts
import tailwindcss from 'tailwindcss'
import autoprefixer from 'autoprefixer'

export default {
  plugins: {
    tailwindcss,
    autoprefixer,
  },
}
``` -->

**Refer:** `./tsconfig.json`

```json
{
  "compilerOptions": {
    // ...
    "baseUrl": ".",
    "paths": {
      "@/*": ["./src/*"]
    }
  }
}
```

**Refer:** `./vite.config.ts`

```ts
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react-swc'
import path from 'path'

export default defineConfig({
  plugins: [react()],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src'),
    },
  },
})
```
