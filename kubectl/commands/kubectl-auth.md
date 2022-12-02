# kubectl-auth

## Commands

```sh
kubectl auth -h
```

## Usage

```sh
#
kubectl auth can-i --list
```

<!-- #
kubectl auth can-i list deployment --as=tiller
kubectl auth can-i list deployment --as=staging:tiller

kubectl -n monitoring auth can-i --list --as=system:serviceaccount:monitoring:prom-stack-grafana

alias k=kubectl
k create ns dev
k create role devr --resource=pods --verb=get -n=dev
k create rolebinding devrb --role=devr --user=system:serviceaccount:dev:default -n=dev # wrong syntax
k auth can-i get pods -n=dev --as=system:serviceaccount:dev:default  # right syntax
# yes


k create rolebinding devrb1 --role=devr --user=system:serviceaccount:dev:default -n=dev --dry-run=client -o yaml | grep subjects -A 4
# subjects:
# - apiGroup: rbac.authorization.k8s.io
#   kind: User
#   name: system:serviceaccount:dev:default

k create rolebinding devrb2 --role=devr --serviceaccount=dev:default -n=dev --dry-run=client -o yaml | grep subjects -A 4
# subjects:
# - kind: ServiceAccount
#   name: default
#   namespace: dev -->
