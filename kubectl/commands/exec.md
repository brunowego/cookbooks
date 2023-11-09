# kubectl-exec

## Usage

```sh
#
kubectl exec -it \
  $(kubectl get pod -l '<label>' -o jsonpath='{.items[0].metadata.name}' -n <namespace>) \
  -n <namespace> \
  -- /bin/bash
```
