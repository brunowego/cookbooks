# Extend with SSE

TODO

<!--
https://github.com/mpetrunic/fastify-sse-v2

https://github.com/digiboridev/serv_ex_back/blob/main/src/api/fastify/routes/orders.routes.ts
https://github.com/nihilux-org/roon-web-stack/blob/main/app/roon-web-api/src/route/api-route.ts
https://github.com/jamcalli/Pulsarr/blob/master/src/plugins/custom/progress.ts
https://github.com/dinavinter/fastify-ai-starter/blob/main/src/routes/text.ts
https://github.com/zetaraku/hello-fastify/blob/master/src/routes/index.ts
https://github.com/AhmedrAshraf/battle-ships-game/blob/main/backend/src/routes/game.ts#L180
https://github.com/zetaraku/hello-fastify/blob/master/src/plugins/sse.ts
-->

<!-- ```ts
import type { FastifyPluginAsync } from 'fastify'
import { EventEmitter, on } from 'node:events'

const sleep = (ms: number) => new Promise((resolve) => setTimeout(resolve, ms))

const target = new EventEmitter()
;(async () => {
  for await (const [event] of on(target, 'foo')) {
    console.log(
      `${new Date().toISOString()} an event has occurred ${JSON.stringify(
        event,
      )}`,
    )
  }
})()

setInterval(() => {
  target.emit('foo', `Tick ${new Date().toISOString()}`)
}, 3000)

export default (async (fastify) => {
  fastify.get('/async-iterator', async (_, reply) => {
    reply.sse(
      (async function* source() {
        for (let i = 0; i < 10; i++) {
          await sleep(100)

          yield { id: String(i), data: 'Some message' }
        }
      })(),
    )
  })

  fastify.get('/single-events', async (request, reply) => {
    for (let i = 0; i < 10; i++) {
      await sleep(100)
      reply.sse({ id: String(i), data: 'Some message' })
    }

    reply.sseContext.source.end()
    request.socket.on('close', () => {
      console.log('connection closed')
    })
  })

  fastify.get('/events', async (request, reply) => {
    for (let i = 0; i < 10; i++) {
      await sleep(100)

      reply.sse({ data: 'Some message' })
    }

    reply.sseContext.source.end()
    request.socket.on('close', () => {
      console.log('connection closed')
    })
  })

  fastify.get('/sse', (_, reply) => {
    reply.sse(
      (async function* () {
        for await (const [event] of on(target, 'foo')) {
          yield {
            event: event.name,
            data: JSON.stringify(event),
          }
        }
      })(),
    )
  })
}) satisfies FastifyPluginAsync
``` -->

<!-- ```ts
reply.raw.writeHead(200, {
  'Content-Type': 'text/event-stream',
  'Cache-Control': 'no-cache',
  Connection: 'keep-alive',
})

const source = (async function* () {
  try {
    const fileImport = await fastify
      .knex('file_imports')
      .where({
        processing_status: 'processing',
      })
      .first()

    if (!fileImport) {
      yield {
        data: JSON.stringify({ message: 'No pending file imports' }),
      }

      return
    }

    while (true) {
      const updatedFileImport = await fastify
        .knex('file_imports')
        .where({
          processing_status: 'processing',
        })
        .first()

      if (updatedFileImport.processing_status === 'completed') {
        yield {
          data: JSON.stringify({
            progress: 100,
            processed: updatedFileImport.processed_rows,
            total: updatedFileImport.total_rows,
            message: 'Import completed',
          }),
        }

        break
      }

      if (updatedFileImport.processing_status === 'failed') {
        yield {
          data: JSON.stringify({
            message: 'Import failed',
            status: 'failed',
          }),
        }

        break
      }

      const progress = Math.round(
        (updatedFileImport.processed_rows / updatedFileImport.total_rows) *
          100,
      )

      yield {
        data: JSON.stringify({
          progress,
          processed: updatedFileImport.processed_rows,
          total: updatedFileImport.total_rows,
        }),
      }

      await new Promise((resolve) => setTimeout(resolve, 1000))
    }
  } catch (error) {
    fastify.log.error('Error in SSE stream:', error)

    yield {
      data: JSON.stringify({ message: 'Internal server error' }),
    }
  }
})()

request.raw.on('close', () => {
  reply.raw.end()
})

reply.sse(source)
``` -->
