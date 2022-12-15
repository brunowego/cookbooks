# secureCodeBox (SCB) Operator

## Links

- [Code Repository](https://github.com/secureCodeBox/secureCodeBox/tree/main/operator)

## kubectl

## Usage

```sh
#
kubectl get scheduledscans

#
kubectl get scans -A
```

## Helm

### Dependencies

- Mail Server
  - [MailHog](/mailhog.md#helm) (local)

### References

- [Values](https://github.com/secureCodeBox/secureCodeBox/tree/main/operator#values)

### Repository

```sh
helm repo add securecodebox 'https://charts.securecodebox.io'
helm repo update
```

### Install

```sh
#
kubectl create ns securecodebox-system
# kubectl create ns security

#
helm search repo -l securecodebox/operator

#
helm install operator securecodebox/operator \
  --namespace securecodebox-system \
  --version 3.15.2

#
kubectl get all -n securecodebox-system
```

### Status

```sh
kubectl rollout status deployment/securecodebox-controller-manager \
  -n securecodebox-system
```

### Logs

```sh
kubectl logs \
  -l 'control-plane=securecodebox-controller-manager' \
  -n securecodebox-system \
  -f
```

### Delete

```sh
helm uninstall operator \
  -n securecodebox-system

kubectl delete ns securecodebox-system \
  --grace-period=0 \
  --force
```
