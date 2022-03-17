# GraphCMS

<!--
dangerouslySetInnerHTML={{ __html: data?.post?.content?.html ?? '' }}
-->

## Related

- [GraphCMS](/graphcms.md)

## Installation

```sh
# Using NPM
npm install graphql urql
npm install @graphql-codegen/cli @graphql-codegen/import-types-preset @graphql-codegen/typescript @graphql-codegen/typescript-operations @graphql-codegen/typescript-urql dotenv --save-dev

# Using Yarn
yarn add graphql urql
yarn add @graphql-codegen/cli @graphql-codegen/import-types-preset @graphql-codegen/typescript @graphql-codegen/typescript-operations @graphql-codegen/typescript-urql dotenv --dev
```

## Configuration

**Refer:** `./src/constants/index.ts`

```ts
export const GRAPHCMS_URL = process.env.NEXT_PUBLIC_GRAPHCMS_URL
```

```sh
#
mkdir -p ./src/graphql/{fragments,mutations,queries}
```

**Refer:** `./src/graphql/queries/project.graphql`

```gql
query Project($slug: String!) {
  Project(where: { slug: $slug }) {
    name
    description
    link
  }
}
```

**Refer:** `./src/graphql/queries/projects.graphql`

```gql
query Projects {
  projects(orderBy: publishedAt_DESC) {
    name
    slug
    description
  }
}
```

**Refer:** `./src/lib/urql.ts`

```ts
import { ssrExchange, createClient, dedupExchange, cacheExchange, fetchExchange } from 'urql'
import { GRAPHCMS_URL } from '@/constants'

const isServerSide = typeof window === 'undefined'
const ssrCache = ssrExchange({ isClient: !isServerSide })

const client = createClient({
  url: GRAPHCMS_URL,
  exchanges: [dedupExchange, cacheExchange, ssrCache, fetchExchange],
})

export { client, ssrCache }
```

**Refer:** `./src/pages/_app.tsx`

```tsx
import type { AppProps } from 'next/app'
import { ssrCache, client } from '@/lib/urql'
import { Provider } from 'urql'

function App({ Component, pageProps }: AppProps) {
  if (pageProps.urqlState) {
    ssrCache.restoreData(pageProps.urqlState)
  }

  return (
    <Provider value={client}>
      <Component {...pageProps} />
    </Provider>
  )
}

export default App
```

**Refer:** `./src/pages/projects/index.tsx`

```tsx
import { useLinksQuery, LinksDocument } from '@/generated/graphql'
import type { GetStaticProps } from 'next'
import { client, ssrCache } from '@/lib/urql'

export default function Home() {
  const [{ data }] = useLinksQuery()

  return <pre>{JSON.stringify(data, null, 2)}</pre>
}

export const getStaticProps: GetStaticProps = async () => {
  await Promise.all([client.query(LinksDocument).toPromise()])

  return {
    props: {
      urqlState: ssrCache.extractData(),
    },
  }
}
```

**Refer:** `./src/pages/projects/[slug].tsx`

```tsx
import { useLinkQuery, LinkDocument } from '@/generated/graphql'
import { GetStaticPaths, GetStaticProps } from 'next'
import { client, ssrCache } from '@/lib/urql'

interface IProps {
  slug: string
}

function LinkPage({ slug }: IProps) {
  const [{ data }] = useLinkQuery({
    variables: {
      slug: slug,
    },
  })

  return <pre>{JSON.stringify(data, null, 2)}</pre>
}

export default LinkPage

export const getStaticPaths: GetStaticPaths = async () => {
  return {
    paths: [],
    fallback: 'blocking',
  }
}

export const getStaticProps: GetStaticProps = async ({ params }) => {
  await client.query(LinkDocument, { slug: params?.slug }).toPromise()

  return {
    props: {
      urqlState: ssrCache.extractData(),
      slug: params?.slug,
    },
  }
}
```

**Refer:** `./src/types/env.d.ts`

```ts
declare namespace NodeJS {
  export interface ProcessEnv {
    readonly NEXT_PUBLIC_GRAPHCMS_URL: string | undefined
  }
}
```

**Refer:** `./src/types/index.ts`

```ts
export type Project = {
  title: String
  slug: String
  description: String
  link: String
}
```

**Refer:** `./package.json`

```json
{
  "scripts": {
    "codegen": "graphql-codegen --config ./codegen.yml -r dotenv/config",
    // ...
  }
}
```

```sh
#
echo 'NEXT_PUBLIC_GRAPHCMS_URL=' >> ./.env
```

**Refer:** `./next.config.mjs`

```mjs
/**
 * @type {import('next').NextConfig}
 */
const nextConfig = {
  reactStrictMode: true,
  images: {
    domains: ['media.graphcms.com'],
  },
}

export default nextConfig
```

**Refer:** `./codegen.yml`

```yml
---
overwrite: true

schema: ${NEXT_PUBLIC_GRAPHCMS_URL}

documents: './src/graphql/**/*.graphql'

generates:
  ./src/generated/graphql.tsx:
    plugins:
      - 'typescript'
      - 'typescript-operations'
      - 'typescript-urql'
    config:
      withHooks: true

hooks:
  afterAllFileWrite:
    - eslint --fix
```

```sh
#
npm run codegen

#
yarn codegen
```

## Issues

### Publish

```log
Error: Error serializing `.urqlState["275616362"].error.graphQLErrors[0].path` returned from `getStaticProps` in "/blog".
Reason: `undefined` cannot be serialized as JSON. Please use `null` or omit this value.
```

Enable [Public Content API](/graphcms.md#public-content-api)



