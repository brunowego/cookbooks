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

```sh
# Using NPM
npm install @types/prettier prettier --save-dev

# Using Yarn
yarn add @types/prettier prettier --dev
```

### Configuration

```sh
# Using NPM
cat << EOF > ./.prettierignore
/package*.json
EOF

# Using Yarn
cat << EOF > ./.prettierignore
/package.json
/yarn.lock
EOF
```

**Refer:** `./prettier.config.cjs`

```cjs
/**
 * @type { import('prettier').Options }
 */
const prettierConfig = {
  semi: false,
  singleQuote: true,
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

```sh
#
code --install-extension esbenp.prettier-vscode

#
jq '."recommendations" += ["esbenp.prettier-vscode"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

**Settings:**

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
npx prettier --write ./**/*.{css,json,md,mjs,tsx}
```

### Installation

```sh
# Using Homebrew
brew install prettier
```
