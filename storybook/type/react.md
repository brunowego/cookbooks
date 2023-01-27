# Storybook React

## Links

- Docs
  - [Introduction to Storybook for React](https://storybook.js.org/docs/react/)
  - [Storybook for Vite](https://storybook.js.org/blog/storybook-for-vite/)

## Bootstrap

```sh
pnpm config set auto-install-peers true
pnpm config set legacy-peer-deps true

pnpx sb init \
  -s \
  -p tsx \
  --type react \
  -b @storybook/builder-vite

pnpm add react react-dom prop-types

pnpm add \
  @mdx-js/react@1 \
  @storybook/addon-backgrounds \
  @storybook/addon-docs \
  @storybook/addon-measure \
  @storybook/addon-outline \
  @storybook/addons \
  @storybook/channel-postmessage \
  @storybook/channel-websocket \
  @storybook/client-api \
  @storybook/preview-web \
  dotenv-cli \
  vite \
  -D
```

## Configuration

**Refer:** `./package.json`

```json
{
  "scripts": {
    // ...
    "storybook:dev": "dotenv -e ./.storybook.env -- start-storybook -p 6006",
    "storybook:build": "dotenv -e ./.storybook.env -- build-storybook -o ./public/sb"
  }
}
```

```sh
#
echo '/public/sb' >> ./.eslintignore
echo '/public/sb' >> ./.gitignore
```

## Usage

```sh
#
pnpm storybook:dev

#
pnpm storybook:build
```

## Issues

### MDX2: Can't resolve @mdx-js/react

```log
3:41:52 PM [vite] Internal server error: Failed to resolve import "@mdx-js/react" from "stories/Introduction.stories.mdx". Does the file exist?
```

<!--
https://github.com/storybookjs/storybook/issues/18094
-->

```sh
pnpm add @mdx-js/react -D --force
```
