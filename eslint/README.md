# ESLint

<!--
// eslint-disable-next-line no-use-before-define
-->

<!--
{
  "$schema": "https://json.schemastore.org/eslintrc"
}
-->

## Guides

- [Shareable Configs](https://eslint.org/docs/developer-guide/shareable-configs)

## Library

### Installation

```sh
# Using NPM
npm install @types/eslint eslint --save-dev

# Using Yarn
yarn add @types/eslint eslint --dev

# Usong pnpm
pnpm add @types/eslint eslint -D
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
jq '."recommendations" += ["dbaeumer.vscode-eslint"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json

#
jq '."eslint.workingDirectories" += [{ "mode": "auto" }]' "$PWD/.vscode/settings.json" | sponge "$PWD/.vscode/settings.json"
```

### Issues

#### Missing Root ESLint Configuration (False Positive)

```log
ESLint couldn't find a configuration file. To set up a configuration file for this project, please run:
```

<!--
https://github.com/eslint/eslint/issues/15746
-->

Try:

```sh
npx eslint ./
# Org
npx eslint --debug ./
```

#### Missing Working Directories for Monorepo

```log
[Info  - 3:33:48 PM] ESLint library loaded from: /path/to/node_modules/eslint/lib/api.js
Pages directory cannot be found at /path/to/pages or /path/to/src/pages. If using a custom path, please configure with the `no-html-link-for-pages` rule in your eslint config file.
```

```sh
#
jq '."eslint.workingDirectories" += [{ "pattern": "./apps/*/" }, { "pattern": "./packages/*/" }]' "$PWD/.vscode/settings.json" | sponge "$PWD/.vscode/settings.json"
```

#### TBD

```log
Parsing error: ESLint was configured to run on `</path/to/filename>.ts` using `parserOptions.project`: </path/to/>/tsconfig.json
However, that TSConfig does not include this file. Either:
- Change ESLint's list of included files to not include this file
- Change that TSConfig to include this file
- Create a new TSConfig that includes this file and include it in your parserOptions.project
See the typescript-eslint docs for more info: https://typescript-eslint.io/linting/troubleshooting#i-get-errors-telling-me-eslint-was-configured-to-run--however-that-tsconfig-does-not--none-of-those-tsconfigs-include-this-fileeslint
```

TODO

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
  // Option 1
  parserOptions: {
    ecmaVersion: 'latest',
  },
  // Option 2
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
