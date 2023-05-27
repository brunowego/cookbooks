# OpenTelemetry Instrumentation for Postgres

## Installation

```sh
# Using pnpm
pnpm add @opentelemetry/instrumentation-pg
```

<!--
'@opentelemetry/instrumentation-pg': {
  requestHook: (span, queryInfo) => {
    span.updateName(`pg: ${queryInfo.query.text.substring(0, 100)}`)
  },
},
-->
