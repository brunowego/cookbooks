# Storybook Theming

## Links

- [Docs](https://storybook.js.org/docs/react/confiagure/theming)

## Installation

```sh
# Using NPM
npm install @storybook/addons @storybook/theming --save-dev

# Using Yarn
yarn add @storybook/addons @storybook/theming --dev

# Using pnpm
pnpm add @storybook/addons @storybook/theming -D
```

## Configuration

**Refer:** `./.storybook/manager.cjs`

```js
import { addons } from '@storybook/addons'
import { themes } from '@storybook/theming'

addons.setConfig({
  theme: {
    ...themes.dark,
    brandImage: 'https://xyz.tld/icon.svg',
    brandTitle: 'Acme Corp.',
    brandUrl: 'https://xyz.tld',
  },
})
```

**Refer:** `./.storybook/manager-head.html`

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
```
