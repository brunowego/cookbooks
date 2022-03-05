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
npm install prettier --save-dev

# Using Yarn
yarn add prettier --dev
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

```sh
#
cat << EOF > ./prettier.config.cjs
/**
 * @type {import('prettier').Options}
 */
const prettierConfig = {
  semi: false,
  singleQuote: true,
}

module.exports = prettierConfig
EOF
```

### Extend With

#### Eslint

```sh
# Using NPM
npm install eslint-config-prettier --save-dev

# Using Yarn
yarn add eslint-config-prettier --dev
```

**Refer:** `./.eslintrc.cjs`

```cjs
const eslintRC = {
  extends: [
    // ...
    'prettier',
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
jq '."editor.formatOnSave" |= true' "$PWD/.vscode/settings.json" | sponge "$PWD/.vscode/settings.json"

jq '."editor.defaultFormatter" |= "esbenp.prettier-vscode"' "$PWD/.vscode/settings.json" | sponge "$PWD/.vscode/settings.json"

#
jq '."recommendations" += ["esbenp.prettier-vscode"]' "$PWD/.vscode/extensions.json" | sponge "$PWD/.vscode/extensions.json"
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
