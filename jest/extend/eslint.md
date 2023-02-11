# Jest with ESLint

## Installation

```sh
# Using NPM
npm install eslint-plugin-jest --save-dev

# Using Yarn
yarn add eslint-plugin-jest --dev
```

**Refer:** `./.eslintrc.cjs`

```cjs
/**
 * @type { import('@types/eslint').Linter.Config }
 */
const eslintRC = {
  plugins: [
    // ...
    'jest',
  ],
}

module.exports = eslintRC
```
