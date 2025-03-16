# Vercel Flags

<!--
https://github.com/search?q=repo%3ABart3kL%2Fnextjs-flags%20precomputeFlags&type=code
-->

<!--
https://github.com/phonofidelic/website/blob/main/src/app/.well-known/vercel/flags/route.ts
https://github.com/jkaloger/pokedex-next/blob/main/app/.well-known/vercel/flags/route.ts
https://github.com/vercel/examples/blob/main/toolbar/toolbar-optimizely/app/.well-known/vercel/flags/route.ts

https://github.com/haydenbleasel/next-forge/tree/main/packages/feature-flags

https://github.com/Blazity/enterprise-commerce/blob/main/starters/shopify-algolia/utils/get-vercel-flag-overrides.ts
https://github.com/vercel/examples/blob/main/toolbar/toolbar-statsig/app/page.tsx
-->

## Links

- [Main Website](https://flags-sdk.dev)
- [Docs](https://vercel.com/docs/workflow-collaboration/feature-flags)
- [Examples](https://github.com/vercel/examples/tree/main/toolbar)
  - [Shirt Shop](https://github.com/vercel/shirt-shop)

## Library

### Installation

```sh
# Using pnpm
pnpm add @vercel/flags
```

### Configuration

```env
FLAGS_SECRET= # node -e "console.log(crypto.randomBytes(32).toString('base64url'))"
```

<!--
vercel-flag-overrides
-->

### Issues

#### TBD

```log
To begin setting up feature flags in the Vercel Toolbar, start via the toolbar in development locally.
```

TODO
