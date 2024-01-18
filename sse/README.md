# Server-Sent Events (SSE)

**Keywords:** EventSource, EventStream, One Way Messaging

## Links

- [Wikipedia](https://en.wikipedia.org/wiki/Server-sent_events)

## Articles

- [Introducing support for server-sent events in Postman](https://blog.postman.com/support-for-server-sent-events/)

<!--
https://postman.com/postman/workspace/published-postman-templates/request/631643-32d503c6-d163-4f7c-8cd0-bf7ea3f56b3f
-->

## Tools

- Testing
  - [Gatling](https://gatling.io/docs/gatling/reference/current/http/sse/)

<!--
https://github.com/open-source-labs/Swell
-->

| Server-Sent Events      | WebSockets           |
| ----------------------- | -------------------- |
| Uni-directional         | Bi-directional       |
| 6 conn. per browser     | No limit             |
| Easier (Limited)        | Complex (Extensible) |
| UTF-8 text only         | Can send binary data |
| Great for push notific. | Great for chat apps  |

## Videos

- [Server-Sent Events | Postman Level Up](https://youtube.com/watch?v=KrE044J8jEQ)

## Libraries

- Node.js
  - [event-source-polyfill](https://github.com/Yaffle/EventSource)
  - [eventsource-parser](https://github.com/rexxars/eventsource-parser)

## Tips

### Testing

```sh
#
curl -H 'Accept:text/event-stream' https://postman-echo.com/server-events/10

#
curl -N http://localhost:3000/sse
```

<!--
https://ably.com/docs/api/sse
-->
