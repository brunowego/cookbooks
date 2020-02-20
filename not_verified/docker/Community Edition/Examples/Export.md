# Export

## Images

```sh
export DOCKER_IMAGES="[image[:tag]] ..."

# all images
export DOCKER_IMAGES="$(docker images | sed '1d' | awk '{print $1 ":" $2 }')"
```

### Manual

```sh
# export image
docker save $DOCKER_IMAGES --output docker-images.tar

# import image
docker load --input docker-images.tar
```

### Directly

```sh
# remote host
export REMOTE_HOST="${USER}@[IP]"

docker save "$DOCKER_IMAGES" | bzip2 | ssh "$REMOTE_HOST" 'bunzip2 | docker load'

# minikube
docker save "$DOCKER_IMAGES" | bzip2 | (eval "$(minikube docker-env)" && docker load)

# Docker Machine
docker save "$DOCKER_IMAGES" | bzip2 | (eval "$(docker-machine env)" && docker load)
```
