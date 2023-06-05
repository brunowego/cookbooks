# Scaffold

## Installation

```sh
# Using pnpm
pnpm install cypress -D
```

## Configuration

```sh
#
mkdir -p ./.cypress/{fixtures,integration/{components,pages},plugins,support}

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
  // ...
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
