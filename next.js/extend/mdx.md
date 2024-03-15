# Extend with MDX

## Learn

- [Markdown and MDX](https://nextjs.org/docs/app/building-your-application/configuring/mdx)

## Installation

```sh
# Using Bun
bun add @next/mdx @mdx-js/loader @mdx-js/react @types/mdx
```

## Issues

### Missing MDX Components

```log
Error: createContext only works in Client Components. Add the "use client" directive at the top of the file to use it. Read more: https://nextjs.org/docs/messages/context-in-server-component
```

Put `./mdx-components.tsx` file in the root of the project (`./src/mdx-components.tsx`).
