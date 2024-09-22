# Scaffold

<!--
benchmark / load-testing
-->

## References

- [Template to use TypeScript with k6](https://github.com/grafana/k6-template-typescript)

<!--
https://github.com/kis9a/k6_template

https://github.com/Unified-Learner-Passbook/benchmarks
https://github.com/alphagov/di-devplatform-performance
https://github.com/pagopa/io-payment-updater-load-test

https://github.com/ambarvm/url-shortener/blob/main/tests/k6/index.js
-->

## Installation

```sh
# Using pnpm
pnpm add @types/k6 typescript -D
```

## Configuration

**Refer:** `./package.json`

```json
{
  // ...
  "scripts": {
    // ...
    "test:load": "k6 run ./src/index.ts"
    // "test:load": "k6 run -o influxdb=http://127.0.0.1:8086/k6 ./src/index.ts"
  }
}
```

**Refer:** `./src/index.ts`

```ts
import http from 'k6/http'
import { check } from 'k6'

export const options = {
  scenarios: {
    simple: {
      executor: 'constant-vus',
      vus: 12,
      duration: '3m',
    },
  },
}

export default function () {
  const res = http.get('http://127.0.0.1:3000')

  check(res, {
    'status is 200': (r) => r.status === 200,
  })
}
```
