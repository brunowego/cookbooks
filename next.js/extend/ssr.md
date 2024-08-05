# With Server Side Rendering (SSR)

## Terms

- Data Fetching

## Libraries

- [conform](/conform.md)
- [zsa](/zsa.md)

## Snippets

### App Router (>= Next.js 13) (thirteen)

**Note:** `getServerSideProps`, `getStaticProps`, and `getInitialProps` is not supported in the App Router.

<!-- React Server Components -->

TODO

### Pages Router (<= Next.js 12) (twelve)

#### Static Site Generation (SSG)

```tsx
import React from 'react'

const Home = ({ data }) => {
  return (
    <div>
      <h1>Dados Estáticos</h1>

      <pre>{JSON.stringify(data, null, 2)}</pre>
    </div>
  )
}

export const getStaticProps = async () => {
  const res = await fetch('https://api.example.com/data')
  const data = await res.json()

  return {
    props: {
      data,
    },
    revalidate: 10,
}

export default Home
```

#### Server-Side Rendering (SSR)

```tsx
import React from 'react'

const Home = ({ data }) => {
  return (
    <div>
      <h1>Dados do Servidor</h1>

      <pre>{JSON.stringify(data, null, 2)}</pre>
    </div>
  )
}

export const getServerSideProps = async (context) => {
  const res = await fetch('https://api.example.com/data')
  const data = await res.json()

  return {
    props: {
      data,
    },
  }
}

export default Home
```

#### Incremental Static Regeneration (ISR) with Server-Side Rendering (SSR)

```tsx
import { GetStaticProps, GetServerSideProps } from 'next'

export const getStaticProps: GetStaticProps = async () => {
  const staticData = await fetchStaticData()

  return {
    props: {
      staticData,
    },
    revalidate: 60,
  }
}

export const getServerSideProps: GetServerSideProps = async () => {
  const dynamicData = await fetchDynamicData()

  return {
    props: {
      dynamicData,
    },
  }
}

const MyPage = ({ staticData, dynamicData }) => {
  return (
    <div>
      <h1>My Page</h1>

      <p>Static Data: {staticData}</p>
      <p>Dynamic Data: {dynamicData}</p>
    </div>
  )
}

export default MyPage
```

## Tips

### Disable SSR

**Refer:** `./page.tsx`

```ts
import dynamic from 'next/dynamic'
import type { JSX } from 'react'

const Page = (): JSX.Element => {
  console.log(window.navigator.userAgent)
  // ...
}

export default dynamic(() => Promise.resolve(Page), {
  ssr: false,
})
```

## Issues

### TBD

```log
× "getServerSideProps" is not supported in app/. Read more: https://nextjs.org/docs/app/building-your-application/data-fetching
```

Only `getServerSideProps` can be used in Pages Router, not in the App Router.
