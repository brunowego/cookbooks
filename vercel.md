# Vercel

<!--
https://github.com/temporalio/temporaldotio/blob/main/vercel.json

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
- [Status Page](https://vercel-status.com/)

## Guides

- [Limits](https://vercel.com/docs/concepts/limits/overview)
- [Fair Use Policy](https://vercel.com/docs/concepts/limits/fair-use-policy)
- [Prevent Uploading Source Paths with .vercelignore on Vercel](https://vercel.com/guides/prevent-uploading-sourcepaths-with-vercelignore)

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

### Commands

```sh
npx vercel help
```

### Usage

```sh
#
npx vercel login
npx vercel switch
npx vercel logout

#
npx vercel whoami

#
npx vercel teams ls

# For new project
npx vercel init
# Or, older existing project
npx vercel link

#
npx vercel dev

#
npx vercel projects

#
npx vercel domains
npx vercel dns

#
npx vercel certs ls

#
npx vercel env ls

#
npx vercel secrets ls

#
npx vercel deploy
npx vercel deploy --prod --no-clipboard

#
npx vercel ls

#
npx vercel inspect [url]

#
npx vercel logs [deploy-id]

#
npx vercel rm [deploy-id]

#
npx vercel billing ls
```

### Tips

#### DNS

<!--
assets
signatures
-->

`CNAME` to `cname.vercel-dns.com.`.

#### Basic Configuration

**Refer:** `./vercel.json`

```json
{
  "cleanUrls": true
}
```

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

#### Vercel Routes

**Refer:** `./vercel.json`

```json
{
  // ...
  "routes": [
    {
      "src": "/(.*)",
      "dest": "/"
    }
  ]
}
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
echo '!/.eslintrc.json' >> ./.vercelignore
```
