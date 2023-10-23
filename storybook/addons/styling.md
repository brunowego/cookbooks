# Styling

**Deprecated:** Use [addon-themes](./addon-themes)

## Links

- [Main Page](https://storybook.js.org/addons/@storybook/addon-styling)

## Installation

```sh
# Using pnpm
pnpm add @storybook/addon-styling -D
```

## Configuration

**Refer:** `./.storybook/main.ts`

```ts
// ...
export default {
  // ...
  addons: [
    // ...
    {
      name: '@storybook/addon-styling',
      // options: {},
    },
  ],
  // ...
} satisfies StorybookConfig
```
