# addon-docs

## Installation

```sh
# Using pnpm
pnpm install @storybook/addon-docs -D
```

## Configuration

```ts
// ...
export default {
  // ...
  addons: [
    // ...
    '@storybook/addon-docs',
  ],
  // ...
} satisfies StorybookConfig
```

## Issues

### Missing Addon Docs

```log
Failed to fetch dynamically imported module: http://localhost:6006/src/docs/introduction.stories.mdx
TypeError: Failed to fetch dynamically imported module: http://localhost:6006/src/docs/introduction.stories.mdx
```

Just install it.
