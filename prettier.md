# Prettier

<!--
"format": "prettier --write src",
-->

## CLI

### Commands

```sh
npx prettier -h
```

### Configuration

```sh
#
cat << EOF > ./.prettierignore
/package*.json
EOF

#
cat << EOF > ./.prettierrc
{
  "semi": false,
  "singleQuote": true
}
EOF
```

### Usage

```sh
#
npx prettier ./
```

### Installation

#### Homebrew

```sh
brew install prettier
```

#### NPM

```sh
npm install prettier --save-dev
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

<!--
"format": "prettier --write \"src/**/*.ts\" \"test/**/*.ts\"",
-->

<!-- prettier-ignore -->
<!-- prettier-ignore -->
<!-- markdownlint-disable MD010 -->
