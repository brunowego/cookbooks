# Cypress Tooling Code Coverage

## Links

- [Guides](https://docs.cypress.io/guides/tooling/code-coverage)

## Installation

```sh
# Using NPM
npm install @cypress/code-coverage --save-dev

# Using Yarn
yarn add @cypress/code-coverage --dev
```

## Configuration

**Refer:** `./.cypress/plugins/index.ts`

```ts
import task from '@cypress/code-coverage/task'

export default ((on, config) => {
  task(on, config)

  return config
}) as Cypress.PluginConfig
```

**Refer:** `./.cypress/support/index.ts`

```ts
import '@cypress/code-coverage/support'
```

**Refer:** `./.cypress/global.d.ts`

```ts
declare module '@cypress/code-coverage/task' {
  const task: Cypress.PluginConfig

  export = task
}
```

```sh
#
cat << EOF >> ./.gitignore
/.nyc_output
/coverage
EOF
```

<!--
open ./coverage/lcov-report/index.html
-->

<!--
"cy:open": "cypress open",
"cy:run": "cypress run",
"test:e2e": "start-server-and-test dev 3000 'cy:open'",
"test:e2e:run": "start-server-and-test dev 3000 'cy:run'"
-->
