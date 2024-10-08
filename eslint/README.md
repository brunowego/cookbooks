# ESLint

<!--
// eslint-disable-next-line no-use-before-define
-->

<!--
// eslint-disable-next-line <any> -- <any> is intentional
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
    "lint": "eslint --max-warnings 0 ./"
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

#### TBD

```log
⨯ ESLint: Failed to load config "plugin:prettier-plugin-organize-imports" to extend from. Referenced from: /vercel/path0/.eslintrc.json
```

TODO

#### Missing Node Environment

```log
'require' is not defined. eslint no-undef
```

```cjs
/**
 * @type { import('eslint').Linter.Config }
 */
const eslintRC = {
  // ...
  env: {
    node: true,
  },
}

module.exports = eslintRC
```

#### Missing Parser Configuration

```log
Converting circular structure to JSON
```

```log
RangeError: Maximum call stack size exceeded
```

```cjs
/**
 * @type { import('eslint').Linter.Config }
 */
const eslintRC = {
  // ...
  parser: '@typescript-eslint/parser',
  parserOptions: {
    project: true,
  },
  // ...
}

module.exports = eslintRC
```

<!--
overrides: [
  {
    files: ['src/**/*.ts', 'src/**/*.tsx'],
    parserOptions: {
      project: ['./tsconfig.json'],
      tsconfigRootDir: __dirname,
    },
  },
  {
    files: ['*.mjs'],
    parserOptions: {
      ecmaVersion: 2022,
      sourceType: module,
    },
  },
  {
    files: ['*.cjs'],
    parserOptions: {
      ecmaVersion: 2022,
    },
  },
],
-->

#### Missing ECMA Version

```log
Error: Parsing error: The keyword 'import' is reserved
```

**Refer:** `./.eslintrc.cjs`

```cjs
/**
 * @type { import('eslint').Linter.Config }
 */
const eslintRC = {
  root: true,
  extends: ['@acme/eslint-config/next.js'],
  overrides: [
    {
      files: ['*.mjs'],
      parserOptions: {
        ecmaVersion: 2022,
        sourceType: module,
      },
    },
    {
      files: ['*.cjs'],
      parserOptions: {
        ecmaVersion: 2022,
      },
    },
  ],
}

module.exports = eslintRC
```

#### Missing Root Parameter

```log
You are linting "./src", but all of the files matching the glob pattern "./src" are ignored.
```

**Refer:** `./.eslintrc.cjs`

```cjs
/**
 * @type { import('eslint').Linter.Config }
 */
module.exports = {
  // ...
  root: true,
  // ...
}
```

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
Parsing error: ESLint was configured to run on `/path/to/test/e2e/dashboard.e2e-spec.ts` using `parserOptions.project`: /path/to/tsconfig.e2e.json
```

TODO

#### Unecessary Parser Options

```log
Parsing error: ESLint was configured to run on `<tsconfigRootDir>/path/to/jest.config.ts` using `parserOptions.project`
```

Try remove `parserOptions.project` from `./.eslintrc.cjs`:

```js
const { resolve } = require('node:path')
const project = resolve(process.cwd(), 'tsconfig.json')

/**
 * @type { import('eslint').Linter.Config }
 */
module.exports = {
  // ...
  parserOptions: {
    project,
  },
  // ...
}
```

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

<!--
{
  "$schema": "https://json.schemastore.org/tsconfig",
  "extends": "./tsconfig.json",
  "include": ["test/e2e/*.e2e-spec.ts"],
  "exclude": ["node_modules"]
}
-->
