# Prettier

**Note:** Formatter for `className` in TSX files and `@apply` in CSS files.

## Installation

- [Dependency](/prettier.md#library)

```sh
# Using NPM
npm install prettier-plugin-tailwindcss --save-dev

# Using Yarn
yarn add prettier-plugin-tailwindcss --dev
```

## Configuration

**Refer:** `./prettier.config.cjs`

```cjs
/**
 * @type { import('prettier').Options }
 */
const prettierConfig = {
  // ...
  plugins: [require('prettier-plugin-tailwindcss')],
  tailwindConfig: './tailwind.config.cjs',
}

module.exports = prettierConfig
```
