# Storybook

<!--
https://theodorusclarence.com/blog/nextjs-storybook-tailwind#replace-storybookpreviewjs
-->

## Initialize

```sh
echo 'y' | npx sb init -y --builder webpack5
```

## Dependencies

```sh
# Using NPM
npm install @storybook/addon-postcss --save-dev

# Using Yarn
yarn add @storybook/addon-postcss --dev
```

## Configuration

**Refer:** `./.storybook/main.js`

```js
module.exports = {
  stories: ['../src/components/**/*.stories.tsx'],
  addons: [
    '@storybook/addon-links',
    '@storybook/addon-essentials',
    {
      name: '@storybook/addon-postcss',
      options: {
        postcssLoaderOptions: {
          implementation: require('postcss'),
        },
      },
    },
  ],
  // framework: '@storybook/react',
  framework: '@storybook/preact',
  core: {
    builder: 'webpack5',
  },
}
```

**Refer:** `./.storybook/preview.js`

```js
import '../src/styles/globals.css'
import * as nextImage from 'next/image'

Object.defineProperty(nextImage, 'default', {
  configurable: true,
  value: (props) => <img {...props} />,
})

export const parameters = {
  actions: { argTypesRegex: '^on[A-Z].*' },
  controls: {
    matchers: {
      color: /(background|color)$/i,
      date: /Date$/,
    },
  },
}
```

**Refer:** `./package.json`

```json
{
  // ...
  "scripts": {
    "storybook:dev": "start-storybook -p 6006",
    "storybook:build": "build-storybook -o ./public/sb"
  },
  // ...
  "resolutions": {
    "webpack": "^5"
  }
}
```

```sh
#
echo '/public/sb' >> ./.eslintignore

#
echo '/public/sb' >> ./.gitignore
```

<!--
"@storybook/addon-a11y": "~6.3.6",
"@storybook/addon-backgrounds": "~6.3.6",
"@storybook/addon-docs": "~6.3.6",
"@storybook/addon-knobs": "~6.3.0",
"@storybook/addon-storysource": "~6.3.6",
"@storybook/addon-viewport": "~6.3.6",
"@storybook/client-api": "~6.3.6",
"@storybook/client-logger": "~6.3.6",
"@storybook/csf": "~0.0.1",
-->

<!--
yarn add storybook-addon-linguijs --dev
-->

## Tips

### Lingui

```js
import { i18n } from '@lingui/core'
import messages from '../src/locales/en.js'
import { I18nProvider } from '@lingui/react'
// import { addDecorator } from '@storybook/react'
import { addDecorator } from '@storybook/preact'

i18n.load('en', messages)
i18n.activate('en')

const withI18n = (Story) => (
  <I18nProvider i18n={i18n} forceRenderOnLocaleChange={false}>
    <Story />
  </I18nProvider>
)

addDecorator(withI18n)
```

## Issues

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
``` -->

### Missing Resolve Alias

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
```

### Missing Module Rule for SVGR

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
```
