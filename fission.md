# Fission

## Helm

### References

- [Configuration](https://github.com/fission/fission/tree/master/charts#configuration)

### Install

```sh
kubectl create namespace fission
```

```sh
helm install https://github.com/fission/fission/releases/download/1.5.0/fission-all-1.5.0.tgz \
  -n fission \
  --namespace fission
```

### Status

```sh
kubectl rollout status deploy/controller -n fission
```

### Logs

```sh
kubectl logs -l 'application=fission-api' -n fission -f
```

### DNS

```sh
dig @10.96.0.10 controller.fission.svc.cluster.local +short
nslookup controller.fission.svc.cluster.local 10.96.0.10
```

### Secret

```sh
kubectl get secret influxdb \
  -o jsonpath='{.data.username}' \
  -n fission | \
    base64 --decode; echo

kubectl get secret influxdb \
  -o jsonpath='{.data.password}' \
  -n fission | \
    base64 --decode; echo
```

### Delete

```sh
helm delete fission --purge
kubectl delete namespace fission --grace-period=0 --force
```

## CLI

### Installation

#### Darwin

```sh
curl -L 'https://github.com/fission/fission/releases/download/1.5.0/fission-cli-osx' -o /usr/local/bin/fission && chmod +x /usr/local/bin/fission
```

#### Linux

```sh
curl -L 'https://github.com/fission/fission/releases/download/1.5.0/fission-cli-linux' -o /usr/local/bin/fission && chmod +x /usr/local/bin/fission
```

### Commands

```sh
fission -h
```

### Examples

#### Hello

```sh
fission env create \
  --name nodejs \
  --image fission/node-env

fission env list

fission function create \
  --name hello \
  --env nodejs \
  --code <(curl https://raw.githubusercontent.com/fission/fission/master/examples/nodejs/hello.js)

fission function list

fission function test --name hello

fission function delete --name hello

fission env delete --name nodejs
```
