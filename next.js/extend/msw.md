# Mock Service Worker (MSW)

## Dependencies

- [Mock Service Worker (MSW)](/msw/README.md#library)

## Examples

- [Next.js + Mock Service Worker (MSW) with REST](https://github.com/brunowego/boilerplates/tree/nextjs-with-mswjs)

<!--
/**
 * @type { import('next').NextConfig }
 */
const nextConfig = {
  // webpack: (config, context) => {
  //   if (context.isServer) {
  //     if (Array.isArray(config.resolve.alias)) {
  //       config.resolve.alias.push({ name: 'msw/browser', alias: false })
  //     } else {
  //       config.resolve.alias['msw/browser'] = false
  //     }
  //   } else {
  //     if (Array.isArray(config.resolve.alias)) {
  //       config.resolve.alias.push({ name: 'msw/node', alias: false })
  //     } else {
  //       config.resolve.alias['msw/node'] = false
  //     }
  //   }

  //   return config
  // },

  webpack: (config, { isServer }) => {
    if (isServer) {
      config.resolve.alias = {
        ...config.resolve.alias,
        'msw/browser': false,
      }
    } else {
      config.resolve.alias = {
        ...config.resolve.alias,
        'msw/node': false,
      }
    }

    return config
  },
}

export default nextConfig
-->
