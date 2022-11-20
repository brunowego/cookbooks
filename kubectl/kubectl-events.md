# Kubectl Events

**Keyword:** Kubernetes Warnings

## Usage

```sh
# Watch the events
kubectl get events --watch

# Get all warning events
kubectl get events -A --field-selector type!=Normal
kubectl get events -A --field-selector type=Warning

# Count warning events
kubectl get events \
  -A \
  --field-selector type!=Normal \
  -o json | \
    jq '.items | length'

# Delete events in a namespace
kubectl delete event --all -n <namespace>
kubectl delete event --all -A

kubectl delete event \
  --all \
  -n <namespace> \
  --field-selector type!=Normal
```
