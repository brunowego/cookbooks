# Quarkus SmallRye OpenTracing

## Links

- http://localhost:8080/q/metrics

##

```sh
#
mvn quarkus:add-extension \
  -Dextensions='smallrye-opentracing'
```

```ini
quarkus.jaeger.server-name =
quarkus.jaeger.sampler-type = const
quarkus.jaeger.sampler-param = 1
quarkus.jaeger.endpoint = http://localhost:14268/api/traces
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:16686'
```

##

```xml
<io.opentracing.contrib.version>0.2.15</io.opentracing.contrib.version>

<dependency>
  <groupId>io.opentracing.contrib</groupId>
  <artifactId>opentracing-jdbc</artifactId>
  <version>${io.opentracing.contrib.version}</version>
</dependency>
```

```ini
quarkus.datasource.jdbc.driver = io.opentracing.contrib.jdbc.TracingDriver
quarkus.datasource.jdbc.url = jdbc:tracing:postgresql://localhost:5432/dev
```
