# Cypress

<!--
https://github.com/samisbakedham/interface/tree/main/cypress

https://linkedin.com/learning/end-to-end-javascript-testing-with-cypress-io/test-automation-with-javascript
https://app.pluralsight.com/library/courses/cypress-end-to-end-javascript-testing/table-of-contents
https://app.pluralsight.com/library/courses/vue-cypress-end-to-end-testing/table-of-contents

https://app.pluralsight.com/library/courses/js-friends-session-02/table-of-contents
https://app.pluralsight.com/library/courses/codemash-session-01/table-of-contents
-->

## Alternatives

- [Selenium](/selenium/README.md)

## Library

### Installation

```sh
# Using NPM
npm install cypress --save-dev

# Using Yarn
yarn add cypress --dev
```

### Structure

```sh
#
mkdir -p ./.cypress/fixtures,integration/{components,pages},plugins,support}

#
echo '/.cypress/artifacts' >> ./.gitignore

#
echo '!/.cypress' >> ./.eslintignore
```

**Refer:** `./.cypress/integration/pages/main.spec.ts`

```ts
context('Main Page', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it('should render the main page', () => {
    cy.get('h1').contains('Hello, world!')
  })
})

export {}
```

**Refer:** `./cypress.json`

```json
{
  "baseUrl": "http://localhost:3000",
  "fixturesFolder": "./.cypress/fixtures",
  "integrationFolder": "./.cypress/integration",
  "pluginsFile": "./.cypress/plugins/index.ts",
  "screenshotsFolder": "./.cypress/artifacts/screenshots",
  "videosFolder": "./.cypress/artifacts/videos",
  "supportFile": "./.cypress/support/index.ts"
}
```

**Refer:** `./.cypress/plugins/index.ts`

```ts
export default ((on, config) => {
  return config
}) as Cypress.PluginConfig
```

**Refer:** `./.cypress/support/index.ts`

```ts
export {}
```

**Refer:** `./.cypress/tsconfig.json`

```json
{
  // "extends": "../tsconfig.base",
  "compilerOptions": {
    "target": "es5",
    "lib": ["es5", "dom"],
    "types": ["cypress"]
  },
  "include": ["./src/**/*.ts"]
}
```

**Refer:** `./package.json`

```json
{
  "scripts": {
    // ...
    "cy:run": "cypress run",
    "cy:open": "cypress open"
  }
}
```

```sh
#
yarn cy:install
yarn cy:run
yarn cy:open
```

## CLI

### Commands

```sh
npx cypress -h
```

### Usage

```sh
#
npx cypress verify

#
npx cypress install

#
npx cypress run
npx cypress run --record
npx cypress run --headed
npx cypress run --browser chrome
npx cypress run --browser firefox

#
npx cypress open
```
