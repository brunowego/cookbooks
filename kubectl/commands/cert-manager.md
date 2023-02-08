# kubectl-cert-manager

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
kubectl cert-manager check api

#
kubens '<namespace>'

#
kubectl get certificates -o wide

#
kubectl describe certificate '<cert-name>'

#
kubectl cert-manager status certificate '<cert-name>'

#
kubectl get certificaterequest

#
kubectl describe certificaterequest '<cert-req-id>'

#
kubectl delete certificaterequest '<cert-req-id>'

#
kubectl cert-manager renew '<cert-name>'
```

## Isseus

### TBD

```log
Issuing certificate as Secret does not exist
```

```log
E0203 13:27:22.866527       1 sync.go:190] cert-manager/challenges "msg"="propagation check failed" "error"="wrong status code '503', expected '200'" "dnsName"="sandbox.londonbridge.dev" "resource_kind"="Challenge" "resource_name"="sandbox.tls-secret-hg5pb-2980591003-1675047681" "resource_namespace"="sandbox" "resource_version"="v1" "type"="HTTP-01"
```

```sh
#
kubectl describe pod -l acme.cert-manager.io/http01-solver=true
```

<!--
#
export INGRESS_HOST="$(kubectl get ingress -l acme.cert-manager.io/http01-solver=true -o jsonpath='{.items[0].spec.rules[0].host}')"
export INGRESS_PATH="$(kubectl get ingress -l acme.cert-manager.io/http01-solver=true -o jsonpath='{.items[0].spec.rules[0].http.paths[0].path}')"

curl http://"$INGRESS_HOST""$INGRESS_PATH"
-->
