# Playwright

<!--
https://github.com/allmycal/allmycal.com/tree/main/apps/web/playwright

https://chromewebstore.google.com/detail/playwright-crx/jambeljnbnfbkcpnoiaedcabbgmnnlcd

https://github.com/trpc/examples-next-prisma-starter/blob/main/playwright/smoke.test.ts
-->

**Keywords:** UI Testing, E2E Testing

## Links

- [Code Repository](https://github.com/microsoft/playwright)
- [Main Website](https://playwright.dev)
- [Docs](https://playwright.dev/docs)
  - [Intro](https://playwright.dev/docs/intro)
  - [Advanced](https://playwright.dev/docs/test-advanced)

## Library

### Dependencies

```sh
# Using NPM
npx playwright install-deps
npx playwright install
# or
npx playwright install --with-deps
```

### Installation

```sh
# Using NPM
npm install @playwright/test --save-dev

# Using Yarn
yarn add @playwright/test --dev

# Using pnpm
pnpm add @playwright/test -D
```

### Configuration

**Refer:** `./package.json`

```json
{
  "scripts": {
    // ...
    "test:e2e": "playwright test",
    "test:e2e:ui": "playwright test --ui",
    "test:e2e:report": "playwright show-report"
    // ...
  }
}
```

**Refer:** `./playwright.config.ts`

```ts
import { join } from 'path'
import { defineConfig, devices } from '@playwright/test'

export const STORAGE_STATE_PATH = join(__dirname, 'playwright/.auth/user.json')

export default defineConfig({
  // globalSetup: './global-setup',
  testDir: './test/e2e',
  testMatch: /.*\.e2e-spec\.ts$/,
  fullyParallel: true,
  forbidOnly: !!process.env.CI,
  retries: process.env.CI ? 2 : 0,
  workers: process.env.CI ? 1 : undefined,
  reporter: 'html',
  use: {
    trace: 'on-first-retry',
    baseURL: 'http://localhost:3333',
  },
  projects: [
    {
      name: 'setup',
      testMatch: '**/*.setup.ts',
    },
    {
      name: 'chromium',
      use: {
        ...devices['Desktop Chrome'],
        // storageState: STORAGE_STATE_PATH,
      },
      // dependencies: ['setup']
    },
  ],
  webServer: {
    command: 'npm run dev -- --port 3333',
    port: 3333,
    reuseExistingServer: !process.env.CI,
  },
})
```

```sh
#
echo '/playwright-report' >> ./.gitignore

#
mkdir -p ./test/e2e/api
```

**Refer:** `./test/e2e/api/health-check.e2e-spec.ts`

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

**Refer:** `./test/e2e/home.e2e-spec.ts`

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
jq '."recommendations" += ["ms-playwright.playwright"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

## CLI

### Commands

```sh
# Using NPM
npx playwright -h

# Using Yarn
yarn dlx playwright -h

# Using pmpm
pnpm dlx playwright -h
```

### Usage

```sh
#
npm init playwright@latest

#
playwright test ./test/e2e/api/health-check.e2e-spec.ts
```

<!--
"install-browsers": "pnpm dlx playwright@1.31.0 install --with-deps",
"e2e": "pnpm install-browsers && pnpm dlx playwright@1.31.0 test"

"test:e2e": "playwright test",
"test:e2e:report": "playwright show-report",
"test:e2e:ui": "playwright test --ui"

#
npx playwright test
npx playwright test --ui
npx playwright show-report
-->
