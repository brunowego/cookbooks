# Storybook

<!--
https://github.com/chakra-ui/chakra-ui
https://github.com/alfa-laboratory/core-components
https://github.com/element-plus/element-plus
-->

## References

- [Intro to Storybook](https://www.learnstorybook.com/intro-to-storybook/)

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

#### Yarn

```sh
yarn global add @storybook/cli
```

#### NPM

```sh
npm install @storybook/cli -g
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

### Configuration

```json
{
  "scripts": {
    "storybook": "start-storybook -p 6006",
    "storybook:build": "build-storybook -o ./public/sb"
  }
}
```

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
yarn storybook
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
