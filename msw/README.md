# Mock Service Worker (MSW)

<!--
https://github.com/search?o=desc&q=filename%3Apackage.json+%22next%22+%22msw%22+%22typescript%22+path%3Aapps&s=indexed&type=Code
-->

**Keywords:** Mocking

## Links

- [Code Repository](https://github.com/mswjs/msw)
- [Main Website](https://mswjs.io)
- [Examples](https://github.com/mswjs/examples/tree/main/examples)
- [FAQ](https://mswjs.io/docs/faq)

## Guides

- [Mocking REST API](https://mswjs.io/docs/getting-started/mocks/rest-api)

## Examples

- [With Next.js](/next.js/extend/msw.md#examples)

## Library

### Installation

```sh
# Using NPM
npm install msw --save-dev

# Using Yarn
yarn add msw --dev

# Using pnpm
pnpm add msw -D
```

### Configuration

**Refer:** `./.eslintrc.cjs`

```cjs
/**
 * @type { import('eslint').Linter.Config }
 */
const eslintRC = {
  // ...
  ignorePatterns: ['mockServiceWorker.js'],
}

module.exports = eslintRC
```

**Refer:** `./package.json`

```json
{
  // ...
  "msw": {
    "workerDirectory": "public"
  }
}
```

**Refer:** `./src/mocks/index.ts`

```ts
'use client'

import type { SetupWorkerApi } from 'msw/browser'
import type { SetupServerApi } from 'msw/node'

if (typeof window === 'undefined') {
  const server: SetupServerApi = require('./server').server

  server.listen({ onUnhandledRequest: 'bypass' })
} else {
  const worker: SetupWorkerApi = require('./worker').worker

  worker.start({ onUnhandledRequest: 'bypass' })
}
```

**Refer:** `./src/mocks/server.ts`

```ts
import { setupServer } from 'msw/node'

import { handlers } from './handlers'

export const server = setupServer(...handlers)
```

**Refer:** `./src/mocks/worker.ts`

```ts
import { setupWorker } from 'msw/browser'

import { handlers } from './handlers'

export const worker = setupWorker(...handlers)
```

### Usage

```sh
#
./node_modules/.bin/msw init ./public
```

### Issues

#### TBD

```log
devUtils.mjs:13 [MSW] Warning: intercepted a request without a matching request handler:

  • GET chrome-extension://gppongmhjkpfnbhagpmjfkannfbllamg/js/js.js

If you still wish to intercept this unhandled request, please create a request handler for it.
Read more: https://mswjs.io/docs/getting-started/mocks
```

Add `{ onUnhandledRequest: 'bypass' }` to `server.listen` and `worker.start`.

**Refer:** `./src/mocks/index.ts`

```ts
// ..

if (typeof window === 'undefined') {
  // ...
  server.listen({ onUnhandledRequest: 'bypass' })
} else {
  // ...
  worker.start({ onUnhandledRequest: 'bypass' })
}
```

## CLI

### Commands

```sh
#
npx msw -h

#
yarn dlx msw -h

#
pnpm dlx msw -h
```

### Usage

```sh
#
npx msw init ./public --save
```
