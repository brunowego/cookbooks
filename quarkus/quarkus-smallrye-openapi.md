# Quarkus SmallRye OpenAPI

## Links

- http://localhost:8080/q/swagger-ui/

##

```sh
#
./mvnw quarkus:add-extension \
  -Dextensions='smallrye-openapi'
```

```properties
quarkus.swagger-ui.enable = true
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080/swagger-ui/'
```
