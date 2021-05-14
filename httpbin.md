# httpbin.org

<!--
https://github.com/zobzn/zobzn.com/blob/master/content/posts/curl.md
-->

## cURL

```sh
#
curl \
  -s \
  -X GET 'https://httpbin.org/get' \
  -H 'accept: application/json'
```

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h httpbin \
  -p 80:80 \
  --name httpbin \
  --network workbench \
  docker.io/kennethreitz/httpbin
```
