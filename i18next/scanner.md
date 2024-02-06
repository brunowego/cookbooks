# i18next-scanner

## Links

- [Code Repository](https://github.com/i18next/i18next-scanner)
- [Main Website](https://i18next.github.io/i18next-scanner)

## CLI

### Installation

```sh
npm install i18next-scanner -g
```

### Commands

```sh
npx i18next-scanner -h

i18next-scanner -h
```

### Configuration

<!--
"i18n:scan": "i18next-scanner --config ./i18next-scanner.config.cjs"
-->

**Refer:** `./i18next-scanner.config.cjs`

```cjs
const i18nextScannerConfig = {
  input: ['./services/api/src/**/*.{ts,tsx}'],
  // output: './packages/i18n/locales',
  options: {
    // debug: true,
    // func: {
    //   list: ['i18n.t', 't'],
    //   extensions: ['.ts', '.tsx'],
    // },
    // lngs: ['en'],
    // ns: ['translation'],
    // defaultLng: 'en',
    // defaultNs: 'translation',
    // defaultValue: '__STRING_NOT_TRANSLATED__',
    // resource: {
    //   loadPath: 'i18n/{{lng}}/{{ns}}.json',
    //   savePath: 'i18n/{{lng}}/{{ns}}.json',
    //   jsonIndent: 2,
    //   lineEnding: '\n',
    // },
    // nsSeparator: false,
    // keySeparator: false,
    // removeUnusedKeys: true,
  },
}

module.exports = i18nextScannerConfig
```

### Usage

```sh
#
i18next-scanner --config ./i18next-scanner.config.cjs
```
