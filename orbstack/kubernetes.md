# OrbStack with Kubernetes

<!--
*.k8s.orb.local
-->

## Using

```sh
#
orb start k8s

#
watch kubectl get pods -A

#
orb restart k8s

#
orb stop k8s

#
orb delete k8s -f
```

## Dependecies

- [NGINX Ingress Controller](/nginx/ingress-controller/README.md#helm)
- [Metrics Server](/kubernetes/metrics-server.md#helm)
