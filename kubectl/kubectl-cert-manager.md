## kubectl-cert-manager

## Related

- [cert-manager](/cert-manager/README.md)

## Installation

### Krew

```sh
kubectl krew install cert-manager
```

## Commands

```sh
kubectl cert-manager help
```

## Usage

```sh
#
kubens <ns-name>

#
kubectl cert-manager check api

#
kubectl get certificates -o wide

#
kubectl cert-manager status certificate <cert-name>

#
kubectl get certificaterequest

#
kubectl delete certificaterequest <cert-req-id>

#
kubectl get certificates -o wide

#
kubectl cert-manager renew <cert-name>

#
kubectl get certificaterequest

#
kubectl describe certificaterequest <cert-req-id>
```
