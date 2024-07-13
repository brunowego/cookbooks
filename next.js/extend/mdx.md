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
