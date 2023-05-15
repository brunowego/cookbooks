# Quarkus Micrometer

<!--
https://www.steadforce.com/blog/quarkus-microprofile-and-the-wonderful-world-of-metrics
-->

## Links

- [Grafana Dashboard: JVM Quarkus - Micrometer Metrics](https://grafana.com/grafana/dashboards/14370)

## TBD

```sh
#
mvn quarkus:add-extension \
  -Dextensions='micrometer, micrometer-registry-prometheus'
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080/metrics'
```
