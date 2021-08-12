# Kubernetes Operations (kOps) Instance Group (IG)

## Tips

###

```sh
#
export KOPS_STATE_STORE='s3://k8s-kops-state-store'
# Good pattern [cluster-name]-[region].k8s.local
export KOPS_CLUSTER_NAME='dev01-us-east-1.k8s.local' # prod01, stg01, uat01

#
kubectl drain [name] \
  --ignore-daemonsets \
  --delete-local-data

#
kubectl delete node [name]

#
kops get ig

#
kops get ig \
  --name "$KOPS_CLUSTER_NAME" \
  -o yaml \
  nodes-us-east-1a

#
kops edit ig \
  --name "$KOPS_CLUSTER_NAME" \
  nodes-us-east-1a

#
kops \
  --name "$KOPS_CLUSTER_NAME" \
  update cluster \
    --yes

#
kops \
  --name "$KOPS_CLUSTER_NAME" \
  rolling-update cluster \
    --yes

#
kops \
  --name "$KOPS_CLUSTER_NAME" \
  validate cluster
```

<!-- ## Issues

###

```log
Machine	i-04e6420c3615e1b15		machine "i-04e6420c3615e1b15" has not yet joined cluster
Node	ip-10-96-88-13.ec2.internal	node "ip-10-96-88-13.ec2.internal" of role "node" is not ready
Validation failed: cluster not yet healthy
```

TODO -->
