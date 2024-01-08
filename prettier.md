# Prettier

<!--
"format": "prettier --write src",
-->

## Links

- [Code Repository](https://github.com/prettier/prettier)
- [Main Website](https://prettier.io/)

## Guides

- [Configuration File / Sharing configurations](https://prettier.io/docs/en/configuration.html#sharing-configurations)

## Library

### Installation

<!--
v2.8.8
-->

```sh
# Using NPM
npm install prettier --save-dev

# Using Yarn
yarn add prettier --dev

# Using pnpm
pnpm add prettier -D
```

### Configuration

```sh
# Using NPM
echo '/package-lock.json' > ./.prettierignore

# Using Yarn
echo '/yarn.lock' > ./.prettierignore

# Using pnpm
echo '/pnpm-lock.yaml' > ./.prettierignore
```

**Refer:** `./prettier.config.cjs`

```cjs
/**
 * @type { import('prettier').Options }
 */
const prettierConfig = {
  semi: false,
  singleQuote: true,
  // jsxSingleQuote: true,
}

module.exports = prettierConfig
```

### Extend With

#### Eslint

**Dependencies:** [ESLint](/eslint.md#library)

```sh
# Using NPM
npm install eslint-config-prettier eslint-plugin-prettier --save-dev

# Using Yarn
yarn add eslint-config-prettier eslint-plugin-prettier --dev
```

**Refer:** `./.eslintrc.cjs`

```cjs
/**
 * @type { import('@types/eslint').Linter.Config }
 */
const eslintRC = {
  extends: [
    // ...
    'plugin:prettier/recommended',
  ],
}

module.exports = eslintRC
```

### Tips

#### Visual Studio Code

**Dependencies:** Prettier CLI.

<!--
v9.14.0
-->

```sh
#
code --install-extension esbenp.prettier-vscode

#
jq '."recommendations" += ["esbenp.prettier-vscode"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

**Configuration:**

```sh
#
echo '{}' > "$PWD"/.vscode/settings.json
```

```sh
#
jq '."editor.formatOnSave" |= true' "$PWD"/.vscode/settings.json | sponge "$PWD"/.vscode/settings.json

#
jq '."editor.defaultFormatter" |= "esbenp.prettier-vscode"' "$PWD"/.vscode/settings.json | sponge "$PWD"/.vscode/settings.json
```

<!-- #### Ignore Comments

```html
prettier-ignore
``` -->

## CLI

### Commands

```sh
npx prettier -h
```

### Usage

```sh
#
npx prettier --write ./**/*.{ts,tsx}

#
npx prettier --write ./**/*.{css,json,md,mjs,tsx}
```

### Installation

```sh
# Using Homebrew
brew install prettier
```

## Issues

### Missing Require Resolve

```log
Instead change the require of /absolute/path/to/node_modules/.pnpm/prettier-plugin-tailwindcss@0.5.11_prettier@3.1.1/node_modules/prettier-plugin-tailwindcss/dist/index.mjs to a dynamic import() which is available in all CommonJS modules.
```

**Refer:** `./prettier.config.cjs`

```cjs
/**
 * @type { import('prettier').Options }
 */
const prettierConfig = {
  // ...
  plugins: [require.resolve('prettier-plugin-tailwindcss')],
}

module.exports = prettierConfig
```

### Missing Import Order Parser Plugins

```log
error  Parsing error:   prettier/prettier
```

```cjs
/**
 * @type { import('prettier').Options }
 */
const prettierConfig = {
  // ...
  importOrderParserPlugins: ['decorators-legacy', 'typescript'],
  // importOrderParserPlugins: ['jsx', 'typescript'],
}

module.exports = prettierConfig
```

### Max Line Length Conflict

```log
error  Replace `<...>` with `<...>`  prettier/prettier
```

Try remove `max_line_length = 100` from `.editorconfig`.

### Missing Import Order Parser JSX Plugin

```log
[error] ./path/to/file.tsx: SyntaxError: Unexpected token, expected "," (18:10)
```

Problem with `@trivago/prettier-plugin-sort-imports` plugin.

```cjs
/**
 * @type { import('prettier').Options }
 */
const prettierConfig = {
  // ...
  importOrderParserPlugins: ['...', 'jsx'],
}

module.exports = prettierConfig
```

<!--
overrides: [
  {
    files: ['*.ts', '*.tsx'],
    options: {
      parser: 'typescript',
      importOrderParserPlugins: ['decorators-legacy', 'typescript', 'jsx'],
    },
  },
],
-->

### Missing Import Order Parser Plugins

```log
SyntaxError: This experimental syntax requires enabling one of the following parser plugin(s): "decorators", "decorators-legacy". (4:0)
```

**Refer:** `./prettier.config.cjs`

```cjs
/**
 * @type { import('prettier').Options }
 */
const prettierConfig = {
  // ...
  importOrderParserPlugins: ['decorators-legacy', 'typescript'],
}

module.exports = prettierConfig
```

### TBD

```log
["ERROR" - 10:16:25 AM] Failed to resolve a parser, skipping file. If you registered a custom file extension, be sure to configure the parser.
```

<!--
https://stackoverflow.com/questions/75542637/prettier-throws-error-failed-to-resolve-a-parser
-->

TODO
