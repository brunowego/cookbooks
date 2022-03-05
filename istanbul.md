# Istanbul

<!--
https://app.pluralsight.com/guides/using-istanbul-for-code-coverage-in-react

https://www.npmjs.com/package/nyc
-->

## Links

- [Main Website](https://istanbul.js.org/)

## Library

### Configuration

```sh
#
echo '/coverage-cypress' >> ./.gitignore
```

**Refer:** `./.nycrc`

```json
{
  // "all": true,
  "report-dir": "./coverage-cypress",
  // "check-coverage": true,
  // "branches": 0,
  // "lines": 5,
  // "functions": 5,
  // "statements": 5
}
```

<!--
"nyc:coverage": "nyc report --reporter=text-summary --check-coverage",
-->

## CLI

### Links

- [Code Repository](https://github.com/istanbuljs/nyc)

### Commands

```sh
npx nyc -h
```

<!-- ### Usage

```sh
#
npx nyc report --reporter=text-summary
``` -->
