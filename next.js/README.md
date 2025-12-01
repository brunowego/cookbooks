# Next.js

<!--
systemd-run --user --scope -p MemoryMax=4000M pnpm dev
-->

<!--
export const revalidate = 1
export const revalidate = 60 * 15 // 15 minutes
-->

<!--
https://blog.logrocket.com/next-js-13-new-app-directory/

https://github.com/starknet-io/starknet-website/tree/dev/src/app
https://github.com/MR-Addict/playground/tree/main/src/app
https://github.com/Mathstarget/Mathstarget.github.io/tree/main/src/app
-->

<!--
https://github.com/makeplane/plane
-->

<!--
https://github.com/search?q=path%3Apackage.json+path%3Aapps+content%3Anext+content%3Atailwindcss&type=repositories&s=updated&o=desc
-->

<!--
https://github.com/t3-oss/create-t3-app

const nextConfig = {
  swcMinify: true,
  i18n: { locales: ["ja"], defaultLocale: "ja" },
  images: {
    formats: ["image/avif", "image/webp"],
  },
}
-->

**Keywords:** Full-featured React framework

## Links

- [Code Repository](https://github.com/vercel/next.js)
- [Main Website](https://nextjs.org)
- [Awesome Next.js](https://github.com/unicodeveloper/awesome-nextjs)

## Utils

- [Boilerplate and Starter for Next JS 12+, Tailwind CSS 2.0 and TypeScript](https://github.com/ixartz/Next-js-Boilerplate)

## Guides

- [Testing](https://nextjs.org/docs/testing)
- [Start developing websites like it's 2025.](https://react2025.com/#course-overview)
- [Mastering Next.js](https://masteringnextjs.com)
- [TypeScript](https://nextjs.org/docs/basic-features/typescript)
- [Environment Variables](https://nextjs.org/docs/basic-features/environment-variables)
- [Measuring performance](https://nextjs.org/docs/advanced-features/measuring-performance)

## Configuration

- [Disabling x-powered-by](https://nextjs.org/docs/api-reference/next.config.js/disabling-x-powered-by)
- [Trailing Slash](https://nextjs.org/docs/api-reference/next.config.js/trailing-slash)
- [Setting a custom build directory](https://nextjs.org/docs/api-reference/next.config.js/setting-a-custom-build-directory)

## Books

- [Build a SaaS with React and Next.js](https://www.cutintothejamstack.com)

## Videos

- [Nest JS Backend API | Full Developer Course By Voxmind](https://youtube.com/watch?v=KkKiSN_yzdI) (9:30 hours)

## Technologies

<!-- - Client-Side Rendering (CSR) -->

- Incremental Static Regeneration (ISR)
- React Server Components (RSC)
- Server-Side Rendering (SSR)
- Static Site Generation (SSG)

## Start Kit

- [StartKit](https://startkit.dev) <!-- https://github.com/startkit-dev/next -->

## CLI

### Commands

```sh
npx next -h
```

### Configuration

```sh
#
npx next telemetry status

#
npx next telemetry disable
```

### Bootstrap

- [Create Next App](/next.js/create-next-app.md)

### Usage

```sh
#
npm run dev
# or
npx next dev -p 3000
# or
PORT=3000 npx next dev
# or
npx next dev -p ${PORT:-3000}

#
npx next lint

#
npx next buld
```

### Tips

#### Telemetry

<!--
https://nextjs.org/telemetry
-->

```sh
#
next telemetry status

#
next telemetry disable

#
next telemetry enable

#
export NEXT_TELEMETRY_DISABLED=1
```

#### VS Code Files Exclude

```sh
jq '."search.exclude"."**/.next" |= true' "$PWD"/.vscode/settings.json | sponge "$PWD"/.vscode/settings.json
```

#### Move `.next` to Trash

**Dependencies:** [trash](/trash.md)

```sh
#
find . -name '.next' -type d -prune | xargs du -chs

#
find . -name '.next' -type d -prune -exec rm -fR '{}' +
```

#### Debug

**Refer:** `./next.config.mjs`

```mjs
/**
 * @type { import('next').NextConfig }
 */
const nextConfig = {
  // ...
  webpack: (config) => {
    config.infrastructureLogging = {
      debug: /PackFileCache/,
    }

    return config
  },
}

export default nextConfig
```

#### Turn Off Logging

**Refer:** `./next.config.mjs`

```mjs
/**
 * @type { import('next').NextConfig }
 */
const nextConfig = {
  // ...
  webpack: (config) => {
    config.infrastructureLogging = {
      level: 'error',
    }

    return config
  },
}

export default nextConfig
```

#### Clean Cache

```json
{
  "scripts": {
    // "clean": "npx rimraf ./.next",
    "clean": "yarn dlx rimraf ./.next",
    "predev": "npm run clean"
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

<!--
chrome://inspect
-->

#### Next.js Export

```sh
#
npx next export

#
echo '/out' >> ./.gitignore
```

### Issues

#### TBD

```log
A tree hydrated but some attributes of the server rendered HTML didn't match the client properties. This won't be patched up. This can happen if a SSR-ed Client Component used:
```

TODO

#### TBD

```log
⨯ useSearchParams() should be wrapped in a suspense boundary at page "/users". Read more: https://nextjs.org/docs/messages/missing-suspense-with-csr-bailout
```

```tsx
import { Suspense } from 'react'

// ...
;<Suspense>// ...</Suspense>
```

#### TBD

```log
@acme/web:dev: Module parse failed: Unexpected token (1:10)
@acme/web:dev: You may need an appropriate loader to handle this file type, currently no loaders are configured to process this file. See https://webpack.js.org/concepts#loaders
@acme/web:dev: Attempted import error: '(.+?)' is not exported from '(.+?)'.
```

```ts
import type { NextConfig } from 'next'

const nextConfig: NextConfig = {
  // ...

  // Remove this section
  webpack: (config) => {
    config.externals = {
      knex: 'commonjs knex',
    }

    return config
  },
}

// ...
```

#### TBD

```log
No default component was found for a parallel route rendered on this page. Falling back to nearest NotFound boundary.
```

<!--
https://github.com/vercel/next.js/issues/73119
-->

TODO

#### TBD

```log
POST /__nextjs_original-stack-frames
```

<!--
https://github.com/vercel/next.js/discussions/63092

https://stackoverflow.com/questions/79348298/next-js-404-errors-for-nextjs-original-stack-frame-on-page-load
-->

TODO

#### Mismatch with Server External Packages

```log
@acme/app:dev: Package import-in-the-middle can't be external
@acme/app:dev: The request import-in-the-middle matches serverExternalPackages (or the default list).
@acme/app:dev: The request could not be resolved by Node.js from the project directory.
@acme/app:dev: Packages that should be external need to be installed in the project directory, so they can be resolved from the output files.
@acme/app:dev: Try to install it into the project directory by running npm install import-in-the-middle from the project directory.
```

**Refer:** `./.npmrc`

```npmrc
public-hoist-pattern[]=*import-in-the-middle*
```

**Refer:** `./next.config.ts`

```ts
// ...
const nextConfig: NextConfig = {
  // ...
  serverExternalPackages: ['import-in-the-middle'],
}
// ...
```

#### TBD

```log
@acme/app:dev:  ⚠ Webpack is configured while Turbopack is not, which may cause problems.
@acme/app:dev:  ⚠ See instructions if you need to configure Turbopack:
@acme/app:dev:   https://nextjs.org/docs/app/api-reference/next-config-js/turbo
```

**Refer:** `./next.config.ts`

```ts
// ...
```

#### TBD

```log
Module not found: Can't resolve 'critters'
```

<!--
https://github.com/vercel/next.js/issues/34763
https://github.com/getsentry/profiling-node/issues/170
-->

```sh
pnpm add critters -D
```

#### TBD

```log
<w> [webpack.cache.PackFileCacheStrategy] Serializing big strings (3706kiB) impacts deserialization performance (consider using Buffer instead and decode when needed)
```

TODO

#### TBD

```log
Fetch API cannot load webpack-internal:///node_modules/<...>/next/dist/client/app-index.js. URL scheme "webpack-internal" is not supported.
```

<!--
https://github.com/vercel/next.js/issues/32432
-->

TODO

#### Compound Component Pattern in Server Component

```log
Error: Could not find the module "/path/to/packages/ui/src/components/accordion.tsx#default#Item" in the React Client Manifest. This is probably a bug in the React Server Components bundler.
```

<!--
https://help.mantine.dev/q/server-components#error-compound-components-in-server-component

https://github.com/vercel/next.js/issues/44030
https://github.com/vercel/next.js/issues/50243
https://github.com/vercel/next.js/issues/58776

https://medium.com/@fdikmen/fixing-could-not-find-the-module-error-in-nextjs-with-ant-design-3ae2cfe0160d
-->

TODO

#### TBD

```log
@acme/landing:build:   WARN    2024-08-08 23:50:51.682146011 +00:00 Failed to load .env file: Error parsing line: 'Acme <noreply@example.com>', error at line index: 8
```

**Refer:** `./.env`

```env
# Put quotes around the value
SMTP_FROM='Acme <noreply@example.com>'
```

#### TBD

```log
Generating static pages (0/12)  [=   ]Static generation failed due to dynamic usage on /sign-in, reason: headers
```

<!--
https://nextjs.org/docs/messages/app-static-to-dynamic-error

try: next build -d
-->

**Refer:** `./src/app/layout.tsx`

```ts
// ...
export const dynamic = 'force-static'
// ...
```

#### TBD

```log
TypeError: Cannot convert object to primitive value
```

TODO

#### TBD

```log
Error: Missed `structure` field in `String` node type definition
```

<!--
https://github.com/orgs/vercel/discussions/4264
-->

TODO

#### Missing Use Client

```log
Error: (0 , react__WEBPACK_IMPORTED_MODULE_0__.createContext) is not a function
```

Missing `'use client'` in a internal component.

#### Missing Metadata Base URL

```log
⚠ metadata.metadataBase is not set for resolving social open graph or twitter images, using "http://localhost:8000". See https://nextjs.org/docs/app/api-reference/functions/generate-metadata#metadatabase
```

<!--
https://github.com/vercel/next.js/discussions/57251
-->

**Refer:** `./src/app/layout.tsx`

```ts
export const metadata: Metadata = {
  metadataBase: new URL(process.env.NEXT_PUBLIC_BASE_URL || 'http://localhost:3000'),
  ...
}
```

#### TBD

```log
Server is approaching the used memory threshold, restarting...
```

TODO

#### TBD

```log
Type error: Page "src/app/app/studio/[pageId]/components/page.tsx" has an invalid "default" export:
  Type "PageProps" is not valid.
```

<!--
Page is a reserved name
-->

TODO

#### Browser Extension Issue

```log
Warning: Extra attributes from the server: data-atm-ext-installed
```

Normally caused by a Browser Extension.

#### Link Inside Link

```log
Error: Hydration failed because the initial UI does not match what was rendered on the server.
Warning: Expected server HTML to contain a matching <div> in <a>.
```

Have a link `<a />` inside link `<a />`.

#### Incompatibility with PNPM, Turborepo and Standalone

```log
node:internal/modules/cjs/loader:998
  throw err;
  ^

Error: Cannot find module '/app/server.js'
    at Module._resolveFilename (node:internal/modules/cjs/loader:995:15)
    at Module._load (node:internal/modules/cjs/loader:841:27)
    at Function.executeUserEntryPoint [as runMain] (node:internal/modules/run_main:81:12)
    at node:internal/main/run_main_module:23:47 {
  code: 'MODULE_NOT_FOUND',
  requireStack: []
}

Node.js v18.11.0
```

<!--
https://github.com/vercel/next.js/issues/48017
-->

Rollback to Next.js version 13.1.1.

#### TBD

```log
Your tsconfig.json extends another configuration, which means we cannot add the Next.js TypeScript plugin automatically. To improve your development experience, we recommend adding the Next.js plugin (`"plugins": [{ "name": "next" }]`) manually to your TypeScript configuration. Learn more: https://beta.nextjs.org/docs/configuring/typescript#using-the-typescript-plugin
```

TODO

#### Missing Next.js

```log
0:0  high  Parsing error: Cannot find module 'next/babel' ↵ Require stack: ↵
```

```sh
pnpm add next -D --filter eslint-config-custom
```

#### TBD

```log
Error: Image is missing required "src" property. Make sure you pass "src" in props to the `next/image` component. Received: {}
```

TODO

#### TBD

```log
TypeError: Cannot read properties of undefined (reading 'call')
```

<!--
https://github.com/webpack/webpack-dev-server/issues/3869

config.optimization = {
  ...config.optimization,
  runtimeChunk: false,
  splitChunks: false,
}
-->

TODO

#### TBD

```log
API resolved without sending a response for /api/v1/posts, this may result in stalled requests.
```

TODO

#### TBD

```log
Do not add <script> tags using next/head (see inline <script>). Use next/script instead.
See more info here: https://nextjs.org/docs/messages/no-script-tags-in-head-component
```

TODO

#### Mismatch Sharp

```log
Warning: For production Image Optimization with Next.js, the optional 'sharp' package is strongly recommended. Run 'yarn add sharp', and Next.js will use it automatically for Image Optimization.
Read more: https://nextjs.org/docs/messages/sharp-missing-in-production
```

```sh
# Using NPM
npm install sharp --save

# Using Yarn
yarn add sharp
```

#### Mismatch with Resolve

```log
TypeError: Cannot read property 'uid' of undefined
```

```sh
# Using NPM
npm install resolve@1.20.0 --save-dev

# Using Yarn
yarn add resolve@1.20.0 --dev
```

**Refer:** `./package.json`

```json
{
  // ...
  "resolutions": {
    "resolve": "1.20.0"
  }
}
```

#### Mismatch with Next.js Global Installation

```log
Error occurred prerendering page "/404". Read more: https://nextjs.org/docs/messages/prerender-error
Error: Minified React error #321; visit https://reactjs.org/docs/error-decoder.html?invariant=321 for the full message or use the non-minified dev environment for full errors and additional helpful warnings.
```

```sh
#
readlink -f "$(which next)"

#
npm uninstall next -g
```

#### TBD

```log
The target environment doesn't support dynamic import() syntax so it's not possible to use external type 'module' within a script
```

TODO

#### TBD

```log
error - unhandledRejection: TypeError: res.once is not a function
```

TODO

#### TBD

```log
Slow filesystem detected. If /absolute/path/to/project/.next is a network drive, consider moving it to a local folder. If you have an antivirus enabled, consider excluding your project directory.
```

<!--
https://stackoverflow.com/questions/79196674/why-i-am-getting-slow-file-system-detected-error-in-my-next-js-15-project
-->

TODO

#### TBD

```log
Uncaught Error: invariant expected app router to be mounted
```

TODO

#### TBD

```log
http://localhost:3000/__nextjs_original-stack-frame?isServer=false&isEdgeServer=false&isAppDirectory=true&errorMessage=TypeError%3A+organizations.find+is+not+a+function&file=webpack-internal%3A%2F%2F%2F%28app-pages-browser%29%2F.%2Fnode_modules%2F.pnpm%2Fnext%4014.1.2_%40babel%2Bcore%407.26.0_%40opentelemetry%2Bapi%401.9.0_react-dom%4018.2.0_react%4018.2.0__react%4018.2.0%2Fnode_modules%2Fnext%2Fdist%2Fcompiled%2Freact-dom%2Fcjs%2Freact-dom.development.js&methodName=invokeGuardedCallback&arguments=&lineNumber=20622&column=29
```

<!--
https://stackoverflow.com/questions/79348298/next-js-404-errors-for-nextjs-original-stack-frame-on-page-load
https://github.com/vercel/next.js/discussions/63092
-->

TODO

#### TBD

```log
@acme/app:start:  ⨯ Error: Module 18655 was instantiated because it was required from module 827968, but the module factory is not available.
@acme/app:start:     at instantiateModule (.next/server/chunks/ssr/[turbopack]_runtime.js:707:15)
@acme/app:start:     at getOrInstantiateModuleFromParent (.next/server/chunks/ssr/[turbopack]_runtime.js:738:12)
@acme/app:start:     at Context.esmImport [as i] (.next/server/chunks/ssr/[turbopack]_runtime.js:228:20)
@acme/app:start:     at module evaluation (.next/server/chunks/ssr/_3295a836._.js:1:628359)
@acme/app:start:     at instantiateModule (.next/server/chunks/ssr/[turbopack]_runtime.js:715:9)
@acme/app:start:     at getOrInstantiateModuleFromParent (.next/server/chunks/ssr/[turbopack]_runtime.js:738:12)
@acme/app:start:     at Context.commonJsRequire [as r] (.next/server/chunks/ssr/[turbopack]_runtime.js:249:12) {
@acme/app:start:   digest: '1161697321'
@acme/app:start: }
```

<!--
https://x.com/ozgrozer/status/1980896874686300291
-->

<!--
Rollback to Next.js version 15.x.
-->

TODO

#### TBD

```log
@acme/app:dev: Missing required default.js file for parallel route at /(auth)/@actions
@acme/app:dev: The parallel route slot "@actions" is missing a default.js file. When using parallel routes, each slot must have a default.js file to serve as a fallback.
@acme/app:dev: Create a default.js file at: /(auth)/@actions/default.js
@acme/app:dev:
@acme/app:dev: https://nextjs.org/docs/messages/slot-missing-default
```

TODO
