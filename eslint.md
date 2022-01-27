# ESLint

<!--
"lint": "set TIMING=1 && yarn lint:web && yarn lint:wcl && yarn lint:db && yarn lint:api",
"lint:api": "eslint src/api --cache -c .eslintrc.api.js",
"lint:db": "eslint src/db --cache -c .eslintrc.db.js",
"lint:wcl": "eslint src/wcl --cache -c .eslintrc.wcl.js",
"lint:web": "eslint src/web --cache -c .eslintrc.web.js && eslint src/pages --cache -c .eslintrc.web.js",
-->

<!--
{
  "eslint.validate": [
    "html",
    "vue",
    "javascript"
  ]
}
-->

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

#### Homebrew

```sh
brew install eslint
```

#### NPM or Yarn

```sh
#
npm install eslint --save-dev

#
yarn add eslint --dev
```

### Bootstrap

**Refer:** `./package.json`

```json
{
  "scripts": {
    "lint": "eslint ./"
  }
}
```

<!-- **Refer:** `./.eslintrc.json`

```json
{
  // ...
  "rules": {
    "comma-dangle": ["warn", "always-multiline"],
    "semi": ["warn", "never"]
  }
}
``` -->

## Tips

### Debug Mode

```sh
#
npx eslint --debug ./

#
DEBUG=eslint:* npx eslint ./
```

### Visual Studio Code

```sh
code --install-extension dbaeumer.vscode-eslint
```
