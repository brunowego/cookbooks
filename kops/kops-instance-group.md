# Kubernetes Operations (kOps) Instance Group (IG)

<!--
c5.2xlarge 10 gb
-->

## Tips

### Edit Instance Group (IG)

```sh
#
aws s3 ls

#
export KOPS_STATE_STORE='s3://k8s-kops-state-store'

# Get first cluster description
kops get cluster \
  -o json | \
    jq -r '.[].metadata.name'

# Good pattern [cluster-name]-[region].k8s.local
export KOPS_CLUSTER_NAME='dev01-us-east-1.k8s.local' # prod01, stg01, uat01

#
kops get ig

#
export KOPS_NODE_NAME='nodes-us-east-1a'

#
kops get ig \
  -o yaml \
  "$KOPS_NODE_NAME"

#
kops edit ig "$KOPS_NODE_NAME"

#
kops update cluster \
  --admin

#
kops rolling-update cluster \
  --instance-group "$KOPS_NODE_NAME" \
  --validation-timeout 30m \
  --yes

#
kops validate cluster --wait 10m
```

<!--
c5a.4xlarge
c5a.2xlarge

t3.large
-->

### Delete Node

```sh
#
aws s3 ls

#
export KOPS_STATE_STORE='s3://k8s-kops-state-store'

# Get first cluster description
kops get cluster \
  -o json | \
    jq -r '.[].metadata.name'

# Good pattern [cluster-name]-[region].k8s.local
export KOPS_CLUSTER_NAME='dev01-us-east-1.k8s.local' # prod01, stg01, uat01

#
kubectl drain [name] \
  --ignore-daemonsets \
  --delete-local-data

#
kubectl delete node [name]
```

## Issues

### Force Rolling Update

```log
No rolling-update required.
```

```sh
kops rolling-update cluster \
  --force \
  --instance-group "$KOPS_NODE_NAME" \
  --validation-timeout 30m \
  --yes
```

<!-- ###

```log
Machine	i-04e6420c3615e1b15		machine "i-04e6420c3615e1b15" has not yet joined cluster
Node	ip-10-96-88-13.ec2.internal	node "ip-10-96-88-13.ec2.internal" of role "node" is not ready
Validation failed: cluster not yet healthy
```

TODO -->
