# Helm Convert

## Installation

```sh
helm plugin install https://github.com/ContainerSolutions/helm-convert
```

## Commands

```sh
helm convert -h
```

## Usage

```sh
#
helm convert \
  --destination mongodb \
  --name mongodb \
  stable/mongodb

#
helm convert https://s3-eu-west-1.amazonaws.com/coreos-charts/stable/prometheus-operator

#
helm convert \
  -f values.yaml \
  stable/mongodb

#
helm convert \
  --set persistence.enabled=true \
  stable/mongodb
```
