# addon-themes

## Links

- [Main Page](https://storybook.js.org/addons/@storybook/addon-themes)

## Installation

```sh
# Using pnpm
pnpm add @storybook/addon-themes -D
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
      name: '@storybook/addon-themes',
      // options: {},
    },
  ],
  // ...
} satisfies StorybookConfig
```

**Refer:** `./.storybook/preview.ts`

```ts
import { withThemeByDataAttribute } from '@storybook/addon-themes'
import type { Decorator, Preview } from '@storybook/react'
// ...

export default {
  decorators: [
    withThemeByDataAttribute({
      themes: {
        light: 'light',
        dark: 'dark',
      },
      defaultTheme: 'dark',
      // attributeName: 'data-mode',
      // attributeName: 'class',
      // parentSelector: 'html',
    }) as Decorator,
  ],
  // ...
} satisfies Preview
```
