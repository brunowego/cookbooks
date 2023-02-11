# Jest with Mock

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

<!-- **Refer:** `./jest.setup.ts`

```ts
import { server } from './src/mocks/server.js'

beforeAll(() => server.listen())

afterEach(() => server.resetHandlers())

afterAll(() => server.close())
``` -->
