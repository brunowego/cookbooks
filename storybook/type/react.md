# Storybook React

## Links

- Docs
  - [Introduction to Storybook for React](https://storybook.js.org/docs/react)
  - [Storybook for Vite](https://storybook.js.org/blog/storybook-for-vite)

## Dependencies

- [Storybook CLI](../README.md#cli)

## Monorepo Bootstrap

<!--
export NODE_OPTIONS=--openssl-legacy-provider

echo 'shamefully-hoist = true' >> ./.npmrc
-->

<!--
#
cat << EOF > ./.storybook.env
NODE_OPTIONS=--openssl-legacy-provider
BROWSER=none
STORYBOOK_DISABLE_TELEMETRY=1
EOF
-->

<!--
#
cat << EOF > ./.gitignore
/dist
/node_modules
EOF
-->

<!--
pnpm config set auto-install-peers true
pnpm config set legacy-peer-deps true
-->

```sh
#
mkdir -p ./packages/ui && cd "$_"

# Only if it is not already exists
pnpm init

#
pnpm dlx storybook@latest init \
  -s \
  -p tsx \
  --type react \
  -b @storybook/builder-vite

# Or
pnpm dlx storybook@latest init \
  -s \
  -p tsx \
  --type nextjs

#
pnpm add dotenv-cli -D
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
# echo '/public/sb' >> ./.eslintignore
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
