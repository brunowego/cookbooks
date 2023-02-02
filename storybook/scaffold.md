# Storybook Scaffold

## Bootstrap

```sh
#
mkdir -p ./apps/storybook && cd "$_"

#
mkdir {.storybook,src/docs}

#
pnpm config set auto-install-peers true
pnpm config set legacy-peer-deps true

#
cat << EOF > ./.storybook.env
NODE_OPTIONS=--openssl-legacy-provider
BROWSER=none
STORYBOOK_DISABLE_TELEMETRY=1
EOF

#
cat << EOF > ./.gitignore
/dist
/node_modules
EOF
```

**Refer:** `./package.json`

```json
{
  "name": "@acme/storybook",
  "version": "0.0.0",
  "private": true,
  "license": "UNLICENSED",
  "scripts": {
    "dev": "dotenv -e ./.storybook.env -- start-storybook -p 6006",
    "build": "dotenv -e ./.storybook.env -- build-storybook -o ./dist"
  },
  "dependencies": {
    "prop-types": "~15.8.1",
    "react": "~18.2.0",
    "react-dom": "~18.2.0"
  },
  "devDependencies": {
    "@mdx-js/react": "~1.6.22",
    "@storybook/addon-actions": "~6.5.16",
    "@storybook/addon-backgrounds": "~6.5.16",
    "@storybook/addon-docs": "~6.5.16",
    "@storybook/addon-essentials": "~6.5.16",
    "@storybook/addon-measure": "~6.5.16",
    "@storybook/addon-outline": "~6.5.16",
    "@storybook/addons": "~6.5.16",
    "@storybook/builder-vite": "~0.3.0",
    "@storybook/channel-postmessage": "~6.5.16",
    "@storybook/channel-websocket": "~6.5.16",
    "@storybook/client-api": "~6.5.16",
    "@storybook/client-logger": "~6.5.16",
    "@storybook/preview-web": "~6.5.16",
    "@storybook/react": "~6.5.16",
    "dotenv-cli": "~7.0.0",
    "vite": "~4.0.4"
  }
}
```

**Refer:** `./.storybook/main.cjs`

```cjs
module.exports = {
  stories: ['../src/**/*.stories.mdx', '../src/**/*.stories.@(js|jsx|ts|tsx)'],
  addons: ['@storybook/addon-essentials'],
  framework: '@storybook/react',
  core: {
    builder: '@storybook/builder-vite',
  },
  features: {
    storyStoreV7: true,
  },
}
```

**Refer:** `./apps/storybook/src/docs/00-introduction.stories.mdx`

```mdx
<!-- markdownlint-disable first-line-heading -->

import { Meta } from '@storybook/addon-docs'

<Meta title="Introduction" />

# Web Component Library

This library provides a foundation for UI development in our [Platform](https://github.com/<owner>/platform). It implements a set of solid UI components that are composable, performant, accessible and well-tested, while also satisfying the UX and UI design requirements of the ACME Design System.
```
