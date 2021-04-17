# Volume

## Create

```sh
docker volume create [volume]
```

## Inspect

```sh
docker volume inspect [volume]
```

## List Volumes

```sh
docker volume ls
```

```sh
docker volume ls -qf dangling=true
```

## Remove

```sh
docker volume rm [volume]
```

```sh
docker volume rm $(docker volume ls -qf dangling=true)
```

```sh
docker volume ls -qf dangling=true | xargs -r docker volume rm
```

## Create Backup Point

```sh
docker run -it --rm \
  -v $(pwd):/backup \
  [image] /bin/bash
```

## Remove All Volumes

```sh
docker volume prune
```

## Show Data

### Linux

```sh
sudo ls -la /var/lib/docker/volumes
```

#### Docker Machine

```sh
docker-machine ssh
```

### Darwin

```sh
screen ~/Library/Containers/com.docker.docker/Data/vms/0/tty
```

```sh
ls -la /var/lib/docker/volumes
```

```sh
screen -ls
screen -X -S [session] kill
```
