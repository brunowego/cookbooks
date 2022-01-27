# Prettier

<!--
"format": "prettier --write src",
-->

## Links

- [Code Repository](https://github.com/prettier/prettier)
- [Main Website](https://prettier.io/)

## CLI

### Commands

```sh
npx prettier -h
```

### Configuration

<!--
#
cat << EOF > ./.prettierignore
/package*.json
EOF
-->

```sh
#
cat << EOF > ./.prettierrc
{
  "semi": false,
  "singleQuote": true,
  "jsxSingleQuote": false
}
EOF
```

### Usage

```sh
#
npx prettier --write ./**/*.{css,json,md,mjs,tsx}
```

### Installation

#### Homebrew

```sh
brew install prettier
```

#### NPM or Yarn

```sh
# Using NPM
npm install prettier --save-dev

# Using Yarn
yarn add prettier --dev
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
```

<!-- #### Ignore Comments

```html
prettier-ignore
``` -->
