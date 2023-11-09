# Init Containers

## Links

- [Code Repository](https://kubernetes.io/docs/concepts/workloads/pods/init-containers)

## Tips

### Wait For It

```yml
---
apiVersion: apps/v1
kind: Deployment
# ...
spec:
  template:
    spec:
      initContainers:
        - name: wait-for-database
          image: docker.io/toschneck/wait-for-it:latest
          command:
            [
              sh,
              -c,
              ./wait-for-it.sh -t 0 <service>.<namespace>.svc.cluster.local:<port>,
            ]
```
