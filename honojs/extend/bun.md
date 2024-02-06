# Extend with Bun

TODO

<!-- ```ts
import { serveStatic } from 'hono/bun'

const app = new Hono()

app.use('/favicon.ico', serveStatic({ path: './favicon.ico' }))
``` -->

<!--
import { type Serve } from 'bun'

import { CustomHono } from './types'
import { defaultHook } from './lib/default-hook'
import { env } from '@/env'

const app = new CustomHono({ defaultHook })

const route = app.get('/', (c) => c.json({ hello: 'world' }))

export type AppRoute = typeof route

export default {
  hostname: env.HOST,
  port: env.PORT,
  fetch: app.fetch,
} satisfies Serve
-->
