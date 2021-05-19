# Quarkus Micrometer

<!--
https://www.steadforce.com/blog/quarkus-microprofile-and-the-wonderful-world-of-metrics
-->

##

```sh
#
mvn quarkus:add-extension \
  -Dextensions='micrometer, micrometer-registry-prometheus'
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080/metrics'
```
