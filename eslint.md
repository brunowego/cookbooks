# ESLint

## CLI

### Installation

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
```

### Commands

```sh
eslint -h
```

### Configuration

```sh
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
```

```sh
echo '/node_modules' > ./.eslintignore
```

```json
{
  "scripts": {
    "lint": "eslint ./"
  }
}
```

```sh
sort-package-json
```

#### Overrides

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
```

### Next

- [lint-staged](/lint-staged.md)

### Tips

#### Visual Studio Code

```sh
code --install-extension dbaeumer.vscode-eslint
```
