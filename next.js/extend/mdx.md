# Extend with MDX

## Learn

- [Markdown and MDX](https://nextjs.org/docs/app/building-your-application/configuring/mdx)

## Installation

```sh
# Using pnpm
pnpm add @next/mdx @mdx-js/loader @mdx-js/react rehype-slug remark-gfm
pnpm add @types/mdx -D

# Using Bun
bun add @next/mdx @mdx-js/loader @mdx-js/react rehype-slug remark-gfm
bun add @types/mdx -D
```

## Issues

### Missing MDX Components

```log
Error: createContext only works in Client Components. Add the "use client" directive at the top of the file to use it. Read more: https://nextjs.org/docs/messages/context-in-server-component
```

Put `./mdx-components.tsx` file in the root of the project (`./src/mdx-components.tsx`).

### TBD

```log
[Error: loader /absolute/path/to/project/node_modules/.pnpm/@next+mdx@15.1.6_@mdx-js+loader@3.1.0_acorn@8.14.0_webpack@5.97.1_/node_modules/@next/mdx/mdx-js-loader.js for match "*.mdx" does not have serializable options. Ensure that options passed are plain JavaScript objects and values.]
```

<!--
https://github.com/vercel/next.js/commit/872433c6021eeba104a61a744299841d8f358962
https://github.com/vercel/next.js/issues/71819
-->

TODO
