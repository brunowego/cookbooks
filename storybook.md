# Storybook

<!--
https://uikit.wfp.org/docs/index.html
https://auth0-cosmos.now.sh/sandbox/
https://mashmatrix.github.io/react-lightning-design-system/
https://primer.github.io/storybook/
https://documentation-primitives.netlify.app/

https://github.com/creativecommons/vocabulary
https://github.com/storybookjs/storybook
https://github.com/chakra-ui/chakra-ui
https://github.com/alfa-laboratory/core-components
https://github.com/element-plus/element-plus
-->

## References

- [Intro to Storybook](https://www.learnstorybook.com/intro-to-storybook/)
- [Visual Testing with Storybook](https://storybook.js.org/docs/html/workflows/visual-testing)

## Library

#### Darwin

- [Xcode](/xcode.md)

### Guides

- [Storybook for HTML](https://storybook.js.org/docs/guides/guide-html/)
- [Storybook for React](https://storybook.js.org/docs/guides/guide-react/)

### Addons

- [A11y](https://github.com/storybookjs/storybook/tree/next/addons/a11y)
- [Knobs](https://www.npmjs.com/package/@storybook/addon-knobs)
- [MDX (blocks)](https://github.com/storybookjs/storybook/blob/master/addons/docs/docs/mdx.md)
- [README](https://github.com/tuchk4/storybook-readme)
- [Storysource](https://github.com/storybookjs/storybook/tree/master/addons/storysource)
- [Viewport](https://github.com/storybookjs/storybook/tree/master/addons/viewport)

<!--
https://github.com/tonai/storybook-addon-themes
https://github.com/hipstersmoothie/storybook-dark-mode
-->

## CLI

### Installation

#### NPM

```sh
npm install @storybook/cli -g
```

#### Yarn

```sh
yarn global add @storybook/cli
```

#### NPX

```sh
npx -p @storybook/cli sb
```

### Bootstrap

- [Yarn](/yarn.md#bootstrap)
- [EditorConfig](/editorconfig.md#configuration)
- [Git](/git.md#initialize)
- [NPM](/npm.md#configuration)
- [stylelint](/stylelint.md#configuration)

### Commands

```sh
sb -h
```

### Usage

```sh
# Init
sb init --type html
sb init --type react
sb init --type vue
sb init --type angular
sb init --type react_native

# Running
npm run storybook
```

### Configuration

```json
{
  "scripts": {
    "storybook": "start-storybook -p 6006",
    "storybook:build": "build-storybook -o ./public/sb"
  }
}
```

```sh
echo '/public' > ./.gitignore
```

### Presets

#### [Syntactically Awesome Style Sheets (Sass)](https://github.com/storybookjs/presets/tree/master/packages/preset-scss)

```sh
yarn add -D @storybook/preset-scss css-loader sass-loader style-loader
```

```js
// Change ./.storybook/main.js
module.exports = {
  addons: [
    '@storybook/preset-scss'
  ]
};
```
