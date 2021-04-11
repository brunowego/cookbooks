# Kubernetes Metrics Server

```sh
git clone https://github.com/kubernetes-incubator/metrics-server.git metrics-server && cd "$_"
```

```sh
kubectl apply -f deploy/1.8+
```

##

```sh
kubectl patch deploy -n kube-system metrics-server -p '{"spec":{"template":{"spec":{"containers":[{"name":"metrics-server","command":["/metrics-server","--v=2","--kubelet-insecure-tls","--kubelet-preferred-address-types=InternalIP"]}]}}}}'
```
