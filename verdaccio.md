# Verdaccio

**Keywords:** Local NPM Registry

## Links

- [Code Repository](https://github.com/verdaccio/verdaccio)
- [Main Website](https://verdaccio.org)

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h verdaccio \
  -v verdaccio-conf:/verdaccio/conf \
  -v verdaccio-storage:/verdaccio/storage \
  -v verdaccio-plugins:/verdaccio/plugins \
  -p 4873:4873 \
  --name verdaccio \
  verdaccio/verdaccio:nightly-master
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:4873'
```

<!-- ### Using

```sh
#
npm set registry http://localhost:4873
npm install
# or
NPM_CONFIG_REGISTRY=http://localhost:4873 npm install
``` -->

<!--
.npmrc

registry=https://registry.npmjs.org
@medusajs:registry=http://localhost:4873
-->

### Remove

```sh
docker rm -f verdaccio
docker volume rm verdaccio-conf verdaccio-storage verdaccio-plugins
```
