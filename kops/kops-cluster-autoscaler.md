# Kubernetes Operations (kOps) Cluster Autoscaler

TODO

<!--
us-east-1.prod.my-cluster.k8s.local
-->

<!-- ## Tips

###

```sh
#
export KOPS_STATE_STORE='s3://k8s-kops-state-store'

# Get first cluster description
kops get cluster \
  -o json | \
    jq

# Good pattern [cluster-name]-[region].k8s.local
export KOPS_CLUSTER_NAME='dev01-us-east-1.k8s.local' # prod01, stg01, uat01

#
kops get ig

#
export KOPS_NODE_NAME='nodes-us-east-1a'

#
kops get ig \
  -o yaml \
  "$KOPS_NODE_NAME" > \
    "./${KOPS_NODE_NAME}.yaml"

#
yq w -i "./${KOPS_NODE_NAME}.yaml" spec.minSize 2
yq w -i "./${KOPS_NODE_NAME}.yaml" spec.maxSize 50
yq w -i "./${KOPS_NODE_NAME}.yaml" spec.cloudLabels[k8s.io/cluster-autoscaler/enabled] '""'
yq w -i "./${KOPS_NODE_NAME}.yaml" spec.cloudLabels[k8s.io/cluster-autoscaler/${KOPS_CLUSTER_NAME}] '""'

#
kops edit ig "$KOPS_NODE_NAME"

#
kops update cluster \
  --admin \
  --yes

#
kops rolling-update cluster \
  --instance-group "$KOPS_NODE_NAME" \
  --yes

#
kops validate cluster
``` -->
