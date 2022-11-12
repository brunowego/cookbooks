# Storybook

<!--
https://swirl-storybook.flip-app.dev/
-->

<!--
https://stackoverflow.com/questions/71130741/storybook-missing-react-package-when-use-with-preact/73791613#73791613
-->

<!--
https://github.com/Vizzuality/front-end-scaffold
https://storybook.js.org/blog/how-to-automate-ui-tests-with-github-actions/

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

https://prismalens.netlify.app/
https://github.com/prisma/lens
-->

## References

- [Intro to Storybook](https://www.learnstorybook.com/intro-to-storybook/)
- [Visual Testing with Storybook](https://storybook.js.org/docs/html/workflows/visual-testing)

## Guides

- [Introduction to Storybook for Preact](https://storybook.js.org/docs/preact/get-started/introduction)

## Library

### Darwin

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
https://storybook.js.org/addons/storybook-zeplin
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
# Using Yarn 1.x
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
npx sb -h
```

### Usage

```sh
# Init
npx sb init --type html
npx sb init --type react
npx sb init --type preact
npx sb init --type vue
npx sb init --type angular
npx sb init --type react_native

# Running
npm run storybook
```

### Configuration

**Refer:** `./package.json`

```json
{
  "scripts": {
    "storybook:dev": "start-storybook -p 6006",
    "storybook:build": "build-storybook -o ./public/sb"
  }
}
```

```sh
#
echo '/public/sb' >> ./.eslintignore

#
echo '/public/sb' >> ./.gitignore
```

### Presets

#### [Syntactically Awesome Style Sheets (Sass)](https://github.com/storybookjs/presets/tree/master/packages/preset-scss)

```sh
yarn add -D @storybook/preset-scss css-loader sass-loader style-loader
```

```js
// Change ./.storybook/main.js
module.exports = {
  addons: ['@storybook/preset-scss'],
}
```
