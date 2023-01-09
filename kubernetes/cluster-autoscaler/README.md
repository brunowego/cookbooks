# Kubernetes Autoscaler (a.k.a Cluster Autoscaler)

<!--
https://github.com/aws/karpenter
-->

## Links

- [Code Repository](https://github.com/kubernetes/autoscaler)

## Helm

### References

- [Values](https://github.com/kubernetes/autoscaler/tree/master/charts/cluster-autoscaler#values)

### Repository

```sh
helm repo add autoscaler 'https://kubernetes.github.io/autoscaler'
helm repo update
```

### Install

```sh
#
helm search repo -l autoscaler/cluster-autoscaler

#
helm install cluster-autoscaler autoscaler/cluster-autoscaler \
  --namespace kube-system \
  --version 9.21.1 \
  -f <(cat << EOF
autoDiscovery:
  clusterName: develop.my-cluster.k8s.local

awsRegion: us-east-1

cloudProvider: aws

podAnnotations:
  cluster-autoscaler.kubernetes.io/safe-to-evict: 'false'
  prometheus.io/scrape: 'true'
  prometheus.io/port: '8085'

tolerations:
  - effect: NoSchedule
    key: node-role.kubernetes.io/master
  - operator: Exists
    key: CriticalAddonsOnly
EOF
)
```

### Status

```sh
kubectl rollout status deployment/cluster-autoscaler-aws-cluster-autoscaler \
  -n kube-system
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=cluster-autoscaler' \
  -n kube-system \
  -f
```

### Issues

#### TBD

```log
F0109 00:30:56.623590       1 aws_cloud_provider.go:369] Failed to generate AWS EC2 Instance Types: WebIdentityErr: failed to retrieve credentials
```

TODO

#### TBD

```log
pod didn't trigger scale-up (it wouldn't fit if a new node is added): 2 node(s) didn't have free ports for the requested pod ports, 2 node(s) didn't match node selector
```

TODO

### Delete

```sh
helm uninstall cluster-autoscaler \
  -n kube-system
```

<!--
kubectl annotate deployment.apps/cluster-autoscaler \
  cluster-autoscaler.kubernetes.io/safe-to-evict="false" \
  -n kube-system
-->
