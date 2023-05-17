# Next.js Config

## Configuration

```sh
#
rm ./next.config.js

#
cat << EOF > ./next.config.mjs
/**
 * @type { import('next').NextConfig }
 */
const nextConfig = {
  reactStrictMode: true,
  swcMinify: true,
}

export default nextConfig
EOF
```

## Tips

### Server Running Config

**Refer:** `./next.config.mjs`

```mjs
/**
 * @type { import('next').NextConfig }
 */
const nextConfig = {
  // ...
  serverRuntimeConfig: {
    apiURL: process.env.API_URL ?? 'http://127.0.0.1:3001',
  },
  // publicRuntimeConfig: {
  //   apiURL: process.env.API_URL ?? 'http://127.0.0.1:3001',
  // },
}
```

**Refer:** `./src/pages/*.tsx`

```tsx
// ...
import nextConfig from 'next/config'

// ...
const { apiURL } = nextConfig().serverRuntimeConfig
// const { apiURL } = nextConfig().publicRuntimeConfig
```
