# Extend with BullMQ

<!--
https://medium.com/@asanka_l/integrating-bullmq-with-nextjs-typescript-f41cca347ef8
https://medium.com/@mofaddelzakaria/nextjs-with-bullmq-fc25aa7b8fe5
-->

<!--
https://github.com/search?q=path%3Aworkers+path%3A.worker.ts+content%3Abullmq&type=code
-->

<!--
https://github.com/unifralabs/scroll-explorer/blob/main/worker/index.ts
https://github.com/Abrax20/nextjs-trcp-typeorm-nx-boilerplate/blob/main/apps/agent/src/main.ts
https://github.com/paolodesa/next-tube/blob/main/next-tube-backend/transcoding-worker/src/index.ts
https://github.com/MykalMachon/cabin/blob/main/packages/workers/src/main.ts
-->

## Installation

```sh
#
pnpm add bullmq
```

## Configuration

**Refer:** `./next.config.mjs`

```mjs
/**
 * @type { import('next').NextConfig }
 */
const nextConfig = {
  // ...
  experimental: {
    // ...
    instrumentationHook: true,
  },
}

export default nextConfig
```

```sh
#
mkdir -p ./src/workers
```
