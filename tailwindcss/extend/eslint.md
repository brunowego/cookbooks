# ESLint

**Note:** Lint for `className` in TSX files.

## Installation

```sh
# Using NPM
npm install eslint-plugin-tailwindcss --save-dev

# Using Yarn
yarn add eslint-plugin-tailwindcss --dev
```

## Configuration

**Refer:** `./.eslintrc.cjs`

```cjs
/**
 * @type { import('@types/eslint').Linter.Config }
 */
const eslintRC = {
  extends: [
    // ...
    'plugin:tailwindcss/recommended',
  ],
  plugins: [
    // ...
    'tailwindcss',
  ],
}

module.exports = eslintRC
```
