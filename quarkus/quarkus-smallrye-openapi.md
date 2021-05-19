# Quarkus SmallRye OpenAPI

## Links

- http://localhost:8080/q/swagger-ui/

##

```sh
#
mvn quarkus:add-extension \
  -Dextensions='smallrye-openapi'
```

<!-- ```ini
quarkus.swagger-ui.enable = true
``` -->

```ini
mp.openapi.extensions.smallrye.info.title = Example API
%dev.mp.openapi.extensions.smallrye.info.title = Example API (development)
%test.mp.openapi.extensions.smallrye.info.title = Example API (test)
mp.openapi.extensions.smallrye.info.version = 0.0.1
mp.openapi.extensions.smallrye.info.description = My description

quarkus.swagger-ui.always-include = true
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080/swagger-ui/'
```
