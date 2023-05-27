# Extend with OpenTelemetry (OTel)

## Links

- [OpenTelemetry NestJS Instrumentation for Node.js](https://github.com/open-telemetry/opentelemetry-js-contrib/tree/main/plugins/node/opentelemetry-instrumentation-nestjs-core)

## Guides

- [NestJS tracing with Open Telemetry: A how-to guide with examples](https://tomray.dev/nestjs-open-telemetry)
- [OpenTelemetry Nestjs Auto-Instrumentation Guide](https://signoz.io/blog/opentelemetry-nestjs)

<!--
https://darraghoriordan.com/2022/08/07/open-telemetry-nest-js/
-->

## Videos

- [NestJS - Monitoring your NestJS Application using OpenTelemetry and SigNoz](https://youtube.com/watch?v=tpNDrJAjcto)

## gRPC

**Refer:** `./.env`

```env
OTEL_EXPORTER_OTLP_PROTOCOL=grpc
OTEL_EXPORTER_OTLP_ENDPOINT=http://127.0.0.1:4317
```

**Refer:** `./src/tracing.ts`

```ts
import { diag, DiagConsoleLogger, DiagLogLevel } from '@opentelemetry/api'
import { NodeSDK } from '@opentelemetry/sdk-node'
import { getNodeAutoInstrumentations } from '@opentelemetry/auto-instrumentations-node'
import { ExpressInstrumentation } from '@opentelemetry/instrumentation-express'
import { NestInstrumentation } from '@opentelemetry/instrumentation-nestjs-core'
import { PrismaInstrumentation } from '@prisma/instrumentation'
import { Resource } from '@opentelemetry/resources'
import { SemanticResourceAttributes } from '@opentelemetry/semantic-conventions'
import { OTLPTraceExporter } from '@opentelemetry/exporter-trace-otlp-grpc'

diag.setLogger(new DiagConsoleLogger(), DiagLogLevel.INFO)

const otelSDK = new NodeSDK({
  instrumentations: [
    getNodeAutoInstrumentations(),
    new ExpressInstrumentation(),
    new NestInstrumentation(),
    new PrismaInstrumentation(),
  ],
  resource: new Resource({
    [SemanticResourceAttributes.SERVICE_NAME]: 'api',
  }),
  traceExporter: new OTLPTraceExporter(),
})

export default otelSDK
```

## HTTP

**Refer:** `./.env`

```env
OTEL_EXPORTER_OTLP_PROTOCOL=http
OTEL_EXPORTER_OTLP_ENDPOINT=http://127.0.0.1:4318
```

**Refer:** `./src/tracing.ts`

```ts
import { diag, DiagConsoleLogger, DiagLogLevel } from '@opentelemetry/api'
import { NodeSDK } from '@opentelemetry/sdk-node'
import { getNodeAutoInstrumentations } from '@opentelemetry/auto-instrumentations-node'
import { ExpressInstrumentation } from '@opentelemetry/instrumentation-express'
import { NestInstrumentation } from '@opentelemetry/instrumentation-nestjs-core'
import { PrismaInstrumentation } from '@prisma/instrumentation'
import { Resource } from '@opentelemetry/resources'
import { SemanticResourceAttributes } from '@opentelemetry/semantic-conventions'
import { OTLPTraceExporter } from '@opentelemetry/exporter-trace-otlp-http'

diag.setLogger(new DiagConsoleLogger(), DiagLogLevel.INFO)

const otelSDK = new NodeSDK({
  instrumentations: [
    getNodeAutoInstrumentations(),
    new ExpressInstrumentation(),
    new NestInstrumentation(),
    new PrismaInstrumentation(),
  ],
  resource: new Resource({
    [SemanticResourceAttributes.SERVICE_NAME]: 'api',
  }),
  traceExporter: new OTLPTraceExporter(),
})

export default otelSDK
```

**Refer:** `./src/main.ts`

```ts
// ...
import otelSDK from './tracing'
// ...

async function bootstrap() {
  await otelSDK.start()

  // ...
}
bootstrap()
```

<!--
process.on('SIGTERM', () => {
  otelSDK
    .shutdown()
    .then(
      () => console.log('SDK shut down successfully'),
      (err) => console.log('Error shutting down SDK', err)
    )
    .finally(() => process.exit(0))
})
-->
