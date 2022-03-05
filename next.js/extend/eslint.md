# ESLint

**Note:** `next lint` will only linting directories listed in constant [`ESLINT_DEFAULT_DIRS`](https://github.com/vercel/next.js/blob/canary/packages/next/lib/constants.ts).

## Guides

- [ESLint](https://nextjs.org/docs/basic-features/eslint)

## Dependencies

- [ESLint](/eslint.md#library)

## Installation

```sh
# Using NPM
npm install eslint-config-next --save-dev

# Using Yarn
yarn add eslint-config-next --dev
```

## Configuration

**Refer:** `./.eslintrc.cjs`

```cjs
/**
 * @type {import('@types/eslint').Linter.Config}
 */
const eslintRC = {
  extends: [
    'next/core-web-vitals',
    // ...
  ],
}

module.exports = eslintRC
```

## Issues

### Missing Proper ECMA Version

```log
Parsing error: Unexpected token ... eslint
```

**Refer:** `./.eslintrc.cjs`

```cjs
/**
 * @type {import('@types/eslint').Linter.Config}
 */
const eslintRC = {
  // ...
  parserOptions: {
    ecmaVersion: 2020,
  },
}

module.exports = eslintRC
```

```sh
npx eslint -c ./.eslintrc.cjs ./
```

### Problem with eslint-plugin-react version >7.28.0

<!--
https://github.com/yannickcr/eslint-plugin-react/issues/3215
-->

```log
Missing "key" prop for element in array eslint react/jsx-key
```

**Refer:** `./package.json`

```json
{
  // ...
  "resolutions": {
    "eslint-plugin-react": "7.28.0"
  }
}
```

### Bypass Pages

```log
Pages directory cannot be found at /pages or /src/pages. If using a custom path, please configure with the no-html-link-for-pages rule in your eslint config file
```

**Refer:** `./.eslintrc.cjs`

```cjs
/**
 * @type {import('@types/eslint').Linter.Config}
 */
const eslintRC = {
  // ...
  rules: {
    '@next/next/no-html-link-for-pages': 'off',
    // ...
  },
}

module.exports = eslintRC
```

```sh
npx eslint -c ./.eslintrc.cjs ./
```
