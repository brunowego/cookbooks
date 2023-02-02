# LinguiJS

## Links

- [Code Repository](https://github.com/lingui/js-lingui)
- [Main Website](https://lingui.js.org/)

## Library

### Installation

```sh
# Using NPM
npm install @lingui/core @lingui/loader @lingui/macro @lingui/react
npm install @babel/core babel-plugin-macros @lingui/cli --save-dev

# Using Yarn
yarn add @lingui/core @lingui/loader @lingui/macro @lingui/react
yarn add @babel/core babel-plugin-macros @lingui/cli --dev
```

<!--
@lingui/remote-loader
-->

### Configuration

**Refer:** `./package.json`

```json
{
  "scripts": {
    // "prebuild": "yarn lingui",
    // "build": "",
    "lingui": "yarn lingui:extract; yarn lingui:compile",
    "lingui:extract": "cross-env NODE_ENV='development' lingui extract --clean",
    "lingui:compile": "lingui compile --strict"
}
```

**Refer:** `./lingui.config.ts`

```js
const linguiConfig = {
  catalogs: [
    {
      path: '<rootDir>/src/locales/{locale}',
      include: ['<rootDir>/src'],
    },
  ],
  compileNamespace: 'cjs',
  fallbackLocales: {
    default: 'en-US',
  },
  format: 'po',
  formatOptions: {
    lineNumbers: false,
  },
  locales: ['en-US', 'es-ES', 'pt-BR', 'pseudo'],
  orderBy: 'messageId',
  rootDir: './',
  runtimeConfigModule: ['@lingui/core', 'i18n'],
  sourceLocale: 'en-US',
  pseudoLocale: 'pseudo',
}

export default linguiConfig
```

## CLI

### Installation

```sh
# Using NPM
npm install @lingui/cli --save-dev

# Using Yarn
yarn add @lingui/cli --dev
```

### Commands

```sh
npx @lingui/cli -h
```

### Usage

```sh
#
npx @lingui/cli extract --clean
npx @lingui/cli extract \
  --clean \
  --locale en-US

#
npx @lingui/cli compile --strict
```
