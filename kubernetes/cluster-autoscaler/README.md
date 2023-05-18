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
kubens kube-system

#
helm search repo -l autoscaler/cluster-autoscaler

#
helm install cluster-autoscaler autoscaler/cluster-autoscaler \
  --version 9.21.1 \
  -f <(cat << EOF
autoDiscovery:
  clusterName: org-internal01

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
      eks.amazonaws.com/role-arn: arn:aws:iam::<account-id>:role/<id>
    create: true
    name: cluster-autoscaler

securityContext:
  fsGroup: 65534
EOF
)
```

### Status

```sh
kubectl rollout status deployment/cluster-autoscaler-aws-cluster-autoscaler
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=cluster-autoscaler' \
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

#### Not Trigger Scale Up

```log
Normal   NotTriggerScaleUp  56s   cluster-autoscaler  pod didn't trigger scale-up: 3 node(s) didn't match Pod's node affinity/selector, 1 node(s) had volume node affinity conflict
```

Try scale node group to 3 nodes.

### Delete

```sh
helm uninstall cluster-autoscaler
```

<!--
kubectl annotate deployment.apps/cluster-autoscaler \
  cluster-autoscaler.kubernetes.io/safe-to-evict="false"
-->
