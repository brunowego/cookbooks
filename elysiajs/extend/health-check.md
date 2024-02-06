# Health Check

<!--
/-/health
/-/metrics

/-/readiness
/-/liveness
/-/ping
-->

<!--
https://elysiajs.com/plugins/server-timing
-->

TODO

<!--
app.get(
  '/ping',
  () => {
    return { message: 'PONG', now: Math.floor(Date.now() / 1000) }
  },
  {
    response: t.Object({
      message: t.String(),
      now: t.Number(),
    }),
  },
)
-->

<!--
import serverTiming from '@elysiajs/server-timing'

app
  .use(serverTiming())

  .trace(async ({ beforeHandle }) => {
    const { time, end } = await beforeHandle

    getLogger().info('Handle took', (await end) - time)
  })

  .get('/liveness', async () => {
    return process.uptime
  })

  .get('/readiness', async () => {})

  .get('/status', () => `Uptime: ${process.uptime().toFixed()}s`)
-->

<!--

-->
