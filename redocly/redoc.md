# Redoc

<!--
https://github.com/osscameroon/prolang-api/blob/main/frontend/pages/documentation.tsx
-->

**Keywords:** OpenAPI, Swagger

## Links

- [Code Repository](https://github.com/Redocly/redoc)
- [Demo](https://redocly.github.io/redoc)

## CLI

### Commands

```sh
npx redoc-cli -h
```

### Installation

```sh
# Using pnpm
pnpm add redoc-cli -D
```

<!-- ### Usage

```sh
#
redoc-cli lint ./openapi.json

#
redoc-cli serve ./openapi.json

#
redoc-cli build ./openapi.json

#
redoc-cli bundle
``` -->

<!-- **Refer** `./.redocly.yaml`

```yml
---
lint:
  extends:
    - recommended # This is the default (and built in) configuration. If it is too strict, try `minimal`.

  rules:
    no-sibling-refs:
      severity: error

    no-unused-components:
      severity: error

    boolean-parameter-prefixes:
      severity: error
      prefixes: ['should', 'is', 'has']

  referenceDocs:
    pagination: section
    showConsole: true
    theme:
      menu:
        backgroundColor: '#ffffff'
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
