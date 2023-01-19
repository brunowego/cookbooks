# next-sitemap

## Links

- [Code Repository](https://github.com/iamvishnusankar/next-sitemap)

## Installation

```sh
# Using NPM
npm install next-sitemap --save-dev

# Using Yarn
yarn add next-sitemap --dev
```

## Configuration

**Refer:** `./next-sitemap.config.cjs`

```ts
/**
 * @type { import('next-sitemap').IConfig }
 */
const NextSitemapConfig = {
  siteUrl: process.env.NEXT_PUBLIC_SITE_URL,
  generateRobotsTxt: true,
}

module.exports = NextSitemapConfig
```

**Refer:** `./package.json`

```json
{
  "scripts": {
    // ...
    // "build": "next build && npm build:sitemap",
    "build": "next build && yarn build:sitemap",
    "build:sitemap": "next-sitemap --config ./next-sitemap.config.cjs"
  }
}
```

```sh
#
echo 'NEXT_PUBLIC_SITE_URL=https://domain.tld' >> ./.env

#
cat << EOF >> ./.gitignore
/public/robots.txt
/public/sitemap*.xml
EOF

#
npm run build
#
yarn build
```
