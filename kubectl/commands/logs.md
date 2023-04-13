# Kubectl Logs

**Keywords:** Kubernetes, Log Tailing

## Usage

```sh
#
kubectl logs \
  -l '<labels>' \
  -f

#
kubectl logs \
  -f \
  -l '<labels>' \
  --tail 50
```

## Tips

### Alternative

Prefer use [stern](/stern.md) instead of `kubectl logs -f` for log tailing.
