# Remove

## Container

```sh
docker rm [container]
```

### Quitted

```sh
docker rm $(docker ps -aq)
```

### Exited

```sh
docker rm $(docker ps -aq --no-trunc --filter 'status=exited')
```

## Filter

```sh
docker rmi $(docker images --all | grep '[text]')
```
