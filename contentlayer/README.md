# Contentlayer

## Links

- [Code Repository](https://github.com/contentlayerdev/contentlayer)
- [Main Website](https://contentlayer.dev/)

## Library

## Installation

```sh
# Using NPM
npm install contentlayer

# Using Yarn
yarn add contentlayer
```

<!--
rehype-autolink-headings rehype-code-titles rehype-prism-plus rehype-slug remark-gfm remark-gfm
-->

### Configuration

**Refer:** `./contentlayer.config.ts`

```ts
import { defineDocumentType, makeSource } from 'contentlayer/source-files'

const Post = defineDocumentType(() => ({
  name: 'Post',
  filePathPattern: 'posts/*.md',
  fields: {
    title: {
      type: 'string',
      required: true,
    },
    description: {
      type: 'string',
      required: true,
    },
    url: {
      type: 'string',
      required: true,
    },
  },
}))

export default makeSource({
  contentDirPath: './data',
  documentTypes: [Post],
})
```

**Refer:** `./tsconfig.json`

```json
{
  // ...
  "compilerOptions": {
    "baseUrl": "./",
    "paths": {
      "@/contentlayer/generated": ["./.contentlayer/generated"],
      // ...
    }
  },
  "include": [
    "./.contentlayer/generated",
    // ...
  ]
}
```

**Refer:** `./src/pages/any.tsx`

```tsx
import type { InferGetStaticPropsType } from 'next'
import { allPosts } from '@/contentlayer/generated'

type Props = InferGetStaticPropsType<typeof getStaticProps>

export default function Home({ posts }: Props) {
  return (
    <>
      {posts.map((post) => (
        // ...
      ))}
    </>
  )
}

export async function getStaticProps() {
  const posts = allPosts

  return { props: { posts } }
}
```

## Usage

```sh
# Using NPX
npx contentlayer build

# Using Yarn
yarn contentlayer build

# Using Yarn Workspace
yarn workspace [workspace] run contentlayer build
```

### Issues

#### Missing `markdown-wasm` Package

```log
[webpack.cache.PackFileCacheStrategy] Caching failed for pack: Error: Can't resolve 'markdown-wasm/dist/markdown.node.js' in '/node_modules/@contentlayer/core/dist' while resolving 'markdown-wasm/dist/markdown.node.js' in /node_modules/@contentlayer/core/dist as file at resolve esm file markdown-wasm/dist/markdown.node.js
```

```sh
# Using NPM
npm install markdown-wasm

# Using Yarn
yarn add markdown-wasm
```

#### TBD

```log
[webpack.cache.PackFileCacheStrategy/webpack.FileSystemInfo] Parsing of /node_modules/@contentlayer/core/dist/getConfig/index.js for build dependencies failed at 'import(`file://${modulePath}?x=${new Date()}`)'.
Build dependencies behind this expression are ignored and might cause incorrect cache invalidation.

[webpack.cache.PackFileCacheStrategy] Caching failed for pack: Error: Can't resolve 'path' in '/node_modules/@contentlayer/core/dist' while resolving 'path' in /node_modules/@contentlayer/core/dist as file
```

[Turn Off Logging](/next.js/README.md#turn-off-logging)

## CLI

### Commands

```sh
npx contentlayer -h
```

### Usage

```sh
#
npx contentlayer build --clearCache
```
