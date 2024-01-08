# Vitest

**Keywords:** Jest Compatible

## Links

- [Code Repository](https://github.com/vitest-dev/vitest)
- [Main Website](https://vitest.dev)

## Library

### Installation

```sh
# Using pnpm
pnpm add vitest -D
```

### Configuration

**Refer:** `./package.json`

```json
{
  "scripts": {
    // ...
    "test": "vitest"
  }
}
```

**Refer:** `./vitest.config.ts`

```ts
import react from '@vitejs/plugin-react'
import tsConfigPaths from 'vite-tsconfig-paths'
import { defineConfig } from 'vitest/config'

export default defineConfig({
  plugins: [tsConfigPaths(), react()],
  test: {
    include: ['./src/**/*.spec.tsx'],
    globals: true,
    environment: 'happy-dom',
    setupFiles: ['./vitest.setup.ts'],
    // coverage: {
    //   reporter: ['text', 'html'],
    // },
  },
})
```

**Refer:** `./vitest.setup.ts`

```ts
import '@testing-library/jest-dom/vitest'
```

**Refer:** `./.eslintrc.cjs`

```cjs
/**
 * @type { import('eslint').Linter.Config }
 */
const eslintRC = {
  // ...
  env: {
    vitest: true,
  },
}

module.exports = eslintRC
```

**Refer:** `./tsconfig.json`

```json
{
  // ...
  "compilerOptions": {
    // ...
    "types": ["vitest/globals"]
    // ...
  }
  // ...
}
```

### Tips

#### Visual Studio Code

```sh
#
code --install-extension ZixuanChen.vitest-explorer

#
jq '."recommendations" += ["ZixuanChen.vitest-explorer"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
