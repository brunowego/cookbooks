# Playwright

## Links

- [Code Repository](https://github.com/microsoft/playwright)
- [Main Website](https://playwright.dev/)

## CLI

### Commands

```sh
npx playwright -h
```

### Installation

```sh
#
npx playwright install-deps

#
npx playwright install
```

#### NPM

```sh
npm install @playwright/test --save-dev
```

### Configuration

**Refer:** `./package.json`

```json
{
  "scripts": {
    // ...
    "test": "playwright test"
  }
}
```

```sh
cat << EOF > ./playwright.config.ts
import { PlaywrightTestConfig } from '@playwright/test'

const playwrightConfig: PlaywrightTestConfig = {
  testDir: './test',
  webServer: {
    // command: 'npm run dev',
    command: 'yarn dev',
    port: 3000,
    timeout: 30 * 1000,
    reuseExistingServer: !process.env.CI,
  },
  use: {
    baseURL: 'http://localhost:3000',
  },
}

export default playwrightConfig
EOF

#
mkdir -p ./test/pages

#
cat << EOF > ./test/pages/home.spec.ts
import { expect, test } from '@playwright/test'

test.describe('Home Page', () => {
  test('page should contains test texts', async ({ page }) => {
    await page.goto('/')

    const content = await page.content()

    expect(content).toContain('Hey, I\'m Bruno!')
  })
})
EOF
```
