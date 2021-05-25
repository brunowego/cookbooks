# Quarkus SmallRye OpenAPI

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
mp.openapi.extensions.smallrye.info.version = 0.0.1
mp.openapi.extensions.smallrye.info.description = My description
```

```sh
#
export MP_OPENAPI_EXTENSIONS_SMALLRYE_INFO_TITLE='Example API (development)'

#
export MP_OPENAPI_EXTENSIONS_SMALLRYE_INFO_TITLE='Example API (test)'
```

```ini
quarkus.swagger-ui.always-include = true
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080/swagger-ui/'
```
