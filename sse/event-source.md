# Event Source

**Keywords:** Fetch

<!--
https://github.com/aklivity/zilla
-->

## Articles

- [A Primer on Server-Sent Events (SSE)](https://aklivity.io/post/a-primer-on-server-sent-events-sse)
- [Using Fetch Event Source for server-sent events in React](https://blog.logrocket.com/using-fetch-event-source-server-sent-events-react/) (Old)

## Libraries

- [EventSource](https://developer.mozilla.org/en-US/docs/Web/API/EventSource)
- [Microsoft / Fetch Event Source](https://github.com/Azure/fetch-event-source) (Old)

## Tips

```ts
const eventSource = new EventSource('http://localhost:3000')

eventSource.onmessage = (event) => {
  console.log(event.data)
}
```

<!--
@microsoft/fetch-event-source
-->
