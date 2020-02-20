# Redis High Availability

TODO

```sh
helm install stable/redis-ha -n redis \
  --set replicas=2 \
  --set securityContext.runAsUser=0 \
  --set securityContext.runAsNonRoot=false
```
