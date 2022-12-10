# Kubernetes Namespace

## Tips

### Status Phase Terminating

```sh
#
kubectl get ns \
  --field-selector status.phase=Terminating \
  --no-headers | \
    awk '{print $1}'
```

### Delete through REST API

```sh
#
kubectl proxy
```

#### Single

```sh
#
export KUBERNETES_NAMESPACE=''

#
kubectl get ns "$KUBERNETES_NAMESPACE" -o json | \
  jq '.spec.finalizers=[]' | \
    curl \
      -X PUT \
      -H 'Content-Type: application/json' \
      --data @- \
      "http://localhost:8001/api/v1/namespaces/${KUBERNETES_NAMESPACE}/finalize"
```

#### Batch

```sh
#
kubectl get ns \
  --field-selector status.phase=Terminating \
  --no-headers | \
    awk '{print $1}' | \
      xargs -I '{}' -- sh -c 'kubectl get ns "{}" -o json | jq ".spec.finalizers=[]" | curl -X PUT -H "Content-Type: application/json" --data @- "http://localhost:8001/api/v1/namespaces/{}/finalize"'
```
