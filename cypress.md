# Cypress

<!--
https://linkedin.com/learning/end-to-end-javascript-testing-with-cypress-io/test-automation-with-javascript
https://app.pluralsight.com/library/courses/cypress-end-to-end-javascript-testing/table-of-contents
https://app.pluralsight.com/library/courses/vue-cypress-end-to-end-testing/table-of-contents

https://app.pluralsight.com/library/courses/js-friends-session-02/table-of-contents
https://app.pluralsight.com/library/courses/codemash-session-01/table-of-contents
-->

## Alternatives

- [Selenium](/selenium/README.md)

## CLI

### Installation

#### NPM

```sh
npm install cypress -g
```

### Commands

```sh
cypress -h
```

### Structure

<!--
https://github.com/ismay/superwolff/tree/main/.cypress/integration
https://github.com/ismay/superwolff/blob/main/.cypress/support
-->

```sh
#
mkdir -p ./.cypress
mkdir -p ./.cypress/integration
mkdir -p ./.cypress/support

#
cat << EOF > ./.cypress/cypress.json
{
  "baseUrl": "http://localhost:3000",
  "fixturesFolder": false,
  "integrationFolder": ".cypress/integration",
  "pluginsFile": false,
  "supportFile": ".cypress/support/index.js",
  "video": false
}
EOF
```

### Usage

```sh
#
cypress verify

#
cypress open

#
cypress run
cypress run --record
cypress run --headed
cypress run --browser chrome
cypress run --browser firefox
```
