# CentOS

## References

- [Mirror CentOS 7 (x86_64)](http://mirror.centos.org/centos/7/os/x86_64/Packages/)

## Repositories

### Extra Packages for Enterprise Linux (EPEL)

```sh
yum check-update
sudo yum -y install epel-release
```

### Software Collections

```sh
yum check-update
sudo yum -y install centos-release-scl
```

### Webtatic (Includes EPEL)

```sh
yum check-update
sudo yum -y localinstall https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
```

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
# 8.x
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h centos \
  --name centos \
  --network workbench \
  docker.io/library/centos:8.2.2004 /bin/bash

# 7.x
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h centos \
  --name centos \
  --network workbench \
  docker.io/library/centos:7.6.1810 /bin/bash

#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h centos \
  --name centos \
  --network workbench \
  --privileged \
  docker.io/library/centos:7.6.1810 /sbin/init

##
docker exec -it centos /bin/bash

## Remove
docker rm -f centos
```
