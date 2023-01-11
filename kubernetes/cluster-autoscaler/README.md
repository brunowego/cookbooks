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
  clusterName: lb-internal01

awsAccessKeyID:

awsRegion: us-east-1

awsSecretAccessKey:

cloudProvider: aws

extraArgs:
  balance-similar-node-groups: true
  skip-nodes-with-local-storage: false

rbac:
  serviceAccount:
    annotations:
      eks.amazonaws.com/role-arn: arn:aws:iam::333449929724:role/cluster-autoscaler20230108215228644000000002
    create: true
    name: cluster-autoscaler

securityContext:
  fsGroup: 65534
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
F0110 10:00:58.726892       1 aws_cloud_provider.go:369] Failed to generate AWS EC2 Instance Types: WebIdentityErr: failed to retrieve credentials
```

TODO

#### TBD

```log
E0110 12:56:26.742792       1 aws_manager.go:258] Failed to regenerate ASG cache: cannot autodiscover ASGs: WebIdentityErr: failed to retrieve credentials
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
