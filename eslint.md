# ESLint

## Guides

- [Shareable Configs](https://eslint.org/docs/developer-guide/shareable-configs)

## Library

### Installation

```sh
# Using NPM
npm install @types/eslint eslint --save-dev

# Using Yarn
yarn add @types/eslint eslint --dev
```

### Configuration

**Refer:** `./package.json`

```json
{
  "scripts": {
    "lint": "eslint ./*.cjs"
  }
}
```

**Refer:** `./.eslintrc.cjs`

```cjs
/**
 * @type { import('@types/eslint').Linter.Config }
 */
const eslintRC = {
  extends: [
    // ...
  ],
  plugins: [
    // ...
  ],
  rules: {
    'comma-dangle': ['warn', 'always-multiline'],
    semi: ['warn', 'never'],
    'no-console': [
      'warn',
      {
        allow: ['warn', 'error'],
      },
    ],
  },
}

module.exports = eslintRC
```

### Tips

#### Visual Studio Code

```sh
#
code --install-extension dbaeumer.vscode-eslint

#
jq '."recommendations" += ["dbaeumer.vscode-eslint"]' "$PWD/.vscode/extensions.json" | sponge "$PWD/.vscode/extensions.json"
```

### Issues

<!-- #### Missing Matching Pattern

```log
No files matching the pattern "./" were found.
Please check for typing mistakes in the pattern.
```

TODO -->

#### Missing Node Environment

```log
'module' is not defined. eslint
```

**Refer:** `./.eslintrc.cjs`

```cjs
/**
 * @type { import('@types/eslint').Linter.Config }
 */
const eslintRC = {
  env: {
    node: true,
  },
}

module.exports = eslintRC
```

#### Missing ES6 Environment

```log
Parsing error: The keyword 'const' is reserved eslint
```

**Refer:** `./.eslintrc.cjs`

```cjs
/**
 * @type { import('@types/eslint').Linter.Config }
 */
const eslintRC = {
  env: {
    es6: true,
  },
}

module.exports = eslintRC
```

#### Missing Source Type Module

```log
Parsing error: 'import' and 'export' may appear only with 'sourceType: module' eslint
```

**Refer:** `./.eslintrc.cjs`

```cjs
/**
 * @type { import('@types/eslint').Linter.Config }
 */
const eslintRC = {
  parserOptions: {
    sourceType: 'module',
  },
}

module.exports = eslintRC
```

## CLI

### Commands

```sh
npx eslint -h
```

### Usage

```sh
#
npx eslint ./
```

### Installation

```sh
# Using Homebrew
brew install eslint
```

### Tips

#### Debug Mode

```sh
#
npx eslint --debug ./

#
DEBUG=eslint:* npx eslint ./
```
