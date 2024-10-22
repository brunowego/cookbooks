# Extend with BullMQ

<!--
https://github.com/oliverilp/tailkeep?tab=readme-ov-file
https://github.com/jmiralles/dev-remote-jobs
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
