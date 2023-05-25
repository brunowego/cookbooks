# OpenTelemetry Collector

## Links

- [Code Repository](https://github.com/open-telemetry/opentelemetry-collector)
- [Docs](https://opentelemetry.io/docs/collector)

## Port Mappings

| Protocol | Port  | Description                                 |
| -------- | ----- | ------------------------------------------- |
| TCP      | 1888  | `pprof` extension                           |
| TCP      | 8888  | Prometheus metrics exposed by the collector |
| TCP      | 8889  | Prometheus exporter metrics                 |
| TCP      | 13133 | `health_check` extension                    |
| TCP      | 4317  | OTLP gRPC receiver                          |
| TCP      | 4318  | OTLP HTTP receiver                          |
| TCP      | 55679 | zPages extension                            |

## Docker Compose

```yml
---
version: '3'

services:
  otelcol:
    image: docker.io/otel/opentelemetry-collector:0.78.0
    container_name: boilerplate-otelcol
    volumes:
      - type: bind
        source: ./config/otelcol/otel-collector.yml
        target: /etc/otelcol-contrib/config.yaml
    ports:
      - target: 4317
        published: 4317
        protocol: tcp
      # - target: 4318
      #   published: 4318
      #   protocol: tcp
    restart: unless-stopped

  jaeger:
    image: docker.io/jaegertracing/all-in-one:1.45.0
    volumes:
      - type: volume
        source: jaeger-tmp
        target: /tmp
    ports:
      - target: 16686
        published: $JAEGER_PORT
        protocol: tcp
    restart: unless-stopped

volumes:
  jaeger-tmp:
    driver: local
```
