# Storybook

<!--
{Object.entries(resolveConfig(tailwindConfig).theme.colors).map(([key, value]) => (
    <ColorItem
      key={key + value}
      title={key}
      colors={typeof value === 'string' ? [value] : value}
      subtitle=""/>
  ))}
-->

## Links

- [Code Repository](https://github.com/storybookjs/storybook)
- [Main Website](https://storybook.js.org)
- [Projects that use Storybook](https://storybook.js.org/showcase/projects)
- Docs
  - [Intro to Storybook](https://storybook.js.org/tutorials/intro-to-storybook/)
- Blog
  - [How to automate UI tests with Github Actions](https://storybook.js.org/blog/how-to-automate-ui-tests-with-github-actions/)

## Showcase

- [Supabase](https://unruffled-hoover-de9320.netlify.app)

<!--
https://github.com/myraui/myraui
https://github.com/highlight/highlight/tree/main/packages/ui
https://github.com/ballerine-io/ballerine/tree/dev/packages/ui
https://developer.volvocars.com/design-system/web/
-->

## CLI

### Installation

```sh
# Using NPM
npm install @storybook/cli -g
```

<!--
npx -p @storybook/cli sb
-->

### Commands

```sh
sb -h
```

<!-- ## Issues -->

<!-- ###

```log
Cannot find module './logo.svg' or its corresponding type declarations. ts(2307)
```

```
declare module "*.svg" {
  const svg: string | { width: number; height: number; src: string };
  export = svg;
}
``` -->

<!-- ###

https://github.com/storybookjs/storybook/issues/17448

```log
ERR! Error: Cannot find module '/node_modules/react/package.json.js'
```

```sh
# Using NPM
npm uninstall @storybook/react
npm install @storybook/preact --save-dev

# Using Yarn
yarn remove @storybook/react
yarn add @storybook/preact --dev
``` -->x1x``

<!-- ### Missing Resolve Alias

```log
ModuleNotFoundError: Module not found: Error: Can't resolve '@/assets/images/logo/any.svg' in '/Volumes/Workspace/github.com/[org]/[project]/src/components/Layout'
```

**Refer:** `./.storybook/main.js`

```js
const path = require('path')

module.exports = {
  // ...
  webpackFinal: async (config) => {
    config.resolve = {
      ...config.resolve,
      alias: {
        ...config.resolve.alias,
        '@': path.resolve(__dirname, '../src'),
      },
    }

    return config
  },
}
``` -->

<!-- ### Missing Module Rule for SVGR

```log
Failed to execute 'createElement' on 'Document': The tag name provided ('static/media/src/assets/images/social/linkedin.svg') is not a valid name.
```

**Refer:** `./.storybook/main.js`

```js
module.exports = {
  // ...
  webpackFinal: async (config) => {
    config.module.rules = config.module.rules.map((rule) => {
      if (String(rule.test).includes('svg')) {
        return {
          ...rule,
          test: /\.(ico|jpg|jpeg|png|gif|eot|otf|webp|ttf|woff|woff2|cur|ani)(\?.*)?$/,
        }
      }

      return rule
    })

    config.module.rules.push({
      test: /\.svg$/i,
      issuer: /\.tsx?$/,
      use: [
        {
          loader: '@svgr/webpack',
          options: {
            svgoConfig: {
              plugins: [
                {
                  name: 'removeViewBox',
                  active: false,
                },
              ],
            },
          },
        },
      ],
    })

    return config
  },
}
``` -->
