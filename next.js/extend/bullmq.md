# Extend with BullMQ

<!--
https://github.com/dhruvb26/bluecast.ai/tree/main/src/server/bull

https://github.com/JoosepAlviste/serieslist/blob/master/apps/jobs/src/seriesSync.job.ts

https://github.com/oliverilp/tailkeep
https://github.com/jmiralles/dev-remote-jobs
https://github.com/huksley/bullmq-nextjs
https://github.com/nurulislamrimon/queue_service_in_nextjs
https://github.com/harsh07may/yeet-code
-->

## Dependencies

- [BullMQ](/bullmq/README.md)

## Configuration

**Refer:** `./next.config.mjs`

```mjs
/**
 * @type { import('next').NextConfig }
 */
const nextConfig = {
  // ...

  experimental: {
    instrumentationHook: true,
  },
}

export default nextConfig
```

<!-- ```sh
#
mkdir -p ./src/workers
``` -->
