# Pritunl

**Keywords:** OpenVPN, L2TP/IPsec, WireGuard

## Link

- [Code Repository](https://github.com/pritunl/pritunl)
- [Main Website](https://pritunl.com/)

## CLI

### Dependencies

```sh
#
docker network create workbench \
  --subnet 10.1.1.0/24

#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h mongodb \
  -v pritunl-zero-mongodb-data:/data/db \
  -v pritunl-zero-mongodb-configdb:/data/configdb \
  -e MONGO_INITDB_DATABASE='pritunl' \
  -p 27017:27017 \
  --name pritunl-zero-mongodb \
  --network workbench \
  docker.io/library/mongo:4.4.6
```

### Installation

```sh
#
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h pritunl \
  -e MONGO_URI='mongodb://pritunl-zero-mongodb:27017/pritunl' \
  -p 80:80 \
  -p 443:443 \
  -p 1194:1194 \
  --name pritunl \
  --network workbench \
  docker.io/library/alpine:3.14 /bin/sh

#
apk add -q --no-cache \
  go \
  git \
  gcc \
  musl-dev

#
export GOPATH='/go'

go get github.com/pritunl/pritunl-dns
go get github.com/pritunl/pritunl-web

cp /go/bin/* /usr/bin/

#
apk add -q --no-cache \
  wget \
  tar \
  python3 \
  python3-dev \
  py3-setuptools \
  py3-pip \
  libffi-dev \
  make \
  openssl-dev

#
export PRITUNL_VERSION='1.30.2847.71'

#
wget \
  -O - \
  "https://github.com/pritunl/pritunl/archive/${PRITUNL_VERSION}.tar.gz" | \
    tar -xzC /usr/src --transform s/-${PRITUNL_VERSION}//

#
( cd /usr/src/pritunl; python3 ./setup.py build; pip3 install -r ./requirements.txt; python3 ./setup.py install; )

#
apk add -q --no-cache \
  openssl

#
sed -ie '/^attributes/a prompt\t\t\t= yes' /etc/ssl/openssl.cnf
sed -ie '/^countryName_max/a countryName_value\t\t= UA' /etc/ssl/openssl.cnf

#
pritunl set-mongodb "$MONGO_URI"

#
pritunl default-password

#
pritunl start

#
echo -e '[INFO]\thttps://127.0.0.1'
```

### Remove

```sh
docker rm -f pritunl-zero-mongodb

docker volume rm \
  pritunl-zero-mongodb-data \
  pritunl-zero-mongodb-configdb
```

<!-- ### Issues

####

```log
FileNotFoundError: [Errno 2] No such file or directory: 'iptables-save'
``` -->
