# Service-Level Indicator (SLI)

## Metrics

| Type    | Specification   | Implementation                               | Implementation Query                                                                                                          |
| ------- | --------------- | -------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| Latency | Requests <500ms | Load balancer metrics scraped via Prometheus | `load_balancer_response_time_buckets{le="0.5", host="api"}` / ignoring (le) (`load_balancer_response_time_count{host="api"}`) |

## Common SLI Definitions

- Aggregation intervals (e.g. averaged over 30 seconds)
- Aggregation boundaries (e.g. all tasks in a cluster)
- Measurement frequency (e.g. every 5 seconds)
- Which requests are included in the indicator (e.g. all HTTP GET requests from black-box monitoring jobs)
- How data is acquired (e.g. from our monitoring service)
- How latency is measured (e.g. time to last byte)
