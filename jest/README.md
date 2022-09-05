# Jest

<!--
jest-sonar-reporter
-->

**Keywords:** Assertion Library, Unit Testing

<!--
https://github.com/correttojs/next-monorepo/tree/main/.jest

vscode-jest

"test": "jest",
"test:watch": "jest --watch",
"test:cov": "jest --coverage",
"test:debug": "node --inspect-brk -r tsconfig-paths/register -r ts-node/register node_modules/.bin/jest --runInBand",
"test:e2e": "jest --config ./test/jest-e2e.json"

"test": "yarn test:web && yarn test:wcl && yarn test:api",
"test:api": "jest -c jest.config.api.js",
"test:wcl": "jest -c jest.config.wcl.js",
"test:web": "jest -c jest.config.web.js",
-->

TODO

<!--
```sh
cat << EOF > ./jest.config.js
module.exports = {
  preset: 'ts-jest',
  testEnvironment: 'node',
}
EOF
```
-->

## Library

### Installation

```sh
# Using Yarn
yarn add @types/jest jest ts-jest --dev
```

<!--
ts-jest
eslint-plugin-jest
-->

### Configuration

**Refer:** `./package.json`

```json
{
  "scripts": {
    // ...
    "test": "jest",
    "test:watch": "jest --watch",
    "coverage": "jest --collect-coverage"
    // ...
  }
}
```

<!-- **Refer:** `./jest.config.ts`

```js
const nextJest = require("next/jest");

const createJestConfig = nextJest({
  dir: "./",
});

const customJestConfig = {
  setupFilesAfterEnv: ["<rootDir>/jest.setup.js"],
  moduleNameMapper: {
    "^@/components/(.*)$": "<rootDir>/src/components/$1",
    "^@/pages/(.*)$": "<rootDir>/src/pages/$1",
  },
  testEnvironment: "jest-environment-jsdom",
};

module.exports = createJestConfig(customJestConfig);
``` -->

**Refer:** `./jest.setup.ts`

```ts
import { server } from './src/mocks/server.js'

beforeAll(() => server.listen())

afterEach(() => server.resetHandlers())

afterAll(() => server.close())
```

### Extend With

#### Eslint

```sh
# Using NPM
npm install eslint-plugin-jest --save-dev

# Using Yarn
yarn add eslint-plugin-jest --dev
```

**Refer:** `./.eslintrc.cjs`

```cjs
/**
 * @type { import('@types/eslint').Linter.Config }
 */
const eslintRC = {
  plugins: [
    // ...
    'jest',
  ],
}

module.exports = eslintRC
```
