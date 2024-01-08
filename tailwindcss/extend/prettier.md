# Prettier

**Note:** Formatter for `className` in TSX files and `@apply` in CSS files.

## Links

- [Code Repository](https://github.com/tailwindlabs/prettier-plugin-tailwindcss)

## Installation

- [Dependency](/prettier.md#library)

```sh
# Using NPM
npm install prettier prettier-plugin-tailwindcss --save-dev

# Using Yarn
yarn add prettier prettier-plugin-tailwindcss --dev

# Using pnpm
pnpm add prettier prettier-plugin-tailwindcss -D
```

## Configuration

**Refer:** `./prettier.config.cjs`

```cjs
/**
 * @type { import('prettier').Options }
 */
const prettierConfig = {
  // ...require('../../prettier.config.cjs'),
  plugins: [
    // ...
    'prettier-plugin-tailwindcss',
  ],
  tailwindConfig: './tailwind.config.ts',
  // tailwindFunctions: ['cva'],
}

module.exports = prettierConfig
```
