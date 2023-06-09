# Vercel

<!--
https://vercel.com/analytics
https://vercel.com/edge
https://vercel.com/live
https://vercel.com/docs/concepts/deployments/checks
https://github.com/vercel/next-rsc-demo
https://github.com/vercel/nextjs-subscription-payments
https://edge-mug.vercel.app/edge
https://github.com/kovacsmarkakos/hacker-news-next
https://github.com/leerob/esm
https://epic-course-platform.vercel.app/
-->

## Links

- [Code Repository](https://github.com/vercel/vercel)
- [Main Website](https://vercel.com)
- [Edge Functions](https://vercel.com/features/edge-functions)
- [Previews](https://vercel.com/features/previews#checks)
- [Examples](https://github.com/vercel/examples)
- [Status Page](https://vercel-status.com)

## Docs

- [Limits](https://vercel.com/docs/concepts/limits/overview)
  - [Fair Use Policy](https://vercel.com/docs/concepts/limits/fair-use-policy)
- [Supported Frameworks on Vercel](https://vercel.com/docs/frameworks)

## Guides

- [Prevent Uploading Source Paths with .vercelignore on Vercel](https://vercel.com/guides/prevent-uploading-sourcepaths-with-vercelignore)
- [How do I use the "Ignored Build Step" field on Vercel?](https://vercel.com/support/articles/how-do-i-use-the-ignored-build-step-field-on-vercel)

## Terms

- AV1 Image File Format (AVIF)

## Middleware

- Authentication
- Bot Protection
- Redirects
- Browser Support
- Feature Flags
- A/B Testing
- Server-Site Analytics
- Logging

<!-- ##

- No Cold Boots
- Deploy Globally
- Support Streaming
-->

<!-- ##

- Server-Side Streaming
- React Server Components
-->

## CLI

### Installation

#### Homebrew

```sh
brew install vercel-cli
```

### Commands

```sh
# With NPX
npx vercel help

# With Local
vercel help
```

### Usage

```sh
#
vercel login
vercel switch

#
vercel whoami

#
vercel teams ls

# For new project
vercel init
# Or, older existing project
vercel link

#
vercel dev

#
vercel projects

#
vercel domains
vercel dns

#
vercel certs ls

#
vercel env ls
vercel env pull --environment development

#
vercel secrets ls

#
vercel deploy
vercel deploy --prod --no-clipboard

#
vercel ls

#
vercel inspect [url]

#
vercel logs [deploy-id]

#
vercel rm [deploy-id]

#
vercel billing ls

#
vercel logout
```

### Tips

<!-- #### Ignore Build Step

git diff --quiet HEAD^ HEAD ./ -->

#### Pull Local Environment Variables

```sh
vercel env pull ./.env.local
```

#### DNS

<!--
assets
signatures
-->

| Type    | Name | Value                   | TTL    |
| ------- | ---- | ----------------------- | ------ |
| `CNAME` |      | `cname.vercel-dns.com.` | 1 Hour |

#### Ignore Files

```sh
# For NPM
cat << EOF > ./.vercelignore
/*

!/public
!/src
!/next-env.d.ts
!/next.config.mjs
!/package*.json
!/postcss.config.js
!/tsconfig.json
EOF

# For Yarn
cat << EOF > ./.vercelignore
/*

!/public
!/src
!/next-env.d.ts
!/next.config.mjs
!/package.json
!/postcss.config.js
!/tsconfig.json
!/yarn.lock
EOF
```

### Issues

#### Defined Node.js Version

```log
Warning: Due to "engines": { "node": ">=14 <15" } in your `package.json` file, the Node.js Version defined in your Project Settings ("14.x") will not apply. Learn More: http://vercel.link/node-version
```

Just ignore.

#### Next.js Configuration Error

```log
> Build error occurred
TypeError: Cannot add property target, object is not extensible
    at Object.loadConfig [as default] (/vercel/path0/node_modules/next/dist/server/config.js:422:31)
    at async /vercel/path0/node_modules/next/dist/build/index.js:86:24
    at async Span.traceAsyncFn (/vercel/path0/node_modules/next/dist/trace/trace.js:74:20)
    at async Object.build [as default] (/vercel/path0/node_modules/next/dist/build/index.js:82:25)
```

Need to investigate the file `next.config.mjs`.

#### Missing Babel Config File

```log
Module not found: Can't resolve 'fs' in '/vercel/path0/node_modules/resolve-from'
Module not found: Can't resolve 'module' in '/vercel/path0/node_modules/resolve-from'
```

```sh
echo '!/.babelrc' >> ./.vercelignore
```

#### Missing ESLint Config File

```log
warn  - No ESLint configuration detected. Run next lint to begin setup
```

```sh
echo '!/.eslintrc.cjs' >> ./.vercelignore
```

<!--
"cleanUrls": true,
"trailingSlash": false,
"headers": [
  {
    "source": "/(.*)",
    "headers": [
      {
        "key": "Cache-Control",
        "value": "public, max-age=864000"
      }
    ]
  }
],
-->

<!--
    {
      "src": "/(.+)(woff|woff2)",
      "headers": { "cache-control": "public, max-age=31536000, immutable" }
    },
-->

<!--
    {
      "src": "/(.+)(ico|jpg|gif|png|svg|webp|css|js)",
      "headers": { "cache-control": "public, max-age=604800, immutable" }
    },

    { "handle": "filesystem" },
    { "src": "/(.*)", "status": 404, "dest": "/public/404.html" }
-->
