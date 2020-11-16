# Ubuntu

## Derivative

- [Ubuntu MATE](https://ubuntu-mate.org/)
- [Lubuntu](https://lubuntu.net/)

## References

- [GSettings](/gsettings.md)

- [Fixing Ubuntu Freezing at Boot Time](https://itsfoss.com/fix-ubuntu-freezing/)
- [Releases Ubuntu from University of Kent Mirror Service](https://www.mirrorservice.org/sites/releases.ubuntu.com/18.04.3/)

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
# 20.x
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h ubuntu \
  --name ubuntu \
  --network workbench \
  docker.io/library/ubuntu:20.04 /bin/bash

# 18.x
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h ubuntu \
  --name ubuntu \
  --network workbench \
  docker.io/library/ubuntu:18.04 /bin/bash

#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h ubuntu \
  --name ubuntu \
  --network workbench \
  --privileged \
  docker.io/library/ubuntu:16.04 /sbin/init

##
docker exec -it ubuntu /bin/bash

## Remove
docker rm -f ubuntu
```

## Tips

### Setting Default Editor

```sh
sudo update-alternatives --config editor
```

### Create a bootable USB stick

#### Darwin

1. Open Disk Utility
2. Select External Device
   - Erase
     - Name: UBUNTU
     - Format: MS-DOS (FAT)
3. Open balenaEtcher
