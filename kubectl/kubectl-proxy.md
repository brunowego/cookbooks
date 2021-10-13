# kubectl-proxy

## Guides

- [kube-proxy](https://kubernetes.io/docs/reference/command-line-tools-reference/kube-proxy/)

## CLI

### Commands

```sh
kubectl proxy -h
```

### Usage

```sh
#
kubectl proxy

#
kubectl proxy \
  --accept-hosts='^*$' \
  --address='0.0.0.0'

#
curl -s 'http://127.0.0.1:8001/api/v1/nodes?limit=500&resourceVersion=0' | jq
```
