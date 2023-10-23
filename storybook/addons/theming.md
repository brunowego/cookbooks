# theming

## Links

- [Docs](https://storybook.js.org/docs/react/configure/theming)

## Installation

```sh
# Using pnpm
pnpm add @storybook/manager-api @storybook/theming -D
```

## Configuration

**Refer:** `./.storybook/theme.ts`

```ts
import { create } from '@storybook/theming/create'

export default create({
  base: 'dark',
  // ...
})
```

**Refer:** `./.storybook/manager.ts`

```ts
import { addons } from '@storybook/manager-api'

import theme from './theme'

addons.setConfig({
  theme,
})
```

**Refer:** `.storybook/preview.ts`

```ts
// ...
import { themes } from '@storybook/theming'

import theme from './theme'

export default {
  parameters: {
    // ...
    docs: {
      theme,
    },
  },
} satisfies Preview
```

<!-- **Refer:** `./.storybook/manager-head.html`

```html
<meta
  name="description"
  content="The starting point for working with Boxfeed UI Library. A place that holds the documentation, and showcases different use scenarios of our UI components."
/>

<meta name="robots" content="noindex" />

<link rel="canonical" href="https://xyz.tld" />

<link
  rel="shortcut icon"
  type="image/png"
  href="https://xyz.tld/images/favicon/dark.png"
  media="(prefers-color-scheme: dark)"
/>
<link
  rel="shortcut icon"
  type="image/png"
  href="https://xyz.tld/images/favicon/light.png"
  media="(prefers-color-scheme: light), (prefers-color-scheme: no-preference)"
/>
``` -->
