# Helm Convert

## CLI

### Installation

```sh
helm plugin install 'https://github.com/ContainerSolutions/helm-convert'
```

### Commands

```sh
helm convert -h
```

### Usage

```sh
#
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

#
helm pull bitnami/mongodb --version 10.20.0
```

<!-- ```sh
#
helm show chart bitnami/mongodb --version 10.20.0
helm show values bitnami/mongodb --version 10.20.0
helm show readme bitnami/mongodb --version 10.20.0
helm show all bitnami/mongodb --version 10.20.0
``` -->

```sh
#
helm convert \
  --dep-up \
  -d ./mongodb \
  --name dev \
  --namespace mongodb-dev \
  ./mongodb-10.20.0.tgz

#
helm convert \
  --dep-up \
  -d ./kong \
  --name dev \
  --namespace kong-dev \
  'https://github.com/Kong/charts/releases/download/kong-1.10.0/kong-1.10.0.tgz'

#
helm convert \
  'https://s3-eu-west-1.amazonaws.com/coreos-charts/stable/prometheus-operator'

#
helm convert \
  -f values.yaml \
  bitnami/mongodb

#
helm convert \
  --set persistence.enabled=true \
  bitnami/mongodb
```

## Docker

### Running

```sh
docker run -it --rm \
  -v "$PWD"/kong:/kong \
  docker.io/containersol/helm-convert:v0.5.3 convert \
    --dep-up \
    -d /kong \
    --name dev \
    --namespace kong-dev \
    https://github.com/Kong/charts/releases/download/kong-1.10.0/kong-1.10.0.tgz
```
