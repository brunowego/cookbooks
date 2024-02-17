# Docker Manifest

## Tips

```sh
#
export DOCKER_CLI_EXPERIMENTAL='enabled'

#
docker manifest inspect \
  -v \
  docker.io/library/alpine:latest | \
    jq '.[] | select(.Descriptor.platform.architecture=="amd64") | .SchemaV2Manifest.layers[].size'

#
docker manifest inspect \
  docker.io/jupyter/base-notebook:latest | \
    jq '[.layers[].size] | add'
```

<!--
HEALTHCHECK --interval=5s --timeout=5s CMD <command>

curl -f http://localhost/ping || exit 1
curl --silent http://127.0.0.1:80/fpm-ping | grep -q pong || exit 1
echo PING | nc 127.0.0.1 3000 | grep PONG
wget --quiet --output-document - http://localhost:1787/ping
-->
