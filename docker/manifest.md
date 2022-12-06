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
