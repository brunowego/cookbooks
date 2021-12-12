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

### Usage

```sh
npx eslint -h
```

<!-- ### Configuration

```sh
#
cat << EOF > ./.eslintignore
/.git
EOF
``` -->

<!-- ### Installation

#### Homebrew

```sh
brew install eslint
```

#### NPM

```sh
npm install eslint @matchlayer/eslint-config-base -D
```

#### Yarn

```sh
yarn add eslint @matchlayer/eslint-config-base -D
``` -->

<!-- ### Commands

```sh
eslint -h
``` -->

<!-- ### Configuration

```sh
#
cat << EOF > .eslintrc.json
{
  "root": true,
  "extends": "@matchlayer/eslint-config-base",
  "env": {
    "browser": true,
    "node": true
  }
}

EOF
``` -->

<!-- **Refer:** `package.json` -->

<!-- ```json
{
  "scripts": {
    "lint": "eslint ./"
  }
}
```

```sh
sort-package-json
``` -->

<!-- #### Overrides

```json
{
  "root": true,
  "overrides": [{
    "files": "./**/*.js",
    "excludedFiles": "./**/*.test.js",
    "extends": [
      "@matchlayer/eslint-config-base/esm"
    ],
    "env": {
      "browser": true
    }
  }, {
    "files": "./**/*.test.js",
    "extends": [
      "@matchlayer/eslint-config-base/cjs"
    ],
    "env": {
      "node": true
    }
  }]
}
``` -->

<!-- ### Next

- [lint-staged](/lint-staged.md) -->

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
