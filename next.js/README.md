# Next.js

<!--
const nextConfig = {
  swcMinify: true,
  i18n: { locales: ["ja"], defaultLocale: "ja" },
  images: {
    formats: ["image/avif", "image/webp"],
  },
}

NEXT_PUBLIC_MY_ENV
-->

## Links

- [Code Repository](https://github.com/vercel/next.js)
- [Main Website](https://nextjs.org/)
- [Awesome Next.js](https://github.com/unicodeveloper/awesome-nextjs)

## Utils

- [Boilerplate and Starter for Next JS 12+, Tailwind CSS 2.0 and TypeScript](https://github.com/ixartz/Next-js-Boilerplate)

## Guides

- [Start developing websites like it's 2025.](https://react2025.com/#course-overview)
- [Mastering Next.js](https://masteringnextjs.com/)
- [TypeScript](https://nextjs.org/docs/basic-features/typescript)
- [Environment Variables](https://nextjs.org/docs/basic-features/environment-variables)

## Configuration

- [Disabling x-powered-by](https://nextjs.org/docs/api-reference/next.config.js/disabling-x-powered-by)
- [Trailing Slash](https://nextjs.org/docs/api-reference/next.config.js/trailing-slash)
- [Setting a custom build directory](https://nextjs.org/docs/api-reference/next.config.js/setting-a-custom-build-directory)

## Books

- [Build a SaaS with React and Next.js](https://www.cutintothejamstack.com/)

## Technologies

<!-- - Client-Side Rendering (CSR) -->
- Incremental Static Regeneration (ISR)
- Server-Side Rendering (SSR)
- Static Site Generation (SSG)

<!--
Examples

https://github.com/bigint/party
https://github.com/cliid/cliid.dev
https://github.com/graphlatte/graphlatte
https://github.com/planetscale/nextjs-planetscale-starter
https://github.com/basetool-io/basetool
https://github.com/sentrei/sentrei
https://github.com/calendso/calendso/
https://github.com/Expensify/App
https://github.com/dwarvesf/nextjs-boilerplate
https://github.com/vercel/virtual-event-starter-kit
https://github.com/plutomi/plutomi
https://github.com/ljtechdotca/next-reddit
https://github.com/ioofy/App
https://github.com/axeldelafosse/expo-next-monorepo-example
https://github.com/diego3g/umbriel
https://umbriel-dashboard-three.vercel.app/
https://github.com/fdaciuk/conduit-api
https://github.com/waptik/vvu-fleet-management-system
https://github.com/nohsangwoo/instaclone-backend-v3
https://github.com/Rowan-Paul/project-argus
https://github.com/myriadsocial/myriad-web
https://github.com/email2vimalraj/food-pos-app
https://github.com/jackmerrill/snacc.chat
https://github.com/littleeagleio/littleeagle.io
https://github.com/tensight/tensight-app
-->

## CLI

### Commands

```sh
npx next -h
```

### Bootstrap

```sh
#
npx create-next-app@latest -h

#
npx create-next-app@latest \
  --ts \
  --use-npm \
  [app-name] && \
    "$_"

#
mkdir -p ./src/{components,hooks,layouts,lib,types,utils}

#
mv ./{pages,styles} ./src

# Git Ignore
cat << EOF > ./.gitignore
/.next
/node_modules
EOF
```

<!--
touch ./src/components/Page/index.tsx
touch ./src/components/Page/Header.tsx
touch ./src/components/Page/Footer.tsx
touch ./src/components/Button/index.tsx

touch ./src/pages/404.tsx
touch ./src/pages/__middleware.ts
touch ./src/pages/_document.tsx
-->

<!--
# ESLint Ignore
echo '/.next' >> ./.eslintignore
-->

<!--
cat << EOF >> ./.gitignore
.env.local
.env.development.local
.env.test.local
.env.production.local
EOF
-->

### Configuration

```sh
#
npx next telemetry status

#
npx next telemetry disable
```

### Usage

```sh
#
npx next dev -p 3000
# or
PORT=3000 npx next dev
# or
npm run dev

#
npx next lint

#
npx next build
```

### Tips

#### Clean Cache

```json
{
  "scripts": {
    "clean": "npx rimraf ./.next",
    "predev": "npm run clean",
    // ...
  }
}
```

#### Inspect

Install [cross-env](/cross-env.md)

```sh
#
sed -i "s/\(next dev\)/cross-env NODE_OPTIONS='--inspect' \1/g" ./package.json
```

#### Use EcmaScript Modules

```sh
#
mv ./next.config.js ./next.config.mjs

#
cat << EOF > ./next.config.mjs
/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
};

export default nextConfig;
EOF
```

#### Next.js Export

```sh
#
npx next export

#
echo '/out' >> ./.gitignore
```
