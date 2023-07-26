# Storybook React

## Links

- Docs
  - [Introduction to Storybook for React](https://storybook.js.org/docs/react)
  - [Storybook for Vite](https://storybook.js.org/blog/storybook-for-vite)

## Dependencies

- [Storybook CLI](../README.md#cli)

## Bootstrap

<!--
export NODE_OPTIONS=--openssl-legacy-provider

echo 'shamefully-hoist = true' >> ./.npmrc
-->

<!--
pnpm config set auto-install-peers true
pnpm config set legacy-peer-deps true
-->

```sh
#
pnpm dlx storybook@latest init \
  -s \
  -p tsx \
  --type react \
  -b @storybook/builder-vite

#
pnpm dlx storybook@latest init \
  -s \
  -p tsx \
  --type nextjs
```

<!--
#
pnpm add react react-dom prop-types

#
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
-->

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

### TBD

```log
Module "path" has been externalized for browser compatibility. Cannot access "path.join" in client code.  See http://vitejs.dev/guide/troubleshooting.html#module-externalized-for-browser-compatibility for more details.
```

TODO

### TBD

```log
__dirname is not defined
```

TODO

### TBD

```log
Cannot read properties of undefined (reading 'fonts')
```

TODO

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
