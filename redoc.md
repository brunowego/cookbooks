# Redoc

<!--
https://github.com/osscameroon/prolang-api/blob/main/frontend/pages/documentation.tsx
-->

**Keywords:** OpenAPI, Swagger

## Links

- [Code Repository](https://github.com/Redocly/redoc)
- [Main Website](https://redocly.com)
- [Demo](https://redocly.github.io/redoc)
- [Application](https://app.redocly.com)
- [API Reference](https://api-reference.rebilly.com)

## CLI

### Commands

```sh
npx redoc-cli -h
```

<!-- ### Usage

```sh
#
redoc-cli serve

#
redoc-cli build

#
redoc-cli bundle
``` -->

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h redoc \
  -e SPEC_URL='https://petstore.swagger.io/v2/swagger.json' \
  -p 8080:80 \
  --name redoc \
  --network workbench \
  docker.io/redocly/redoc:v2.0.0
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

### Remove

```sh
docker rm -f redoc
```
