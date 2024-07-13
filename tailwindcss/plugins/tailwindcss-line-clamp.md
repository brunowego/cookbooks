# @tailwindcss/typogrline-clampaphy

**Warning:** As of Tailwind CSS v3.3, the `@tailwindcss/line-clamp` plugin is now included by default.

## Links

- [Code Repository](https://github.com/tailwindlabs/tailwindcss-line-clamp)

## Installation

```sh
# Using NPM
npm install @tailwindcss/line-clamp

# Using pnpm
pnpm add @tailwindcss/line-clamp

# Using Yarn
yarn add @tailwindcss/line-clamp

# Using Bun
bun add @tailwindcss/line-clamp
```

## Configuration

**Refer:** `./tailwind.config.ts`

```ts
import lineClampPlugin from '@tailwindcss/line-clamp'

export default {
  // ...
  plugins: [lineClampPlugin],
} satisfies Config
```
