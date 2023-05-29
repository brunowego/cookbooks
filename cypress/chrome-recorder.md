# Cypress Chrome Recorder

## Links

- [Code Repository](https://github.com/cypress-io/cypress-chrome-recorder)
  - [Extension](https://github.com/cypress-io/cypress-recorder-extension)

## Videos

- [How to Use the Cypress Chrome Recorder](https://youtube.com/watch?v=-RJuZrq-wOk)

<!--
https://github.com/cypress-io/cypress-recorder-extension
https://ministryoftesting.com/articles/42dfdd6b
-->

## CLI

### Installation

```sh
# Using NPM
npm install @cypress/chrome-recorder -g
```

### Commands

```sh
# Using local
chrome-recorder --help

# Using npx
npx @cypress/chrome-recorder --help
```

### Usage

```sh
#
chrome-recorder ~/path/to/filename.json -o ./cypress/tests/ui
```

## Tips

### Show Recorder Tab

1. Customize and control Google Chrome
2. More Tools -> Developer Tools
3. Customize and control DevTools
4. More Tools -> Recorder
