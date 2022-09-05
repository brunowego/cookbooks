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
