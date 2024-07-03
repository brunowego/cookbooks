# @tailwindcss/typography

**Keywords:** Prose

## Links

- [Code Repository](https://github.com/tailwindlabs/tailwindcss-typography)
- [Main Website](https://tailwindcss-typography.vercel.app/)
- [Docs](https://tailwindcss.com/docs/typography-plugin)

## Installation

```sh
# Using NPM
npm install @tailwindcss/typography

# Using pnpm
pnpm add @tailwindcss/typography

# Using Yarn
yarn add @tailwindcss/typography

# Using Bun
bun add @tailwindcss/typography
```

## Configuration

**Refer:** `./tailwind.config.ts`

```ts
import typographyPlugin from '@tailwindcss/typography'

export default {
  // ...
  plugins: [typographyPlugin],
} satisfies Config
```

<!--
max-w-screen-md mx-auto

prose lg:prose-lg dark:prose-invert
-->
