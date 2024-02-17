# Extend with Server-Sent Events

## Related

- [Server-Sent Events (SSE)](/sse.md)

<!--
https://github.com/zircon-tech/sse

https://github.com/zhangdongsh/L-GPT/blob/main/src/app/api/azure/route.ts

https://velog.io/@baby_dev/Server-Component-%EC%8B%A4%EC%A0%84%EC%97%90%EC%84%9C-%EC%8D%A8%EB%A8%B9%EA%B8%B0-2%ED%8E%B8

https://medium.com/@ruslanfg/long-running-nextjs-requests-eff158e75c1d
https://michaelangelo.io/blog/server-sent-events
-->

<!--
https://github.com/sanrafa/sveltekit-sse-example
-->

<!--
https://github.com/Simon-Initiative/oli-torus/blob/master/assets/src/apps/delivery/components/NotificationContext.tsx
-->

TODO

<!--
TransformStream

https://github.com/rafaelmaferreira/idc-ms-chatgpt/blob/main/webapp/src/app/api/event-stream/route.ts
https://github.com/rafaelmaferreira/idc-ms-chatgpt/blob/main/webapp/src/app/api/messages/%5BmessageId%5D/events/route.ts
https://github.com/devfullcycle/fclx/blob/main/nextjs/src/app/api/event-stream/route.ts
https://github.com/living-in-seoul/frontend/blob/main/src/app/api/sse/route.ts
https://github.com/Tolu-Mals/nextjs-server-sse/blob/main/src/app/api/route.ts

https://github.com/XD2Sketch/react-chat-stream/blob/main/example/src/app/chat/route.ts

eventsource-parser (fetch SSE)

https://github.com/CloseAI-Software/journey_crafter/blob/main/src/app/api/chat/route.ts
-->

<!--
path:route.ts content:text/event-stream content:next/server

path:src/app path:route.ts content:next/server content:"EventSource"

path:src/app path:route.ts content:"export const dynamic" content:"force-dynamic"
-->

<!--
export const dynamic = 'force-dynamic'
-->

## Examples

### Simple

```ts
export const dynamic = 'force-dynamic'

function handler(): Response {
  const { writable, readable } = new TransformStream()
  const writer = writable.getWriter()

  const encoder = new TextEncoder()

  const newline = '\n'
  const delimiter = '\n\n'

  const randomNumbers = Array.from({ length: 100 }, () =>
    Math.floor(Math.random() * 10)
  )

  setTimeout(() => {
    randomNumbers.forEach((number, index) => {
      setTimeout(() => {
        void writer.write(
          encoder.encode(`id: ${new Date().getTime()}${newline}`)
        )
        void writer.write(encoder.encode(`event: message${newline}`))
        void writer.write(encoder.encode(`data: ${number}${delimiter}`))
      }, index * 1000)
    })
  }, 2000)

  return new Response(readable, {
    headers: {
      'Content-Type': 'text/event-stream',
      'Cache-Control': 'no-cache',
      Connection: 'keep-alive',
    },
    status: 200,
  })
}

export { handler as GET }
```

<!--
https://github.com/rafaelmaferreira/idc-ms-chatgpt/blob/main/webapp/src/app/api/messages/%5BmessageId%5D/events/route_example.txt
-->

<!-- ###

```ts
function handler(): Response {
  const { writable, readable } = new TransformStream()
  const writer = writable.getWriter()
  const encoder = new TextEncoder()

  setTimeout(async () => {
    void writer.write(
      encoder.encode(
        `data: ${JSON.stringify({
          message: 'open',
          time: new Date().toISOString(),
        })}\n\n`,
      ),
    )

    for (let i = 1; i <= 4; i++) {
      // await wait(2000)

      void writer.write(
        encoder.encode(
          `data: ${JSON.stringify({
            message: `hello:${i}`,
            time: new Date().toISOString(),
          })}\n\n`,
        ),
      )
    }

    await wait(2000)

    void writer.write(
      encoder.encode(
        `data: ${JSON.stringify({
          message: 'close',
          time: new Date().toISOString(),
        })}\n\n`,
      ),
    )

    await wait(5000)

    void writer.close()
  }, 100)

  return new Response(readable, {
    headers: {
      'Content-Type': 'text/event-stream',
      'Cache-Control': 'no-cache',
      Connection: 'keep-alive',
    },
    status: 200,
  })
}

export { handler as GET }
``` -->

## Issues

### TBD

```log
⨯ unhandledRejection: undefined
⨯ unhandledRejection: ResponseAborted
```

TODO

### TBD

```log
⨯ ReferenceError: EventSource is not defined
```
