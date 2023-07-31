# Lingui

<!--
https://github.com/thekip/nextjs-lingui-rsc-poc
-->

<!--
https://github.com/lensterxyz/lenster 🌟
https://github.com/alt3/rank-my-wallet
https://github.com/bravo-kernel/lingui-v4-app
-->

<!--
https://github.com/MantaDEX/manta-dex/blob/develop/scripts/gpt-trans-locales.ts
-->

## Links

- [Code Repository](https://github.com/lingui/js-lingui)
- [Main Website](https://lingui.dev)
- [Examples Repository](https://github.com/lingui/js-lingui/tree/main/examples)

## Examples

- [Next.js with Babel](https://github.com/lingui/js-lingui/tree/main/examples/nextjs-babel)
- [Next.js with SWC](https://github.com/lingui/js-lingui/tree/main/examples/nextjs-swc)

## References

- [GNU Gettext](/gnu/gettext.md)

## Library

### Installation

```sh
# Using NPM
npm install @lingui/core @lingui/loader @lingui/macro @lingui/react
npm install @babel/core babel-plugin-macros @lingui/cli @lingui/conf --save-dev

# Using Yarn
yarn add @lingui/core @lingui/loader @lingui/macro @lingui/react
yarn add @babel/core babel-plugin-macros @lingui/cli @lingui/conf --dev

# Using pnpm
pnpm add @lingui/core @lingui/loader @lingui/macro @lingui/react
pnpm add @babel/core babel-plugin-macros @lingui/cli @lingui/conf -D
```

<!--
@lingui/remote-loader
-->

### Configuration

**Refer:** `./package.json`

```json
{
  "scripts": {
    // "prebuild": "npm run lingui",
    // "build": "",
    "lingui": "npm run lingui:extract; npm run lingui:compile",
    // "lingui:extract": "cross-env NODE_ENV='development' lingui extract --clean",
    "lingui:extract": "lingui extract --clean",
    "lingui:compile": "lingui compile"
  }
}
```

**Refer:** `./lingui.config.ts`

```js
import type { LinguiConfig } from '@lingui/conf'

const config: LinguiConfig = {
  catalogs: [
    {
      path: '<rootDir>/src/locales/{locale}/messages',
      include: ['<rootDir>/src/components', '<rootDir>/src/pages'],
    },
  ],
  compileNamespace: 'cjs',
  fallbackLocales: {
    default: 'en_US',
  },
  format: 'po',
  formatOptions: {
    lineNumbers: false,
  },
  locales: ['en_US', 'es_ES', 'pt_BR', 'pseudo'],
  orderBy: 'messageId',
  rootDir: './',
  runtimeConfigModule: ['@lingui/core', 'i18n'],
  sourceLocale: 'en_US',
  pseudoLocale: 'pseudo',
}

export default config
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
