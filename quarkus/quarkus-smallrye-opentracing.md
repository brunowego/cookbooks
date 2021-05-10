# Quarkus SmallRye OpenTracing

## Links

- http://localhost:8080/q/metrics

##

```sh
#
./mvnw quarkus:add-extension \
  -Dextensions='quarkus-smallrye-opentracing'
```

```properties
quarkus.jaeger.server-name =
quarkus.jaeger.sampler-type = const
quarkus.jaeger.sampler-param = 1
quarkus.log.console.format =
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:16686'
```
