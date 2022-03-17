# Playwright

**Keywords:** End-to-End (E2E), Integration

## Alternatives

- [Selenium](/selenium/README.md)
- [Cypress](/cypress/README.md)

## Links

- [Code Repository](https://github.com/microsoft/playwright)
- [Main Website](https://playwright.dev/)

## Docs

- [Advanced](https://playwright.dev/docs/test-advanced)

## Library

### Installation

```sh
# Using NPM
npx playwright install-deps
npx playwright install
npm install @playwright/test --save-dev

# Using Yarn
yarn dlx playwright install-deps
yarn dlx playwright install
yarn add @playwright/test --dev
```

### Configuration

**Refer:** `./package.json`

```json
{
  "scripts": {
    // ...
    "test": "playwright test",
    "test:report": "playwright show-report ./test/report",
    // ...
  }
}
```

**Refer:** `./playwright.config.ts`

```ts
import { PlaywrightTestConfig } from '@playwright/test'
import path from 'path'

const playwrightConfig: PlaywrightTestConfig = {
  testDir: './test',
  webServer: {
    command: 'yarn dev',
    port: 3000,
    timeout: 30 * 1000,
    reuseExistingServer: !process.env.CI,
  },
  reporter: [['list'], ['html', { outputFolder: path.join(__dirname, 'test', 'report') }]],
  use: {
    baseURL: 'http://localhost:3000',
  },
}

export default playwrightConfig
```

```sh
#
echo '/test/report' >> ./.gitignore

#
mkdir -p ./test/e2e/api
```

**Refer:** `./test/e2e/api/health-check.spec.ts`

```ts
import { test, expect } from '@playwright/test'

test.describe('GET /api/health-check', () => {
  test('health-check should return 200', async ({ request }) => {
    const response = await request.get('/api/health-check')
    const result = await response.json()

    expect(response.status()).toBe(200)
    expect(result.status).toBe('OK')
  })
})
```

**Refer:** `./test/e2e/home.spec.ts`

```ts
import { expect, test } from '@playwright/test'

test.describe('Home Page', () => {
  test('page should contains test texts', async ({ page }) => {
    await page.goto('/')

    const content = await page.content()

    expect(content).toContain("Hey, I'm Bruno!")
  })
})
```

### Tips

#### Visual Studio Code

```sh
#
code --install-extension ms-playwright.playwright

#
jq '."recommendations" += ["ms-playwright.playwright"]' "$PWD/.vscode/extensions.json" | sponge "$PWD/.vscode/extensions.json"
```

## CLI

### Commands

```sh
# Using NPM
npx playwright -h

# Using Yarn
yarn dlx playwright -h
```

### Usage

```sh
#
yarn dlx playwright test ./test/e2e/api/health-check.spec.ts

#
./node_modules/.bin/playwright test ./test/e2e/api/health-check.spec.ts
```
