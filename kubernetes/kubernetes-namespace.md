# Kubernetes Namespace

## Tips

### Delete

#### REST API

```sh
#
kubectl proxy

#
kubectl get ns --field-selector status.phase=Terminating | \
  awk '{print $1}'

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
