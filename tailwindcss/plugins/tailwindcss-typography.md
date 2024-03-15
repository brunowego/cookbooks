# @tailwindcss/typography

**Keywords:** Prose

## Links

- [Code Repository](https://github.com/tailwindlabs/tailwindcss-typography)
- [Main Website](https://tailwindcss-typography.vercel.app/)
- [Docs](https://tailwindcss.com/docs/typography-plugin)

## Installation

```sh
# Using NPM
npm install @tailwindcss/typography --save-dev

# Using Yarn
yarn add @tailwindcss/typography --dev

# Using Bun
bun add @tailwindcss/typography -D
```

## Configuration

**Refer:** `./tailwind.config.cjs`

```cjs
/**
 * @type { import('tailwindcss').Config }
 */
const tailwindConfig = {
  // ...
  plugins: [require('@tailwindcss/typography')],
}

module.exports = tailwindConfig
```

<!--
max-w-screen-md mx-auto

prose lg:prose-lg dark:prose-invert
-->
